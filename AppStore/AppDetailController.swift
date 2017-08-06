//
//  AppDetailController.swift
//  AppStore
//
//  Created by Tyler Perkins on 8/6/17.
//  Copyright © 2017 Tyler Perkins. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            navigationItem.title = app?.name

            
        }
    }
    
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        header.app = app
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
}



class AppDetailHeader: BaseCell {
    
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.blue
        
        addSubview(imageView)
        
        imageView.backgroundColor = UIColor.yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
    
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
