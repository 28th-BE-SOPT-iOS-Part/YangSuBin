//
//  SecondViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/04.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var messagelabel: UILabel!
    
    var message : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel() {
        if let msg = self.message {
            messagelabel.text = "\(msg)님"
        }
    }
    
    @IBAction func okbutton(_ sender: Any) {
//        guard let pvc = self.presentingViewController else {return}
        self.dismiss(animated: true, completion: nil)
//        if self.dismiss(animated: true) {
//            self.navigationController?.popViewController(animated: true)
//        }
//        if self.navigationController?.popViewController(animated: true) {
//            self.dismiss(animated: true)
//            }
        
//        self.dismiss(animated: true) {
//            pvc.present(FirstViewController(), animated: true, completion: nil)
//
//        }
        
//        self.navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
