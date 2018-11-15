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
    
    case success(NumberFact)
    case failure(Error)
}

class PhotoStore{
    
    var factList = [NumberFact]()
    
    //NSCoding
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(factList, toFile: itemArchiveURL.path)
    }
    
    func addFact(fact: NumberFact) {
        factList.append(fact)
    }
    
    
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
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processFactsRequest(data: Data?, error: Error?) -> NumbersResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return NumberAPI.numbers(fromJSON: jsonData)
    }
    
    //putting data back in after it is saved
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [NumberFact]{
            factList = archivedItems
        }
    }
}

