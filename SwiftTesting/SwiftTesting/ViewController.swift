//
//  ViewController.swift
//  SwiftTesting
//
//  Created by Berkay Kuzu on 27.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "To Dos"
    }


    @IBAction func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "Enter Your To Do Item", preferredStyle: .alert)
        alert.addTextField { textField in // alert.addTextField yeni gördüğün bir olay!!!
            textField.placeholder = "Enter Item"
        }
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else {
                return
            }
    
            self.toDoList.insert(inputText, at: 0) // .insert En son ekleneni en başa ekliyor, .append en sona ekliyor.
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
        }
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // Kendi oluşturduğumuz cell için kullanılır.
        var content = cell.defaultContentConfiguration() // içinde cell'i gösterebilmek için content oluşturuyorum.
        content.text = toDoList[indexPath.row] // content'in text'inde toDoList'ten ne geliyorsa sıra sıra göster diyorum, indexPath küçük harfle başlar!
        cell.contentConfiguration = content // birbirine bağladık.
        return cell // Artık oluşturduğum cell UITableView içerisinde gösterilecek.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

