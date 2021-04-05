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
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
            
            nextVC.message = idtextfield.text
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func newbutton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FirstViewController") as? FirstViewController else {return}
        
        self.navigationController?.pushViewController(nextVC, animated: true)
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
