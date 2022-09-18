//
//  QuestionListCell.swift.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class QuestionListCell: UITableViewCell {
   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var viewCountLbl: UILabel!
    @IBOutlet weak var scoreCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLbl.text?.removeAll()
        viewCountLbl.text?.removeAll()
        scoreCountLbl.text?.removeAll()
//        ApiService.instance.dataTask?.cancel()
//        ApiService.instance.dataTask = nil
        
    }
    
    
    func setupView(withQuestion item : Item) {
        titleLbl.text = String(describing: item.title!)
        viewCountLbl.text = String(describing: item.viewCount!)
        scoreCountLbl.text = String(describing: item.score!)
        
    }

}


