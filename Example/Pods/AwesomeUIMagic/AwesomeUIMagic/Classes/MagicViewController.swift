//
//  MagicViewController.swift
//  AwesomeUIMagic
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 03/11/17.
//

import UIKit

open class MagicViewController: UIViewController {
    
    let viewTransitionDelegate = TransitionDelegate()
    
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = viewTransitionDelegate
        segue.destination.modalPresentationStyle = .custom
    }
    
}
