//
//  ViewController.swift
//  HHYPageView
//
//  Created by 华惠友 on 2020/3/18.
//  Copyright © 2020 huayoyu. All rights reserved.
//

import UIKit

private let kCollectionViewCell = "kCollectionViewCell"


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildCollectionView()
        // addChildVC()
        
        
    }
    
    
}

extension ViewController {
    
    // 子视图是collectionView
    fileprivate func addChildCollectionView() {
        // 1.标题
        let titles = ["游戏", "娱乐娱乐娱乐", "新闻", "科学学"]
        let style = HHYTitleStyle()
        style.isShowCover = false
        
        // 3.pageView的frame
        let pageFrame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 300)
        
        // 4.创建HHYPageView,并且添加到控制器的view中
        let layout = HHYPageCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        //        layout.cols = 7
        //        layout.rows = 3
        
        let pageCollectionView = HHYPageCollectionView(frame: pageFrame, titles: titles, style: style, isTitleTop: false, layout: layout)
        pageCollectionView.dataSource = self
        pageCollectionView.register(UICollectionViewCell.self, kCollectionViewCell)
        view.addSubview(pageCollectionView)
    }
    
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

extension UIViewController: HHYPageCollectionViewDataSource {
    func numberOfSections(in pageCollection: HHYPageCollectionView) -> Int {
        return 4
    }
    
    func pageCollection(_ pageCollection: HHYPageCollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        } else if section == 1 {
            return 30
        } else if section == 2 {
            return 40
        } else if section == 3 {
            return 20
        }
        return 0
    }
    
    func pageCollection(_ pageCollection: HHYPageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCell, for: indexPath)
        cell.backgroundColor = .randomColor()
        return cell
    }
    
    
}
