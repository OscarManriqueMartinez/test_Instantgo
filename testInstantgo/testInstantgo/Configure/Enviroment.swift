//
//  Enviroment.swift
//  testInstantgo
//
//  Created by Óscar Manrique on 9/6/17.
//  Copyright (c) 2017 Óscar Manrique. All rights reserved.
//

import UIKit

struct Enviroment {

    var plistEnvitoment : Dictionary<String, Any>?
    var lengthPassword : Int? {
        return plistEnvitoment?[Constants.keyLengthPassword] as! Int?
    }

    init() {
        if let path = Bundle.main.path(forResource: Constants.nameFileEnviroment, ofType: Constants.typeFileEnviroment) {
            plistEnvitoment = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        }
    }
}
