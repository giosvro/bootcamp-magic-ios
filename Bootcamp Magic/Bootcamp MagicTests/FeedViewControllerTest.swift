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
    
}
