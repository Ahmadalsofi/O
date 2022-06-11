//
//  CommentInputView.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/06/2022.
//

import UIKit

class CommentInputView: UIView , NibFileOwnerLoadable {
    

    @IBOutlet weak var textOutlet: UITextField!
    // MARK: - View lifecycle
    override private init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // MARK: - SetUp
    func setup() {
        loadNibContent()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupView(title: String, description: String, image: String, hideTryAgain: Bool) {
        
    }
    func showOn(view: UIView, duration: Double = 0.2, origin:CGPoint =  CGPoint(x: 0, y: 0) ) {
        self.frame.size = view.frame.size
        self.frame.origin = origin
        UIView.transition(with: view, duration: duration, options: [.transitionCrossDissolve], animations: {
            view.addSubview(self)
        }, completion: { (_) in
        })
    }
    func hide() {
        removeFromSuperview()
    }

}

import UIKit

public protocol NibFileOwnerLoadable: class {
    static var nib: UINib { get }
}

public extension NibFileOwnerLoadable where Self: UIView {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    func loadNibContent() {
        guard let view = instantiateFromNib() else {
            fatalError("Failed to instantiate nib \(Self.nib)")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let views = ["view": view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|",
                                                                 options: .alignAllFirstBaseline, metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|",
                                                                   options: .alignAllLastBaseline, metrics: nil, views: views)
        addConstraints(verticalConstraints + horizontalConstraints)
    }
}
