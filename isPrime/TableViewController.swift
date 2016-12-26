//
//  TableViewController.swift
//  isPrime
//
//  Created by Jeffrey Jiahai Luo on 12/12/2016.
//  Copyright © 2016 El Root. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var primeArray: [Int] = []
    var numberOfRows: Int = 64

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        fetchPrime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fetchPrime() {
        var number = primeArray.last != nil ? primeArray.last! : 1
        var count = 0
        number += 1
        while count < 64 {
            var isPrime = true
            var divisor = 2
            while divisor * divisor <= number {
                if number % divisor == 0 {
                    isPrime = false
                    break
                }
                divisor += 1
            }
            if isPrime {
                primeArray.append(number)
                count += 1
            }
            number += 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = String(primeArray[indexPath.row])
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //If we reach the end of the table.
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            //Add ten more rows and reload the table content.
            numberOfRows += 64
            fetchPrime()
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
