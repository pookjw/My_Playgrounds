//
//  TableViewController.swift
//  Practice_TableView
//
//  Created by pook on 7/9/20.
//  Copyright © 2020 jinwoopeter. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alertVC = UIAlertController(title: "Add item", message: "Hi", preferredStyle: .alert)
        
        // Add TextField on alertVC...
        weak var textField: UITextField?
        alertVC.addTextField { tf in
            tf.placeholder = "Enter text..."
            textField = tf
        }
        
        // Add actions...
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let text = textField?.text else { return }
            self?.list.append(text)
            self?.tableView.reloadData()
        })
        let randomAction = UIAlertAction(title: "Random number", style: .default, handler: { [weak self] _ in
            let randomNumber = Int.random(in: 0 ... 100)
            self?.list.append("\(randomNumber)")
            self?.tableView.reloadData()
        })
        let removeAllAction = UIAlertAction(title: "Remove All", style: .destructive) { [weak self] _ in
            self?.list.removeAll()
            self?.tableView.reloadData()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(addAction)
        alertVC.addAction(randomAction)
        alertVC.addAction(removeAllAction)
        
        // Present on current ViewController...
        present(alertVC, animated: true, completion: nil)
    }
    
    private var list: [String] = ["Initial value"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("cell is not registed!")
        }
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nc = navigationController else { return }
        let detailVC = UIStoryboard(name: "Main", bundle: nil)
        .instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.text = list[indexPath.row]
        nc.pushViewController(detailVC, animated: true)
    }

}
