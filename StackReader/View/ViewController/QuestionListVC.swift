//
//  QuestionListVC.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class QuestionListVC: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var page = "1"
    
    var items = [CoreModel] ()
    
    weak var coordinator : MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
        CoreDataService.instance.fetchData(pagination: false, forPage: page, andTag: "swift") { [self] data, isOffline  in
            
            if isOffline, items.isEmpty {
                items.append(contentsOf: data)
            } else if isOffline == false {
                items.append(contentsOf: data)
            }
                DispatchQueue.main.async { [self] in
                    tableView.reloadData()
                }
            

        }
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
        
//        if offsetY > contentHeight - height {
//            print(ApiService.instance.isPaginating)
//
//
//                if page == "6" {
//                    return
//                }
//
//                var newPageNumber = Int(page) ?? 1
//                if newPageNumber < 6 {
//                    newPageNumber += 1
//
//                    page = String(describing: newPageNumber)
//                    print(page)
//                    print(items.count)
//                }
//
//            ApiService.instance.fetchData(pagination: true, forPage: page, andTag: "swift") { [self] data, isOffline  in
//                if isOffline, items.isEmpty {
//                    items.append(contentsOf: data)
//                } else if isOffline == false {
//                    items.append(contentsOf: data)
//                }
//                    DispatchQueue.main.async { [self] in
//                        tableView.reloadData()
//                    }
//                }
//
//    }
        
        
        if offsetY > contentHeight - height {
            print(CoreDataService.instance.isPaginating)

                
                if page == "6" {
                    return
                }
                
                var newPageNumber = Int(page) ?? 1
                if newPageNumber < 6 {
                    newPageNumber += 1
                    
                    page = String(describing: newPageNumber)
                    print(page)
                    print(items.count)
                }
                
            CoreDataService.instance.fetchData(pagination: true, forPage: page, andTag: "swift") { [self] data, isOffline  in
                if isOffline, items.isEmpty {
                    items.append(contentsOf: data)
                } else if isOffline == false {
                    items.append(contentsOf: data)
                }
                    DispatchQueue.main.async { [self] in
                        tableView.reloadData()
                    }
                }
 
    }
    }
    
    
    
    
}

