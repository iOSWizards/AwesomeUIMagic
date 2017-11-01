//
//  TransitionPresentationAnimator.swift
//  AwesomeUIMagic_Example
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 01/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class TransitionPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let containerView = transitionContext.containerView
        
        let animationDuration = self.transitionDuration(using: transitionContext)
        
        for snapshot in fromViewController.view.snapshotsFrom() {
            let snapshotView = snapshot.0
            
            let oldFrame = snapshot.2
            let newFrame = toViewController.view.snapshotsFrom().first(where: { $0.0.magicID == snapshotView.magicID })?.2
            snapshotView.transform = CGAffineTransform.identity
            snapshotView.center = snapshot.1
            containerView.addSubview(snapshotView)
            containerView.backgroundColor = fromViewController.view.backgroundColor
            
            // hide the detail view until the snapshot is being animated
            toViewController.view.alpha = 0.0
            fromViewController.view.alpha = 0.0
            containerView.addSubview(toViewController.view)
            
            UIView.animate(withDuration: animationDuration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [.curveEaseInOut],
                           animations: { () -> Void in
                            snapshotView.transform = CGAffineTransform(scaleX: (newFrame?.width ?? 0)/oldFrame.width, y: (newFrame?.height ?? 0)/oldFrame.height)
            }, completion: { (finished) -> Void in
                snapshotView.removeFromSuperview()
                toViewController.view.alpha = 1.0
                transitionContext.completeTransition(finished)
            })
        }
        
        
        
        
    }
    
}
