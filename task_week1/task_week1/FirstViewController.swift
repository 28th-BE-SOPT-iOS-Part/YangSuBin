//
//  FirstViewController.swift
//  task_week1
//
//  Created by 양수빈 on 2021/04/04.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var newidtextfield: UITextField!
    @IBOutlet weak var newpwtextfield: UITextField!
    @IBOutlet weak var checkpwtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func secondnewbutton(_ sender: Any) {
        if self.newidtextfield.hasText && self.newpwtextfield.hasText && self.checkpwtextfield.hasText {
            
//            guard let nextVC =  storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}
//
//            nextVC.message = newidtextfield.text
//            nextVC.modalPresentationStyle = .fullScreen
//
//            self.present(nextVC, animated: true, completion: {self.navigationController?.popViewController(animated: true)})
            
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else {return}

            self.navigationController?.pushViewController(nextVC, animated: true)
            
        }
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
