//
//  ViewController.swift
//  DispatchQueue
//
//  Created by minseo Kyung on 5/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel! // 시간을 표시함
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { time in
            let now = Date()
            let dateString = dateFormatter.string(from: now)
            self.timeLabel.text = dateString
        }
        
    }

    @IBAction func start(_ sender: Any) {
        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish1")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish2")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 잠깐 멈춤, 오래 걸리는 작업이라고 가정
            print("finish3")
        }
    }
    
}

