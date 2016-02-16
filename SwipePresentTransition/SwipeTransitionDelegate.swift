
//
//  SwipeTransitionDelegate.swift
//  SwipePresentTransition
//
//  Created by LiChunyu on 16/2/1.
//  Copyright © 2016年 leacode. All rights reserved.
//

import UIKit

class SwipeTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    //! If this transition will be interactive, this property is set to the
    //! gesture recognizer which will drive the interactivity.
    
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer!
    var targetEdge: UIRectEdge!
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwipeTransitionAnimator(targetEdge: self.targetEdge)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwipeTransitionAnimator(targetEdge: self.targetEdge)
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if gestureRecognizer != nil {
            return SwipePercentTransitionInteractionController(gestureRecognizer: self.gestureRecognizer, edgeForDragging: self.targetEdge)
        } else {
            return nil
        }
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if gestureRecognizer != nil {
            return SwipePercentTransitionInteractionController(gestureRecognizer: self.gestureRecognizer, edgeForDragging: self.targetEdge)
        } else {
            return nil
        }
    }

}
