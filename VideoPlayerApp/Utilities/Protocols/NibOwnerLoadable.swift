//
//  NibOwnerLoadable.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//

import UIKit

public protocol NibDefinable: AnyObject {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: Default implementation
public extension NibDefinable {
    // By default, use the nib which have the same name as the name of the class, and located in the bundle of that class
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: .main)
    }
}
/// Make your UIView subclasses conform to this protocol when:
///  * they *are* NIB-based, and
///  * this class is used as the XIB's File's Owner
///
/// to be able to instantiate them from the NIB in a type-safe manner
public protocol NibOwnerLoadable: NibDefinable { }

// MARK: Support for instantiation from NIB
public extension NibOwnerLoadable where Self: UIView {
    // Adds content loaded from the nib to the end of the receiver's list of subviews and adds constraints automatically.

    func loadNibContent() {
        for view in Self.nib.instantiate(withOwner: self, options: nil) {
            if let view = view as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview(view)

                NSLayoutConstraint.activate([
                    view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    view.topAnchor.constraint(equalTo: self.topAnchor),
                    view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
        }
    }
}

// Don't Forget To add For Xib View's
//class AnyView: UIView, NibOwnerLoadable {
//    // MARK: - IBOutlet
//
//    /// - TAG: Initializer
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        loadNibContent()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        loadNibContent()
//    }
//}
//
