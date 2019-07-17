//
//  MyTabBar.swift
//  News
//
//  Created by 蓝洪明 on 2019/7/17.
//  Copyright © 2019 lanhm. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame);
        addSubview(publicButton);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //private 绝对私有，除了在当前类中可以访问，其他任何类中或该类的扩展都不能访问
    //fileprivate 文件私有，可以在当前类文件中访问，其他文件不能访问
    //open 在任何类文件中都能访问
    //internal 默认，可以不写
    private lazy var publicButton : UIButton = {
        let publicButton = UIButton(type: .custom);
        publicButton.setBackgroundImage(UIImage(named: "feed_publish_44x44_"), for: .normal);
        publicButton.setBackgroundImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected);
        publicButton.sizeToFit();
        
        return publicButton;
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews();
        let width = frame.width;//当前tabbar的宽度
        let height = frame.height - 15;//当前tabbar的高度
        
        publicButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 17);
        
        //设置其他按钮的frame
        let buttonW:CGFloat = width * 0.2;
        let buttonH:CGFloat = height;
        let buttonY:CGFloat = 0;
        
        var index = 0;
        
        for button in subviews{
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){continue};
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index));
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH);
            index += 1;
        }
    }
}
