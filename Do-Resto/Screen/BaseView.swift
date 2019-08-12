//
//  BaseView.swift
//  Do-Resto
//
//  Created by adonis rumbwere on 11/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import UIKit

//subclassing the uiview
@IBDesignable class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    //When the initializer is called by the storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        
    }

}
