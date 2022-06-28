//
//  SliderCell.swift
//  Reizyn
//
//  Created by Swifty on 6/9/22.
//

import UIKit
import Gemini

class SliderCell: GeminiCell {
    
    @IBOutlet weak private var mainImageView: UIImageView!
    
    func setCell(imageName:String) {
        
        mainImageView.image = UIImage(named: imageName)
    }
    
}
