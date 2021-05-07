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
    
    // 설정버튼 누르면 아래서 올라오는 메뉴 (ActionSheet)
    @IBAction func displayActionSheet(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "메뉴를 선택하세요", preferredStyle: .actionSheet)
        
        let editAction = UIAlertAction(title: "편집", style: .default)
        let fmanageAction = UIAlertAction(title: "친구 관리", style: .default)
        let fullsetAction = UIAlertAction(title: "전체 설정", style: .default)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        optionMenu.addAction(editAction)
        optionMenu.addAction(fmanageAction)
        optionMenu.addAction(fullsetAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
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
        
        // cell 선택해제
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // TableView Swipe Action -> 숨김, 차단
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let hideAction = UIContextualAction(style: .destructive, title: "숨김", handler: { (ac:UIContextualAction, view:UIView, success: (Bool) -> Void) in
            success(true)
        })
        
        let blockAction = UIContextualAction(style: .destructive, title: "차단", handler: { (ac:UIContextualAction, view:UIView, success: (Bool) -> Void) in
            success(true)
        })
        hideAction.backgroundColor = .systemGray
        
        return UISwipeActionsConfiguration(actions:[blockAction, hideAction])
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
