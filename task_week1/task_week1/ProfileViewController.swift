//
//  ProfileViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/12.
//

import UIKit

//, SampleProtocol
class ProfileViewController: UIViewController {
//    func dataSend(data: String) {
//        nameLabel.text = data
//    }

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var name : String = ""
    var image : String = ""
    var state : String = ""
    
    // 내 프로필 이미지만을 위해서,,
//    var userimage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = name
        self.profileImage.image = UIImage(named: image)
        self.stateLabel.text = state

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
