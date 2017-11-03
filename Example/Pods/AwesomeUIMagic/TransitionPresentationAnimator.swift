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
        
        let group = DispatchGroup()
        for snapshot in fromViewController.view.snapshotsFrom() {
            let snapshotView = snapshot.0
            let newSnapshotView = toViewController.view.snapshotsFrom().first(where: { $0.0.magicID == snapshotView.magicID })
            
            let oldFrame = snapshot.2
            let newFrame = newSnapshotView?.2
            snapshotView.transform = CGAffineTransform.identity
            snapshotView.center = snapshot.1
            containerView.addSubview(snapshotView)
            containerView.backgroundColor = UIColor.clear
            
            // hide the detail view until the snapshot is being animated
            toViewController.view.isHidden = true
            containerView.addSubview(toViewController.view)
            hiddenNecessaryViews(true, snapshotView: snapshotView, fromViewController: fromViewController, toViewController: toViewController)
            
            group.enter()
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: [.curveEaseInOut],
                           animations: { () -> Void in
                            snapshotView.transform = CGAffineTransform(scaleX: (newFrame?.width ?? 0)/oldFrame.width, y: (newFrame?.height ?? 0)/oldFrame.height)
                            snapshotView.center = newSnapshotView?.1 ?? CGPoint(x: 0, y: 0)
            }, completion: { (finished) -> Void in
                UIView.transition(with: toViewController.view, duration: 0.5, options: [.curveEaseInOut], animations: {
                    snapshotView.removeFromSuperview()
                    self.hiddenNecessaryViews(false, snapshotView: snapshotView, fromViewController: fromViewController, toViewController: toViewController)
                    toViewController.view.isHidden = false
                }, completion: { (success) in
                    group.leave()
                })
            })
        }
        
        group.notify(queue: .main) {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    
    }
    
    fileprivate func hiddenNecessaryViews(_ isHidden: Bool, snapshotView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        hiddenNecessaryViewRec(isHidden, subviews: fromViewController.view.subviews, snapshotView: snapshotView)
        hiddenNecessaryViewRec(isHidden, subviews: toViewController.view.subviews, snapshotView: snapshotView)
    }
    
    fileprivate func hiddenNecessaryViewRec(_ isHidden: Bool, subviews: [UIView], snapshotView: UIView) {
        for view in subviews {
            if view.magicID == snapshotView.magicID {
                view.isHidden = isHidden
            }
            
            if !view.subviews.isEmpty {
                hiddenNecessaryViewRec(isHidden, subviews: view.subviews, snapshotView: snapshotView)
            }
        }
    }
    
}
