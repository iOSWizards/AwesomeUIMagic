//
//  ViewController.swift
//  AwesomeUIMagic
//
//  Created by Evandro Harrison Hoffmann on 01/20/2017.
//  Copyright (c) 2017 Evandro Harrison Hoffmann. All rights reserved.
//

import UIKit
import AwesomeUIMagic

class ViewController: UIViewController {

    let viewTransitionDelegate = TransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let snapshots = view.snapshotsFrom()
        print("snapshots array: \(snapshots)")
        
//        let redView = snapshots.first!
//        redView.frame = CGRect(x: 100.0, y: 100.0, width: redView.frame.width, height: redView.frame.height)
//        print(redView.frame)
//        view.addSubview(redView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            detailViewController.transitioningDelegate = viewTransitionDelegate
            detailViewController.modalPresentationStyle = .custom
        }
    }

}

