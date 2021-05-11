//
//  ProfileViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/12.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var name : String = ""
    var image : String = ""
    var state : String = ""
    
//    이미지를 바로 받아올려면 셀의 이미지를 문자열로 받아오던 변수랑 다르게 따로 UIImage 선언해서 해야됨
//    var myimage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = name
        self.stateLabel.text = state
        
        // 이미지 받아오기
        // 이미지가 있으면 받아온 이미지, 없으면 기본이미지로
        if let image = UIImage(named: image) {
            self.profileImage.image = image
        } else {
            self.profileImage.image = UIImage(named: "friendtabProfileImg")
        }

    }
    
    @IBAction func profileBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
