//
//  SplashModels.swift
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

enum Splash
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
        
    }
    struct Response
    {
        var response: ReachabilityResponse
        
    }
    struct ViewModel
    {
        struct ReachabilityViewModel {
            let isReachable: Bool
            let networkStatus: String
        }

        var displayViewModel: ReachabilityViewModel
    }
  }
}
