//
//  ViewController.swift
//  Cuncurrency4
//
//  Created by minseo Kyung on 5/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    var userInfo = UserInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...2 {
            addName()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Task {
                print("names", await self.userInfo.names)
                print("names count", await self.userInfo.names.count)
            }
        }
    }
    
    func addName() {
        DispatchQueue.global().async {
            Task {
                await self.userInfo.appendName()
            }
        }
    }
}

actor UserInfo {
    nonisolated let myname = "lee"
    
    var names = [String]()
    
    func appendName() {
        names.append("kim")
        print("append done")
    }
}
