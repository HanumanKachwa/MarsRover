//
//  MarsRoverViewModel.swift
//  MarsRover
//
//  Created by Hanuman on 22/11/17.
//  Copyright © 2017 Hanuman. All rights reserved.
//

import Foundation

typealias Rect = (x: Int, y: Int, width: Int, height: Int)

enum Command: Character {
    case left = "L"
    case right = "R"
    case move = "M"
}

class MarsRoverViewModel {
    private var plateau = Rect(x: 0, y: 0, width: 0, height: 0)
    private var marsRovers = [MarsRover]()
    
    func processUserData(input: String) -> String {
        let inputLines = input.components(separatedBy: CharacterSet.newlines)
        guard inputLines.count > 3 else {
            return "Invalid data"
        }
        guard let plateauData = inputLines.first else {
            return "Invalid plateau data"
        }
        let roverData = Array(inputLines[1..<inputLines.count])
        
        createPlateau(plateauInput: plateauData)
        processRoverData(roverData: roverData)
        
        return createOutputText(rovers: marsRovers)
    }
    
    func createOutputText(rovers:Array<MarsRover>)->String{
        var outputString = ""
        for rover in rovers{
            outputString += rover.getCurrentPosition()
        }
        return outputString
    }
    
    //MARK: - plateau
    func createPlateau(plateauInput: String) {
        let sizeString = plateauInput.components(separatedBy: " ")
        guard sizeString.count == 2 else {
            print("Invalid plateau data format")
            return
        }
        plateau = Rect(x: 0, y: 0, width: Int(sizeString[0]) ?? 0, height: Int(sizeString[1]) ?? 0)
    }
    
    //MARK: marsRover
    func processRoverData(roverData: Array<String>) {
        for i in (0 ..< roverData.count) where i % 2 == 0{
            let marsRoverInput = Array(roverData[i...i+1])
            guard let marsRover = createMarsRover(roverInput: marsRoverInput[0]) else {
                print("Unable to initialize rover")
                return
            }
            processCommand(rover: marsRover, roverMovement: marsRoverInput[1])
            marsRovers.append(marsRover)
        }
    }
    
    func createMarsRover(roverInput: String) -> MarsRover! {
        let startPosition = roverInput.components(separatedBy: " ")
        guard startPosition.count == 3 else {
            print("Invalid rover initial position")
            return nil
        }
        
        let startPoint = Point(x: Int(startPosition[0]) ?? 0,
                               y: Int(startPosition[1]) ?? 0)
        
        guard let startDirection = CompassPoint(rawValue: startPosition[2]) else {
            print("Invalid direction")
            return nil
        }
        return MarsRover.init(point: startPoint, direction: startDirection)
    }
    
    
    func processCommand(rover: MarsRover, roverMovement: String){
        for char in roverMovement.characters {
            guard let command = Command(rawValue: char) else { return }
            switch command {
            case .left:
                rover.turnLeft()
            case .right:
                rover.turnRight()
            case .move:
                rover.goForward()
            }
        }
    }
}
