//
//  MainViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/04.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var idtextfield: UITextField!
    @IBOutlet weak var pwtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginbutton(_ sender: Any) {
        if self.idtextfield.hasText && self.pwtextfield.hasText {
            
            self.makeRequestAlert(title: "알림",
                                          message: "로그인을 하시겠습니까?",
                                          okAction: { _ in
                                            self.loginAction()
                                          })
        }
    }
    
    func loginAction()
        {
            LoginService.shared.login(email: self.idtextfield.text!, password: self.pwtextfield.text!) { result in
                switch result
                {
                case .success(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                       message: message,
                                       // 확인 눌렀을 때
                                       okAction: { _ in
                                        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else {return}
                                        self.navigationController?.pushViewController(nextVC, animated: true)
                                       })
                    }
                    
                case .requestErr(let message):
                    
                    if let message = message as? String{
                        
                        self.makeAlert(title: "알림",
                                  message: message)
                    }
                               
                    
                default :
                    print("ERROR")
                }
            }
        }
    
    @IBAction func newbutton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FirstViewController") as? FirstViewController else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

//extension UIViewController
//{
//    func makeRequestAlert(title : String,
//                   message : String,
//                   okAction : ((UIAlertAction) -> Void)?,
//                   cancelAction : ((UIAlertAction) -> Void)? = nil,
//                   completion : (() -> Void)? = nil)
//    {
//
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.impactOccurred()
//
//        let alertViewController = UIAlertController(title: title, message: message,
//                                                    preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
//        alertViewController.addAction(okAction)
//
//
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
//        alertViewController.addAction(cancelAction)
//
//
//        self.present(alertViewController, animated: true, completion: completion)
//    }
//
//
//    func makeAlert(title : String,
//                   message : String,
//                   okAction : ((UIAlertAction) -> Void)? = nil,
//                   completion : (() -> Void)? = nil)
//    {
//        let generator = UIImpactFeedbackGenerator(style: .medium)
//        generator.impactOccurred()
//
//        let alertViewController = UIAlertController(title: title, message: message,
//                                                    preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
//        alertViewController.addAction(okAction)
//
//
//
//        self.present(alertViewController, animated: true, completion: completion)
//    }
//}
//
