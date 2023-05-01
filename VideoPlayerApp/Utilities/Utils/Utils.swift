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
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 5
        // let when = (DispatchTime.now().uptimeNanoseconds + (5 * UInt64(seconds)))

        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
}
