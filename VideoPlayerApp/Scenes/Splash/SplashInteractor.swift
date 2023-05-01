//
//  SplashInteractor.swift
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

protocol SplashBusinessLogic {
    
    func doSomething(request: Splash.Something.Request)
}

protocol SplashDataStore {
  //var name: String { get set }
}

class SplashInteractor: SplashBusinessLogic, SplashDataStore {
 
    var presenter: SplashPresentationLogic?
    var worker: SplashWorker?
    
    // var name: String = ""
  
    // MARK: Do something
  
  func doSomething(request: Splash.Something.Request) {
  
      worker = SplashWorker()
      worker?.doSomeWork()
    
      if Reachability.isConnectedToNetwork() {
          let response = Splash.Something.Response(response: ReachabilityResponse(isConnected: true, status: "Internet Connection Available!"))
          presenter?.presentSomething(response: response)
          print("Internet Connection Available!")
          
      }
      else{
          print("Internet Connection not Available!")
          let response = Splash.Something.Response(response: ReachabilityResponse(isConnected: false, status: "Internet Connection not Available!"))
          presenter?.presentSomething(response: response)
          
      }
      
  }
    
}