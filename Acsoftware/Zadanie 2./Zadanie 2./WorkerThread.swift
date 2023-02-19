//
//  WorkerThread.swift
//  Zadanie 2.
//
//  Created by KOVIGROUP on 19/02/2023.
//

import Foundation
import UIKit

class WorkerThread: Thread {
    let threadId: Int
    let resultTextView: UITextView

    init(threadId: Int, resultTextView: UITextView) {
        self.threadId = threadId
        self.resultTextView = resultTextView
    }

    override func main() {
        for i in 1...20 {
            let sleepTime = arc4random_uniform(1000) + 1
            Thread.sleep(forTimeInterval: Double(sleepTime) / 1000.0)

            DispatchQueue.main.async {
                self.resultTextView.text += "Thread \(self.threadId):\(sleepTime)ms\n"
            }
        }

        DispatchQueue.main.async {
            self.resultTextView.text += "Thread \(self.threadId) done.\n"
        }
    }
}
