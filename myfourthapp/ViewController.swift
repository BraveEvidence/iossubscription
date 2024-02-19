//
//  ViewController.swift
//  myfourthapp
//
//  Created by Student on 19/02/24.
//

import UIKit
import Apollo
import MyUserAPI

class ViewController: UIViewController {
    
    var activeSubscription: Cancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startSubscription()
    }
    
    func startSubscription() {
   
           activeSubscription = Network.shared.apollo.subscribe(subscription: MyUserSubscription()) { [weak self] result in
               guard self != nil else {
                   return
               }
               switch result {
               case .success(let graphQLResult):
                   if let user = graphQLResult.data?.newUser {
                       debugPrint(user.name)
                   }
                   if let errors = graphQLResult.errors {
                       debugPrint(errors[0].message ?? "Error")
                   }
               case .failure(let error):
                   debugPrint(error.localizedDescription)
               }
           }
       }


}

