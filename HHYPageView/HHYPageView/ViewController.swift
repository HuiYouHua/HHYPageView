//
//  ViewController.swift
//  HHYPageView
//
//  Created by 华惠友 on 2020/3/18.
//  Copyright © 2020 huayoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC()
        
        
    }


}

extension ViewController {
    // 子视图是控制器
    fileprivate func addChildVC() {
        // 1.标题
        let titles = ["游戏", "娱乐娱乐娱乐", "新闻", "科学学", "技术", "游戏", "娱乐娱乐娱乐", "新闻", "科学学", "技术"]
        let style = HHYTitleStyle()
        style.isShowCover = false
        
        // 2.子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        // 3.pageView的frame
        let pageFrame = CGRect(x: 0, y: heightOfAddtionalHeader + 64, width: view.bounds.width, height: view.bounds.height - (heightOfAddtionalHeader + 64))
        
        // 4.创建HHYPageView,并且添加到控制器的view中
        let pageView = HHYPageView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style: style)
        
        view.addSubview(pageView)
    }
}

