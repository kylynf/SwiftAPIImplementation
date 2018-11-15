//
//  PhotoStore.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/14/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import Foundation

enum NumbersResult {
    //what should the success case be??
    
    //case success([Photo])
    case success()
    case failure(Error)
}

class PhotoStore{
    
    //hold onto an instance of URLSession
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    //create request to connect to API and ask for list of facts
    
    func fetchNumberFact(number: String, completion: @escaping (NumbersResult) -> Void){
        //which URL do I use here???? base?
        let url = NumberAPI.numberURL(number: number)
        let request = URLRequest(url:url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            let result = self.processFactsRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
    
    private func processFactsRequest(data: Data?, error: Error?) -> NumbersResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return NumberAPI.numbers(fromJSON: jsonData)
    }
}

