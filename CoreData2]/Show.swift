//
//  Show.swift
//  CoreData2]
//
//  Created by COE-05 on 06/01/20.
//  Copyright © 2020 COE-05. All rights reserved.
//

import UIKit
import CoreData

class Show: UITableViewController {
    
    var managedContextObject:NSManagedObjectContext!
    //model data: table's row
    var managedObject:NSManagedObject!
    //list
    var list:[NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        self.managedContextObject = appDel.persistentContainer.viewContext
        
        listData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func listData(){
        
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Urvi")
        
        do{
            self.list = try self.managedContextObject.fetch(fetchReq) as! [NSManagedObject]
            for item in self.list{
                
            }
        }
        catch{
            print("Error in fetch")
        }
        
        tableView.reloadData()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(self.list[indexPath.row].value(forKey: "email")!)"
        cell.detailTextLabel?.text = "\(self.list[indexPath.row].value(forKey: "name")!)"

        // Configure the cell...

        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
