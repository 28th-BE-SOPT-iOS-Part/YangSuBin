//
//  FirstTableViewCell.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/30.
//

import UIKit

//protocol SampleProtocol {
//    func dataSend(data: String)
//}

class FirstTableViewCell: UITableViewCell {
    
    static let identifier : String = "FirstTableViewCell"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
//    var delegate : SampleProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(imageName : String, name : String, bio : String) {
        if let image = UIImage(named:imageName){
            profileImage.image = image
        }
        nameLabel.text = name
        bioLabel.text = bio
    }

}
