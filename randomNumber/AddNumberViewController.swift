//
//  AddNumberViewController.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/14/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import UIKit

class AddNumberViewController: UIViewController {
    
    var store: PhotoStore!

    @IBOutlet var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButton(_ sender: Any) {
        if let number = numberField.text {
            if number.count > 0 {
                store.fetchNumberFact(number: number) { (result) in
                    switch result {
                    case let .success(fact):
                        print("Yay, it worked: \(fact.text)")
                        // add the fact to the list
                        self.store.addFact(fact: fact)
                        // go to the list page
                        self.performSegue(withIdentifier: "showListPage", sender: self)
                    case let .failure(error):
                        print("Didn't work: \(error)")
                    }
                }
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showListPage" {
            let listController = segue.destination as! ItemsViewController
            listController.store = self.store
        }
    }
    

}
