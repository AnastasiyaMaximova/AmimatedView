//
//  Animations.swift
//  AmimatedView
//
//  Created by Anastasya Maximova on 12.12.2024.
//

import Foundation

struct Animation {
    var preset: String
    var curve: String
    var force: Double
    var duration: Double
    var delay: Double
    
    static func getDefaultValues() -> Animation {
        Animation(
            preset: "squeeze",
            curve: "easeOut",
            force: 1.24,
            duration: 0.82,
            delay: 0.30
        )
    }
}
