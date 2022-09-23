//
//  QuestionListVC.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//


protocol DataSenderDelegate {
    func sendData(questionData : CoreModel)
}

import UIKit

class QuestionListVC: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var page = "1"
    var items = [CoreModel] ()
    weak var coordinator : MainCoordinator?
    var model = QuestionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        activityIndicator.startAnimating()
        
        print("Page 1 is loading")
        model.fetchData(storage: .coreData, pagination: true, forPage: page, andTag: "swift") { [self] data, isOffline  in
            if isOffline, items.isEmpty {
                items.append(contentsOf: data)
            } else if isOffline == false {
                items.append(contentsOf: data)
            }
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
                print("Total question object now is: " + String(items.count))
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell") as! QuestionListCell
        let indexed = items[indexPath.row]
        cell.setupView(withQuestion: indexed)
        return cell
        
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            if isPaginating {
                return
            }
            if page == "6" {
                return
            }
            var newPageNumber = Int(page) ?? 1
            if newPageNumber < 6 {
                newPageNumber += 1
                
                page = String(describing: newPageNumber)
                print("Page " + page + " is loading")
                
            }
            
            model.fetchData(storage: .coreData, pagination: true, forPage: page, andTag: "swift") { [self] data, isOffline  in
                if isOffline, items.isEmpty {
                    items.append(contentsOf: data)
                } else if isOffline == false {
                    items.append(contentsOf: data)
                }
                DispatchQueue.main.async { [self] in
                    tableView.reloadData()
                    print("Total question object now is: " + String(items.count))
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuestion = items[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.pageData = selectedQuestion
        present(vc, animated: true)
    }
}

