//
//  ViewController.swift
//  ParsingJSON3
//
//  Created by Audi Dharmawan on 29/12/17.
//  Copyright © 2017 Audi Dharmawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var wisata = [WisataDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseWisata {
            //self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wisata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = wisata[indexPath.row].title.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WisataViewController{
            destination.wisatasatu = wisata[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    func parseWisata(completed: @escaping () -> ()) {
        let url = URL(string: "http://dev.gits.id:1090/api/get/dataalam")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
          
            guard let data = data else { return }
            
            do {
                
                let wisataDescription = try JSONDecoder().decode(WisataDescription.self, from: data)
                    self.wisata = wisataDescription.data
                    self.tableView.reloadData()
                
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}

