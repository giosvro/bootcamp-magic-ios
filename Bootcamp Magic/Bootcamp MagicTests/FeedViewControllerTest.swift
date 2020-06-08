//
//  FeedViewControllerTest.swift
//  Bootcamp MagicTests
//
//  Created by mariaelena.silveira on 08/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Nimble
import Quick
import Nimble_Snapshots

@testable import Bootcamp_Magic

class FeedViewControllerTest: QuickSpec {
    
    override func spec() {
        
        describe("FeedView") {
            var view: FeedView!
            let viewController = FeedViewController(feedViewModel: FeedViewModel())
            
            
            beforeEach {
                view = FeedView(frame: .zero, delegate: viewController)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            it("should have a cool layout") {
                expect(view).to(haveValidSnapshot())
//                expect(view).to(haveValidSnapshot(named: "something custom"))
            }
        }
    }
    
//    override func spec() {
//
//           describe("LoginView") {
//
//               var view: LoginView!
//
//               beforeEach {
//                   view = LoginView()
//                   view.translatesAutoresizingMaskIntoConstraints = false
//               }
//
//               it("should have a cool layout") {
//                   expect(view) == recordSnapshot()
//               }
//
//               it("should hide loginButton if user set username only") {
//                   view.userNameTextField.setTextAndSendEvent("username")
//
//                   expect(view) == recordSnapshot()
//               }
//
//               it("should hide loginButton if user set password only") {
//                   view.passwordTextField.setTextAndSendEvent("password")
//
//                   expect(view) == recordSnapshot()
//               }
//
//               it("should show loginButton if user set username and password") {
//                   view.userNameTextField.setTextAndSendEvent("username")
//                   view.passwordTextField.setTextAndSendEvent("password")
//
//                   expect(view) == recordSnapshot()
//               }
//           }
//       }
}
