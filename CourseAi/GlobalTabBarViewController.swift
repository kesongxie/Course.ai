//
//  GlobalTabBarViewController.swift
//  course.io
//
//  Created by Xie kesong on 10/12/16.
//  Copyright © 2016 ___KesongXie___. All rights reserved.
//

import UIKit

class GlobalTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = StyleConst.tabBar.backgroundColor
        self.tabBar.tintColor = StyleConst.tabBar.iconColor
        self.tabBar.isTranslucent = false
    }

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
