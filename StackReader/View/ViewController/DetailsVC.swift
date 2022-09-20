//
//  DetailsVC.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit
import WebKit

class DetailsVC: UIViewController, Storyboarded, WKNavigationDelegate {

    var pageData : CoreModel?
    
    weak var coordinator : MainCoordinator?

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var reputationCountLbl: UILabel!
    @IBOutlet weak var creationDateLbl: UILabel!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tagsView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    func setupView () {
        guard let reputation = pageData?.ownerReputation else { return }
        guard let date = pageData?.creationDate?.prefix(10) else { return }
        profileImageView.layer.cornerRadius = 5
        tagsView.layer.cornerRadius = 5.0
        ownerNameLbl.text = pageData?.ownerDisplayName
        reputationCountLbl.text = ("Reputation: \(String(reputation))")
        creationDateLbl.text = ("Created: \(date)")
        tagsLbl.text = pageData?.tags
        webView.loadHTMLStringWithMagic(content: (pageData?.body)!, baseURL: nil)
        titleLbl.text = pageData?.title
        profileImageView.setCustomImage(pageData?.ownerProfileImageLink)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='200%'"//dual size
        webView.evaluateJavaScript(js, completionHandler: nil)
    }

    @IBAction func openSafari(_ sender: Any) {
        guard let url = URL(string: (pageData?.acceptedAnswer)!) else { return }
        UIApplication.shared.open(url)
    }
    
}

