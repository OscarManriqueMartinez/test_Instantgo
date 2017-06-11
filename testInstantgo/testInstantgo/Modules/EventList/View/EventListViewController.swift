//
//  EventListViewController.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 10/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//


import UIKit
import EventKit


protocol EventListViewControllerProtocol: class, BaseViewControllerProtocol {
    
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func set(presenter: EventListPresenterProtocol)
    
    func show(events: [EventViewModel])
}


class EventListViewController: BaseViewController, EventListViewControllerProtocol {
  
    // MARK: Properties
    
    private var presenter: EventListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    private let eventStore = EKEventStore()
    fileprivate var events: [EventViewModel] = []
    
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        tableView.register(UINib(nibName: Constants.eventCellNibName, bundle: nil), forCellReuseIdentifier: Constants.eventCellReuseIdentifier)
        
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "events".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkCalendarAuthorizationStatus()
    }
    
    
    // MARK: - Private method
    
    
    private func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status) {
        case EKAuthorizationStatus.notDetermined:
            // This happens on first-run
            requestAccessToCalendar()
            
        case EKAuthorizationStatus.authorized:
            // Things are in line with being able to show the calendars in the table view
            presenter?.loadEvents()
            
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            // We need to help them give us permission
            
            self.present(AlertFactory.alertOpenSettings(action: {
                UIApplication.shared.open(URL(string:UIApplicationOpenSettingsURLString)!)
            }), animated: true, completion: nil)
        }
    }
    
    private func requestAccessToCalendar() {
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            
            if accessGranted == true {
                DispatchQueue.main.async(execute: {
                    self.presenter?.loadEvents()
                    
                })
                
            } else {
                DispatchQueue.main.async(execute: {
                    self.present(AlertFactory.alertOpenSettings(action: {
                        UIApplication.shared.open(URL(string:UIApplicationOpenSettingsURLString)!)
                    }), animated: true, completion: nil)
                })
            }
        })
    }
    
    
    // MARK: - EventListViewProtocol
    
    func set(presenter: EventListPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func show(events: [EventViewModel]) {
        
        self.events = events
        tableView.reloadData()
    }

}

// MARK: UITableViewDataSource

extension EventListViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.eventCellReuseIdentifier) as? EventCell else {
            return EventCell()
        }
        
        cell.setUp(eventViewModel: events[indexPath.item])
        return cell
    }
}
