//
//  RecentView.swift
//  ExamApp
//
//  Created by Dan Albert Luab on 9/3/22.
//

import UIKit

protocol RecentViewDelegate: NSObjectProtocol {
    func recentViewDidSelect(_ view: RecentView, category: SelectedMenu)
}

class RecentView: BaseView {
    
    // MARK: - Properties
    
    weak var delegate: RecentViewDelegate?
    private var recentData = [SelectedMenu?]()
  
    
    // MARK: - UI Component
     let collectionViews: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.itemSize = CGSize(width: 200, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.isPagingEnabled = false
        collectionView.register(cellType: RecentCell.self)
        
        
        return collectionView
    }()
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialSetting()
        addSubview(collectionViews)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
 
    // MARK: - Private Method
    
    private func initialSetting() {
        collectionViews.delegate = self
        collectionViews.dataSource = self
        reloadDelegate()

    }
    
    // MARK: - Internal Method
    
    func configure(_ data: [SelectedMenu?]) {
      
    
       
        self.recentData = data
        
        collectionViews.reloadData()
    }
    
    func reloadDelegate() {
     collectionViews.reloadData()
    }
    
    
}
//MARK: - LayOut
extension RecentView {
    
    private func layout() {
        
        collectionViews.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionViews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionViews.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionViews.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

//MARK: - CollectionViewDataSource
extension RecentView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        reloadDelegate()
      
        return recentData.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 335*screen_width/375, height: 150*screen_height/667)
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: RecentCell.self)
        cell.backgroundColor = .rgb(243,243,243,255)
        
        cell.configure(recentData[indexPath.row])
 
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return   CGSize(width: 50, height: 10)
    }
 
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
}

//MARK: - CollectionViewDelegate
extension RecentView: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cat = recentData[indexPath.item] else { return  }
        delegate?.recentViewDidSelect(self, category: cat)
    }

}
