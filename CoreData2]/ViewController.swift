//
//  ViewController.swift
//  CoreData2]
//
//  Created by COE-05 on 06/01/20.
//  Copyright © 2020 COE-05. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    var UserData: [NSManagedObject] = [] 
    
    @IBOutlet weak var Email: UITextField!
    
    
    @IBOutlet weak var Name: UITextField!
    
    
    @IBAction func Savebtn(_ sender: UIButton) {
       self.save(email: Email.text!, name: Name.text!)
        
        
    }
    
  
    
    func save(email:String, name:String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Urvi",
                                       in: managedContext)!
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        // 3
        person.setValue(Email.text, forKeyPath: "email")
        person.setValue(Name.text, forKey: "name")
        
        
        // 4
        do {
            try managedContext.save()
            UserData.append(person)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

