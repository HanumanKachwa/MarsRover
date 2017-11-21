//
//  MarsRover.swift
//  MarsRover
//
//  Created by Hanuman on 21/11/17.
//  Copyright © 2017 Hanuman. All rights reserved.
//

import Foundation
import UIKit

enum CompassPoint: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

typealias Point = (x: Int, y: Int)

class MarsRover {
    private var origin: Point
    private var heading: CompassPoint
    
    init(xPosition: Int, yPosition: Int, direction: CompassPoint) {
        origin = Point(x: xPosition, y: yPosition)
        heading = direction
    }
    
    init(point: Point, direction: CompassPoint) {
        origin = point
        heading = direction
    }
    
    func turnLeft() {
        switch heading {
        case .north:
            heading = .west
        case .west:
            heading = .south
        case .south:
            heading = .east
        case .east:
            heading = .north
        }
    }
    
    func turnRight() {
        switch heading {
        case .north:
            heading = .east
        case .west:
            heading = .north
        case .south:
            heading = .west
        case .east:
            heading = .south
        }
    }
    
    func goForward() {
        switch heading {
        case .north:
            origin.y += 1
        case .west:
            origin.x -= 1
        case .south:
            origin.y -= 1
        case .east:
            origin.x += 1
        }
    }
    
    func getCurrentPosition() -> String {
        return String(format: "%d %d %@\n", origin.x, origin.y, heading.rawValue)
    }
}
