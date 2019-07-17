//
//  MyTabBarController.swift
//  News
//
//  Created by 蓝洪明 on 2019/7/17.
//  Copyright © 2019 lanhm. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance();
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0);
        addChildViewControllers();

    }
    
    func addChildViewControllers(){
        setChildViewController(HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_");
        
        setChildViewController(VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_");
        
        setChildViewController(HuoshanViewController(), title: "小视频", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_");
        
        setChildViewController(MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_");
    }
    
    func setChildViewController(_ childVC : UIViewController, title:String, imageName:String, selectedImageName:String){
        childVC.tabBarItem.image = UIImage(named: imageName);
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName);
        childVC.title = title;
        let navVC = MyNavigationController(rootViewController: childVC);
        addChild(navVC);
    }

}
