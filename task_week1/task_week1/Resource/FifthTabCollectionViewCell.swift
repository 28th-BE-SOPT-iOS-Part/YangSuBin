//
//  FifthTabCollectionViewCell.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/30.
//

import UIKit

class FifthTabCollectionViewCell: UICollectionViewCell{
    
    static let idetifier : String = "FifthTabCollectionViewCell"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(title : String, iconName : String){
        if let image = UIImage(named: iconName) {
            icon.image = image
        }
        titleLabel.text = title
    }
}
