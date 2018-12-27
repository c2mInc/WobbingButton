//
//  WobbingButton.swift
//  erk ekin
//
//  Created by Erk Ekin on 24.07.2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

public class WobbingControl: UIControl{
    
    public enum ControlState{
        case scaled
        case identity
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
        didSet{
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(WobbingControl.longPressed))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(longPressGesture)
        }
    }
    
    public var onAwakeFromNib: (() -> Void)? = nil
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        onAwakeFromNib?()
    }
    
    @objc public func longPressed(){
        onLongPressAction?()
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        controlState = .scaled
    }
    
    public func touchIsAround(touches: Set<UITouch>) -> Bool{
        return touches.filter{bounds.insetBy(dx: -30, dy: -30).contains($0.location(in: self))}.count > 0
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        if touchIsAround(touches: touches){
            controlState = .scaled
        }else{
            controlState = .identity
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        controlState = .identity
    }
}

public class WobbingControlWithImage: WobbingControl {
    let imageView = UIImageView()
    @IBInspectable
    public var image:UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildImageView()
    }
    
    public func buildImageView() {
        onTapAction = { [weak self] in
            self?.sendActions(for: .allTouchEvents)
        }
        
        isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    }
    
}

public class RoundedWobbingControl: WobbingControl {
    override public func awakeFromNib() {
        layer.cornerRadius = bounds.size.height / 2
    }
}
