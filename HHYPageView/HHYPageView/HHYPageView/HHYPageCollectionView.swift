//
//  HHYPageCollectionView.swift
//  HHYPageView
//
//  Created by 华惠友 on 2020/3/20.
//  Copyright © 2020 huayoyu. All rights reserved.
//

import UIKit

class HHYPageCollectionView: UIView {

    fileprivate var titles: [String]
    fileprivate var style: HHYTitleStyle
    fileprivate var isTitleTop: Bool
    fileprivate var layout: UICollectionViewFlowLayout
    
    init(frame: CGRect, titles: [String], style: HHYTitleStyle, isTitleTop: Bool, layout: UICollectionViewFlowLayout) {
        self.titles = titles
        self.style = style
        self.isTitleTop = isTitleTop
        self.layout = layout
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HHYPageCollectionView {
    fileprivate func setupUI() {
        // 1.创建titleView
        let titleY = isTitleTop ? 0 : style.titleHeight
        let titleFrame = CGRect(x: 0, y: titleY, width: bounds.width, height: style.titleHeight)
        let titleView = HHYTitileView(frame: titleFrame, titles: titles, style: style)
        titleView.backgroundColor = UIColor.randomColor()
        addSubview(titleView)
        
        // 2.创建UIPageControl
        let pageControlHeight: CGFloat = 20
        let pageControlY = isTitleTop ? bounds.height - pageControlHeight : (bounds.height - pageControlHeight - style.titleHeight)
        let pageControlFrame = CGRect(x: 0, y: pageControlY, width: bounds.width, height: pageControlHeight)
        let pageControl = UIPageControl(frame: pageControlFrame)
        pageControl.numberOfPages = 4
        addSubview(pageControl)
        pageControl.backgroundColor = UIColor.randomColor()
        
        // 3.创建UICollectionView
        let collectionViewY = isTitleTop ? style.titleHeight : 0
        let collectionViewFrame = CGRect(x: 0, y: collectionViewY, width: bounds.width, height: bounds.height - style.titleHeight - pageControlHeight)
        
        let collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        addSubview(collectionView)
        collectionView.backgroundColor = UIColor.randomColor()
    }
}
