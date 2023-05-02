//
//  CollectionViewController.swift
//  SwipeSelectingCollectionView
//
//  Created by Oleksandr Balabon on 02.05.2023.
//

import UIKit

class CollectionViewController: UIViewController {

   //  fileprivate var selectedIndexPath = Set<IndexPath>()
    
    private var collectionView: SwipeSelectingCollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    // Setup Collections
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView = SwipeSelectingCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        
        view.addSubview(collectionView!)
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = view.bounds
    }
}

extension CollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 40 // set the desired spacing here
        
        return CGSize(width: view.frame.size.width / 3.4, height: view.frame.size.width / 3.4)
    }
}

extension CollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelect: \(indexPath)")
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("didDeselect: \(indexPath)")
    }
}
