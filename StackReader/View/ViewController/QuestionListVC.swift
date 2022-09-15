//
//  QuestionListVC.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class QuestionListVC: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator : MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self

    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell") as! QuestionListCell
//        cell.titleLbl.text = "tableView: UITableView, cellForRowAt indexPath  UITableViewCell "
        return cell
        
    }
}

