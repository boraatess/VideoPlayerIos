//
//  SplashPresenter.swift
//  VideoPlayerApp
//
//  Created by bora ateş on 25.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SplashPresentationLogic {
    
    func presentSomething(response: Splash.Something.Response)
    
}

class SplashPresenter: SplashPresentationLogic {

    weak var viewController: SplashDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: Splash.Something.Response) {
        
        let viewModel = Splash.Something.ViewModel.ReachabilityViewModel(isReachable: response.response.isConnected, networkStatus: response.response.status)
        
        viewController?.displaySomething(viewModel: viewModel)
        
    }
    
}
