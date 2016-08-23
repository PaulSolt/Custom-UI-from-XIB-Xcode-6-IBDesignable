//
//  Widget.swift
//  Custom View from Xib
//
//  Created by Paul Solt on 12/7/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

import UIKit

@IBDesignable class Widget: UIView {

    var view: UIView!
    
    var nibName: String = "Widget"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    @IBInspectable var title: String? {
        get {
            return titleLabel.text
        }
        set(title) {
            titleLabel.text = title
        }
    }
    
    @IBInspectable var buttonTitle: String? {
        get {
            return addButton.titleForState(UIControlState.Normal)
        }
        set(title) {
            addButton.setTitle(title, forState: UIControlState.Normal)
        }
    }
    
    
    
    // init
    
    override init(frame: CGRect) {
        // properties
        super.init(frame: frame)
        
        // Set anything that uses the view or visible bounds
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // properties
        super.init(coder: aDecoder)
        
        // Setup
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
