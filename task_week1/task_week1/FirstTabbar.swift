//
//  FirstTabbar.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/12.
//

import UIKit

//protocol SampleProtocol {
//    func dataSend(data: String)
//}

class FirstTabbar: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var firstHeaderView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userstateLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var friendList : [FriendListDataModel] = []
//    var myList : [MyDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setFriendList()
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        friendTableView.separatorStyle = .none
        // 테이블뷰에서 separator을 사용하지 않겠다

        // Do any additional setup after loading the view.
    }
    
    // 얘 잠깐만 끈다..
    @IBAction func profileButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {return}

        nextVC.modalPresentationStyle = .fullScreen

        nextVC.profileImage = UIImageView(image: userImage)
//        nextVC.profileImage = UIImage(imageLiteralResourceName: userImage)
        nextVC.name = self.usernameLabel.text ?? ""
        nextVC.state = self.userstateLabel.text ?? ""

        self.present(nextVC, animated: true, completion: nil)
//        print("프로필")
    }
    
    func setFriendList()
        {
            friendList.append(contentsOf: [
                FriendListDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "배고파요"),
                
                FriendListDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
                
                FriendListDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
                
                FriendListDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
                
                FriendListDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
                
                FriendListDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
                
                FriendListDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
                
                FriendListDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
                
                FriendListDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
                
                FriendListDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "걱정말라구!")
                
            ])
        }
    
//    func setProfileList() {
//        myList.append(contentsOf: [
//            MyDataModel(imageName: "friendtabProfileImg",
//                            name: "양수빈",
//                            state: "데이터..전달....어려워..")
//
//        ])
//    }
}


// 셀을 터치하면 무엇을 하나요? 셀의 높이, 들여쓰기
extension FirstTabbar : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 50
        // 추청 높이를 먼저 잡는게 맞는거겠지..?
        return UITableView.automaticDimension
        //return 50
    }
    
    func tableview(_ tableView: UITableView, viewForHeaderInSeciton:Int) {
        tableView.tableHeaderView = firstHeaderView
    }
    
    
    
    // 셀 선택했을 때 넘어가는 부분
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {return}

        cell.name = self.friendList[indexPath.row].name
        cell.image = self.friendList[indexPath.row].imageName
        cell.state = self.friendList[indexPath.row].state
        
        
        // 이거로 하면 넘어는 가는데 데이터를 못받아옴....
//        if let text = cell.nameLabel?.text {
//            delegate?.dataSend(data: text)
//        }
        
//        if let text = cell.nameLabel.text {
//            delegate?.dataSend(data:text)
//            delegate?.dataSend(data:text)
//        }
 
        cell.modalPresentationStyle = .fullScreen
        self.present(cell, animated: true, completion: nil)
        print("셀로 넘어감")
    }
    
}

extension FirstTabbar : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell else {return UITableViewCell()}
        
        serviceCell.setData(imageName: friendList[indexPath.row].imageName, name: friendList[indexPath.row].name, bio: friendList[indexPath.row].state)
        
        return serviceCell
    }
}
