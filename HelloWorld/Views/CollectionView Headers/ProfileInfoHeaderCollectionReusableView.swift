//
//  ProfileInfoHeaderCollectionReusableView.swift
//  HelloWorld
//
//  Created by Justin Brown on 9/1/20.
//  Copyright © 2020 Justin Brown. All rights reserved.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
     static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
