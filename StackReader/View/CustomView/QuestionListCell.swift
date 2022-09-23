//
//  QuestionListCell.swift.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class QuestionListCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tagsLbl: UILabel!
    @IBOutlet weak var vievCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLbl.text?.removeAll()
        tagsLbl.text?.removeAll()
        vievCountLbl.text?.removeAll()
    }

    func setupView(withQuestion item : Listable) {
        titleLbl.text = String(describing: item.title)
        tagsLbl.text = String(describing: item.tags!)
        vievCountLbl.text = String(describing: item.viewCount!)
    }

}


