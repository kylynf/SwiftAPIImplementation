//
//  Number.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/14/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import Foundation

class NumberFact: NSCoding {
    
    let text: String
    let number: Int
    //let found: Bool
    //let type: String
    
    init(text: String, number: Int){
        self.text = text
        self.number = number
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "text")
        aCoder.encode(number, forKey: "number" )
    }
    
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "text" ) as! String
        number = aDecoder.decodeObject(forKey: "number" ) as! Int
        
        //super.init()
    }
    
    
}
