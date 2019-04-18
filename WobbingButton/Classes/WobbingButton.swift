//
//  WobbingButton.swift
//  erk ekin
//
//  Created by Erk Ekin on 24.07.2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

@IBDesignable
open class WobbingButton: UIControl {
    
    public enum ControlState{
        case scaled
        case identity
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    private var controlState : ControlState = .identity {
        didSet{
            guard oldValue != controlState else {return}
            switch controlState {
            case .scaled:
                UIView.animate(withDuration: 0.1) {
                    self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
                }
            case .identity:
                UIView.animate(withDuration: 0.1) {
                    self.transform = CGAffineTransform.identity
                }
            }
        }
    }
    
    @IBInspectable
    public var scale: CGFloat = 0.92
    
    @IBOutlet public weak var titleLabel : UILabel?
    
    @IBInspectable
    public var actsFast :Bool = false
    public var onTapAction: (() -> Void)? = nil
    public var onLongPressAction: (() -> Void)? = nil {
        didSet {
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(recognizer:)))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(longPressGesture)
        }
    }
    
    public var onLayoutSubviews: (() -> Void)? = nil
    public var onAwakeFromNib: (() -> Void)? = nil
    open override func prepareForInterfaceBuilder() {
        
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
        onAwakeFromNib?()
    }
    
    @objc public func longPressed(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            onLongPressAction?()
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        controlState = .scaled
    }
    
    public func touchIsAround(touches: Set<UITouch>) -> Bool{
        return touches.filter{bounds.insetBy(dx: -30, dy: -30).contains($0.location(in: self))}.count > 0
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if touchIsAround(touches: touches){
            controlState = .scaled
        }else{
            controlState = .identity
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        func tapIfTouchIsAround(){
            if touchIsAround(touches: touches) {
                onTapAction?()
            }
        }
        if actsFast {
            self.transform = CGAffineTransform.identity
            tapIfTouchIsAround()
            self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
            UIView.animate(withDuration: 0.1, animations: {
                self.controlState = .identity
            }) { _ in
                
            }
        }else {
            UIView.animate(withDuration: 0.1, animations: {
                self.controlState = .identity
            }) { _ in
                tapIfTouchIsAround()
            }
        }
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        controlState = .identity
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        onLayoutSubviews?()
    }
}

@IBDesignable
open class WobbingIcon: WobbingButton {
    
    public var imageView : UIImageView = {
        let iw = UIImageView()
        return iw
    }()
    
    @IBInspectable
    public var image:UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        buildImageView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildImageView()
    }
    
    private func setImageView(imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    }
    
    public func buildImageView() {
        onTapAction = { [weak self] in
            self?.sendActions(for: .allTouchEvents)
        }
        setImageView(imageView: imageView)
        isUserInteractionEnabled = true
    }
    override open var intrinsicContentSize: CGSize {return imageView.bounds.size}
}

@IBDesignable
open class RoundedWobbingControl: WobbingButton {
    override open func awakeFromNib() {
        layer.cornerRadius = bounds.size.height / 2
    }
}

@IBDesignable
open class RoundedWobbingIcon: WobbingIcon {
    override open func awakeFromNib() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
}
