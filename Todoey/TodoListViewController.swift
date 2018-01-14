//
//  ViewController.swift
//  Todoey
//
//  Created by Ken Wong on 12/1/2018.
//  Copyright © 2018 kahungwong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Egg", "Destory Demodragon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // decide the number of Rows of the table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // put items on every row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // Mark - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print(itemArray[indexPath.row])
        
        // add a trick on selected item or remove the trick
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        // when item being selected, it will not grey selecting.
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //Mark - Add new items
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on our UIAlert
//            print(textField.text)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
          textField = alertTextField
        
        }
        
    alert.addAction(action)
      present(alert, animated: true, completion: nil)
        
    }
    
}





