//
//  TempButton.swift
//  TemperatureApp
//
//  Created by Benjamin Tincher on 2/8/21.
//

import UIKit

class TempButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        let edgeInset = CGFloat(16)
        self.contentEdgeInsets = UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
}
