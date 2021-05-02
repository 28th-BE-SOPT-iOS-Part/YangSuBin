//
//  FifthTabViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/30.
//

import UIKit

class FifthTabViewController: UIViewController {

    @IBOutlet weak var fifthTabViewControllerView: UICollectionView!
    
    private var titleList : [FifthTabDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleList()
        fifthTabViewControllerView.delegate = self
        fifthTabViewControllerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func setTitleList() {
        titleList.append(contentsOf: [
            FifthTabDataModel(title: "메일",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "캘린더",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "서랍",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "카카오콘",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "메이커스",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "선물하기",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "이모티콘",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "프렌즈",
                              covericon: "friendTabIcon"),
            FifthTabDataModel(title: "쇼핑하기",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "스타일",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "주문하기",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "멜론티켓",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "게임",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "멜론",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "헤어샵",
                              covericon: "messageTabIcon"),
            FifthTabDataModel(title: "전체서비스",
                              covericon: "messageTabIcon")
        ])
    }

}

extension FifthTabViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: FifthTabCollectionViewCell.idetifier, for: indexPath)as? FifthTabCollectionViewCell else {
            return UICollectionViewCell()
        }
        titleCell.setData(title: titleList[indexPath.row].title,
                          iconName: titleList[indexPath.row].covericon)
        return titleCell
    }
}


extension FifthTabViewController : UICollectionViewDelegate {
    
}


extension FifthTabViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellwidth = width * (70/375)
        let cellHeight = cellwidth * (70/70)
        
        return CGSize(width: cellwidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 19
        }
    
    func collectionView(_collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
