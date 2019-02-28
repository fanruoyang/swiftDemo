//
//  RecommendViewController.swift
//  01 swift 基础
//
//  Created by ios on 2019/1/4.
//  Copyright © 2019 fanruoyang. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let kNormalItemW = (Main_Screen_With - 3*kItemMargin)/2
private let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3
private let KHeaderViewH :CGFloat = 50

private let ContentCellID = "ContentCellID"
private let CollectionPrettyCellID = "CollectionPrettyCell"
private let HeaderIdentifierID = "headerIdentifier"
private let FootIdentifierID = "footIdentifier"

class RecommendViewController: UIViewController {
    
    
    // MARK:------------------- 懒加载 -------------------
    private lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
    private lazy var collectionView :UICollectionView = {

        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 10 //上下行间距
        layout.minimumInteritemSpacing = kItemMargin //左右行间距
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: Main_Screen_With, height: KHeaderViewH)
        layout.footerReferenceSize = CGSize.init(width: Main_Screen_With, height: 80)
        

        
        let collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: Main_Screen_With, height: self.view.height-kTabBarHeight-kBottomSafeHeight-44), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.yellow
        collectionView.dataSource = self
        collectionView.delegate = self
   
        
        collectionView.register(UINib.init(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: ContentCellID)
        
         collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: CollectionPrettyCellID)

//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier")
        
        collectionView.register(UINib.init(nibName: "RecomHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderIdentifierID)
        // 注册footView
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footIdentifier")
        
        
        return collectionView
        
    }()
    
    // MARK:------------------- 系统回调函数 -------------------
    
    override func viewWillAppear(_ animated: Bool) {
               super.viewWillAppear(animated)
        recommendVM.requestData { (sections) in
            print("%@",sections)
            
            self.collectionView .reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
      collectionView .reloadData()
   
  
        
    }
    
}
// MARK:------------------- 设置ui界面 -------------------
extension RecommendViewController{
    private func setUI() {
        view.backgroundColor = UIColor.randomColor()
        self.view.addSubview(collectionView)
    }
    
}
// MARK:------------------- 遵循代理协议 -------------------
extension RecommendViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionPrettyCellID, for: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
            
            cell.backgroundColor = UIColor.randomColor()
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerIdentifier", for: indexPath)
       
           
            return headerView
        }else{
            let footView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footIdentifier", for: indexPath)
            footView.backgroundColor = UIColor.purple

            return footView
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    

}
extension RecommendViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
    
    
}
