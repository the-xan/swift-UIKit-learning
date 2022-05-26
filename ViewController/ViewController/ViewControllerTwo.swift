//
//  ViewControllerTwo.swift
//  ViewController
//
//  Created by Timur Alimbekov on 5/26/22.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView")
        hello()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    
    // MARK: - Func
    func hello() {
        print("Hello")
    }
}
