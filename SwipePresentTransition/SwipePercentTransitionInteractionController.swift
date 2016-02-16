
//
//  SwipePercentTransitionInteractionController.swift
//  SwipePresentTransition
//
//  Created by LiChunyu on 16/2/1.
//  Copyright © 2016年 leacode. All rights reserved.
//

import UIKit

class SwipePercentTransitionInteractionController: UIPercentDrivenInteractiveTransition {
    
//    @property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
//    @property (nonatomic, strong, readonly) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
//    @property (nonatomic, readonly) UIRectEdge edge;
    
    var transitionContext: UIViewControllerContextTransitioning!
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer!
    var edge: UIRectEdge!
    
    
    override init() {
        super.init()
    }
    
    convenience init(gestureRecognizer: UIScreenEdgePanGestureRecognizer, edgeForDragging edge: UIRectEdge) {
        self.init()
        
        self.gestureRecognizer = gestureRecognizer
        self.edge = edge
        self.gestureRecognizer.addTarget(self, action: Selector("gestureRecognizeDidUpdate:"))
        
    }
    
    deinit {
        gestureRecognizer.removeTarget(self, action: Selector("gestureRecognizeDidUpdate:"))
    }
    
    override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        super.startInteractiveTransition(transitionContext)
    }
    
    func percentForGesture(gesture: UIScreenEdgePanGestureRecognizer) -> CGFloat {
        
        if self.transitionContext == nil {
            return 0
        }
        
        let transitionContainerView = self.transitionContext.containerView()
        let locationInSourceView = gesture.locationInView(transitionContainerView)
        
        let width = CGRectGetWidth(transitionContainerView!.bounds)
        let height = CGRectGetHeight(transitionContainerView!.bounds)
        
        if self.edge == UIRectEdge.Right {
            return (width - locationInSourceView.x) / width
        } else if self.edge == UIRectEdge.Left {
            return locationInSourceView.x / width
        } else if self.edge == UIRectEdge.Bottom {
            return (height - locationInSourceView.y) / height
        } else if self.edge == UIRectEdge.Top {
            return locationInSourceView.y / height
        } else {
            return 0
        }
        
        
    }
    
    func gestureRecognizeDidUpdate(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
    
        switch gestureRecognizer.state {
        case .Began:
            break
        case .Changed:
            self.updateInteractiveTransition(percentForGesture(gestureRecognizer))
            break
        case .Ended:
            if percentForGesture(gestureRecognizer) >= 0.5 {
                self.finishInteractiveTransition()
            } else {
                self.cancelInteractiveTransition()
            }
            break
        default:
            cancelInteractiveTransition()
            break
        }
        
    }
    
 
    

}
