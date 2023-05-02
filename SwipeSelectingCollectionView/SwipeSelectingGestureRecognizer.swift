//
//  SwipeSelectingGestureRecognizer.swift
//  SwipeSelectingCollectionView
//
//  Created by Oleksandr Balabon on 02.05.2023.
//

import UIKit

class SwipeSelectingGestureRecognizer: UIPanGestureRecognizer {

    private var beginPoint: CGPoint?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        beginPoint = touches.first?.location(in: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        defer {
            super.touchesMoved(touches, with: event)
            self.beginPoint = nil
        }
        guard let view = self.view,
            let touchPoint = touches.first?.location(in: view),
            let beginPoint = self.beginPoint else {
                return
        }
        let deltaY = abs(beginPoint.y - touchPoint.y)
        let deltaX = abs(beginPoint.x - touchPoint.x)
        if deltaY != 0 && deltaY / deltaX > 1 {
            state = .failed
            return
        }
    }
}
