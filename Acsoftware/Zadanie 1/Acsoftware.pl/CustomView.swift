//
//  CustomView.swift
//  Acsoftware.pl
//
//  Created by KOVIGROUP on 19/02/2023.
//

import Foundation
import UIKit

class CustomView: UIView {

    var initialCircleCenter: CGPoint?
    let circleSize: CGFloat = 100

    var circleCenter: CGPoint = .zero {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        
        let bigCirclePath = UIBezierPath(ovalIn: rect.insetBy(dx: 10, dy: 10))
        UIColor.red.setStroke()
        bigCirclePath.lineWidth = 2
        bigCirclePath.stroke()

        let smallCircleRect = CGRect(x: circleCenter.x - circleSize/2, y: circleCenter.y - circleSize/2, width: circleSize, height: circleSize)

        let smallCirclePath = UIBezierPath(ovalIn: smallCircleRect)
        UIColor.blue.setStroke()
        smallCirclePath.lineWidth = 2
        smallCirclePath.stroke()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let dx = touchLocation.x - bounds.midX
        let dy = touchLocation.y - bounds.midY
        let distance = sqrt(dx*dx + dy*dy)
        let maxDistance = (bounds.width - circleSize) / 2

        if distance <= maxDistance {
            circleCenter = touchLocation
        } else {
            let scale = maxDistance / distance
            let newCenter = CGPoint(x: bounds.midX + dx * scale, y: bounds.midY + dy * scale)
            circleCenter = newCenter
        }
    }
}
