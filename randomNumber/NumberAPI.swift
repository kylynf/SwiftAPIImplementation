//
//  NumberAPI.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/13/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import Foundation

enum NumberWebsiteError: Error{
    case invalidJSONData
}

struct NumberAPI{
    static let baseURLString = "http://numbersapi.com/"
    
    static func numberURL(number: String) -> URL {
        return URL(string: "\(baseURLString)\(number)?json")!
    }
    
    //checks JSON data to make sure that it is valid
    static func numbers(fromJSON data: Data) -> NumbersResult {
        do{
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let jsonDictionary = jsonObject as? [String:Any] else {
                return .failure(NumberWebsiteError.invalidJSONData)
            }
            
            if let fact = number(fromJSON: jsonDictionary) {
                return .success(fact)
            } else {
                return .failure(NumberWebsiteError.invalidJSONData)
            }
        } catch let error{
            return .failure(error)
        }
    }
    
    //method to parse a JSON dictionary into a number instance
    private static func number(fromJSON json: [String: Any]) -> NumberFact? {
        guard
            let number = json["number"] as? Int,
            let text = json["text"] as? String else {
                //dont have enough information to construct a fact
                return nil
        }
        return NumberFact(text: text, number: number)
    }
    
    
}
