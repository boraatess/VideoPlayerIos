//
//  Utils.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 1.05.2023.
//

import UIKit

class Utils {
    
    static let shared = Utils()
    
    func showPopup(title: String, message: String, view: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        view.present(alert, animated: true)
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
    }
    
}
