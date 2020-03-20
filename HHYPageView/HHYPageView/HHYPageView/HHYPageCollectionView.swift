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
//        let titleY = isTitleTop ? 0 : style.titleHeight
//        let titleFrame = CGRect(x: 0, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        let titleView = HHYTitileView(frame: frame, titles: titles, style: style)
    }
}
