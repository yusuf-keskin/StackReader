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
    

}


