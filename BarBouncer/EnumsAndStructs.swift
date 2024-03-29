//
//  EnumsAndStructs.swift
//  BarBouncer
//
//  Created by Brian Cao on 10/11/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import os.log

//var screenSize = CGSize(width: 0, height: 0)
let standardGreyBackgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
//var levelSelectScenes: Array<LevelSelectScene> = []
var furthestCompletedLevel:Int = 0

// Might want to get rid of this later

enum direction {
    case up, down, right, left
}

enum Angle {
    case right, left, straight, flat
}

enum BarSize {
    case small, medium, large
}

struct BitMask {
    static let bounceBar: UInt32 = 0x1 << 1
    static let ball: UInt32 = 0x1 << 2
    static let endZone: UInt32 = 0x1 << 3
    static let solidBar: UInt32 = 0x1 << 4
    static let breakBar : UInt32 = 0x1 << 5
    
}

enum roundDirection {
    case up
    case down
}

struct Keys {
    static let furthestCompletedLevel = "furthestCompletedLevel"
    static let savedEditedLevels = "savedEditedLevels"
}

struct GameData {
    
    var ball: Ball
    var endZone: EndZone
    var bounceBars: [BounceBar]
    var solidBars: [SolidBar]
    var breakBars: [BreakBar]
    
    init(ball: Ball, endZone: EndZone, bounceBars:[BounceBar] = [], solidBars:[SolidBar] = [], breakBars:[BreakBar] = []) {
        self.ball = ball
        self.endZone = endZone
        self.bounceBars = bounceBars
        self.solidBars = solidBars
        self.breakBars = breakBars
    }
    
    func clone() -> GameData {
        let bounceBarClones: [BounceBar] = {
            var array:[BounceBar] = []
            for bar in bounceBars{array.append(bar.clone())}
            return array
        }()
        let solidBarClones: [SolidBar] = {
            var array:[SolidBar] = []
            for bar in solidBars{array.append(bar.clone())}
            return array
        }()
        let breakBarClones: [BreakBar] = {
            var array:[BreakBar] = []
            for bar in breakBars{array.append(bar.clone())}
            return array
        }()
        
        return GameData(ball: ball.clone(), endZone: endZone.clone(), bounceBars: bounceBarClones, solidBars: solidBarClones, breakBars: breakBarClones)
    }
    
    func printData() {
        var bounceBarsPrint: String = ""
        var solidBarsPrint: String = ""
        var breakBarsPrint: String = ""
        for bar in bounceBars{bounceBarsPrint.append(bar.print())}
        for bar in solidBars{solidBarsPrint.append(bar.print())}
        for bar in breakBars{breakBarsPrint.append(bar.print())}
        
        
        print("GameData(ball: (\(self.ball.print())), endZone: (\(self.endZone.print())), bounceBars: [\(bounceBarsPrint)], solidBars: [\(solidBarsPrint)], breakBars: [\(breakBarsPrint)]),")
    }
    
}



