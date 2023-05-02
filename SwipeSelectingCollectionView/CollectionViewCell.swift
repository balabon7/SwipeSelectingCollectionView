//
//  CollectionViewCell.swift
//  SwipeSelectingCollectionView
//
//  Created by Oleksandr Balabon on 02.05.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return String(describing: CollectionViewCell.self)
    }

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .red : .green
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
        self.backgroundColor = .systemGray6
    }
}

