//
//  ViewController.swift
//  Zadanie 2.
//
//  Created by KOVIGROUP on 19/02/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let thread1 = WorkerThread(threadId: 1, resultTextView: resultTextView)
        let thread2 = WorkerThread(threadId: 2, resultTextView: resultTextView)
        thread1.start()
        thread2.start()
    }

}

