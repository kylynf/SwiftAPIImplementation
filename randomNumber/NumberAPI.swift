//
//  NumberAPI.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/13/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import Foundation

struct NumberAPI{
    static let baseURLString = "http://numbersapi.com/"
    
    static func numberURL(number: String) -> URL {
        return URL(string: "\(baseURLString)\(number)?json")!
    }
    
    
}
