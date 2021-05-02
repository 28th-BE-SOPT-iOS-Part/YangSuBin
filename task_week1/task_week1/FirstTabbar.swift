//
//  FirstTabbar.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/12.
//

import UIKit

class FirstTabbar: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var firstHeaderView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userstateLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    var friendList : [FriendListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendList()
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        friendTableView.separatorStyle = .none
    }
    
    @IBAction func profileButtonClicked(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {return}

        nextVC.modalPresentationStyle = .fullScreen

        // 이미지는 대신 빈문자열을 넘겨서 프로필뷰컨에서 지정해둔 기본이미지가 뜨게
        // 이미지 넘기려면 프로필뷰컨에 UIImage 변수 선언해서 따로 해야됨..
        // nextVC.myimage = self.userImage.image
        nextVC.image = ""
        nextVC.name = self.usernameLabel.text ?? ""
        nextVC.state = self.userstateLabel.text ?? ""

        self.present(nextVC, animated: true, completion: nil)
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
}


// 셀을 터치하면 하는 동작, 셀의 높이, 들여쓰기 등
extension FirstTabbar : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 50
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
 
        cell.modalPresentationStyle = .fullScreen
        self.present(cell, animated: true, completion: nil)
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
