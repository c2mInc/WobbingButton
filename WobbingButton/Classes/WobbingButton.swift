//
//  WobbingButton.swift
//  erk ekin
//
//  Created by Erk Ekin on 24.07.2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class WobbingControl:UIControl{

    enum ControlState{
        case scaled
        case identity
    }

    private var controlState : ControlState = .identity {
        didSet{
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
    var scale: CGFloat = 0.92
    let imageView = UIImageView()
    @IBOutlet weak var titleLabel : UILabel?

    var image:UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = image
        }
    }


    @IBInspectable
    var actsFast :Bool = false
    var onTapAction: (() -> Void)? = nil
    var onLongPressAction: (() -> Void)? = nil {
        didSet{
            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(WobbingControl.longPressed))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(longPressGesture)
        }
    }

    @objc func longPressed(){
        self.onLongPressAction?()
    }
    fileprivate func buildImageView() {
        onTapAction = { [weak self] in
            self?.sendActions(for: .allTouchEvents)
        }
        isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        if #available(iOS 9.0, *) {
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
            imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        } else {
            // Fallback on earlier versions
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.controlState = .scaled
    }

    private func touchIsAround(touches: Set<UITouch>) -> Bool{
        return touches.filter{bounds.insetBy(dx: -30, dy: -30).contains($0.location(in: self))}.count > 0
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        if touchIsAround(touches: touches){
            self.controlState = .scaled
        }else{
            self.controlState = .identity
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        func tapIfTouchIsAround(){
            if touchIsAround(touches: touches) {
                self.onTapAction?()
            }
        }
        if actsFast {
            self.transform = CGAffineTransform.identity
            tapIfTouchIsAround()
            self.transform = CGAffineTransform(scaleX: self.scale, y: self.scale)
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            }) { _ in

            }
        }else {
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            }) { _ in
                tapIfTouchIsAround()
            }
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        self.controlState = .identity
    }
}
