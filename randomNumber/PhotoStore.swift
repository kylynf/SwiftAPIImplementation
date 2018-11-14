//
//  PhotoStore.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/14/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import Foundation

class PhotoStore{
    
    //hold onto an instance of URLSession
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    //create request to connect to API and ask for list of facts
    
    func fetchNumberFact(number: String){
        //which URL do I use here???? base?
        let url = NumberAPI.numberURL(number: number)
        let request = URLRequest(url:url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data{
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print(jsonString)
                }
            } else if let requestError = error{
                print("Error fetching fact: \(requestError)")
            } else{
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
}

