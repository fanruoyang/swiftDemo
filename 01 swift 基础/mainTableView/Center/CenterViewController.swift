//
//  CenterViewController.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/17.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
  
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }
    // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
