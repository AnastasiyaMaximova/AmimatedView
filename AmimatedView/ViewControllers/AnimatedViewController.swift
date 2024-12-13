//
//  ViewController.swift
//  AmimatedView
//
//  Created by Anastasya Maximova on 11.12.2024.
//

import UIKit
import SpringAnimation

final class AnimatedViewController: UIViewController {
    
    private var animation = Animation.getDefaultValues()
    
    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet var infoLabels: [UILabel]!
    @IBOutlet weak var runButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInfoLabels()
    }
    
    @IBAction func runButtonPressed() {
        setInfoLabels()
        
        animatedView.animation = animation.preset
        animatedView.curve = animation.curve
        animatedView.force = animation.force
        animatedView.duration = animation.duration
        animatedView.delay = animation.delay
        animatedView.animate()
        
        getRandomAnimation()
        
        runButton.setTitle("Run \(animation.preset)", for: .normal)
    }
    
    private func getRandomAnimation () {
        let preset = AnimationPreset.allCases.randomElement()
        let curve = AnimationCurve.allCases.randomElement()
        
        animation.preset = preset?.rawValue ?? ""
        animation.curve = curve?.rawValue ?? ""
        animation.force = Double.random(in: 0...5)
        animation.duration = Double.random(in: 1...3)
        animation.delay = Double.random(in: 0...2)
    }
    
    private func setInfoLabels () {
        for label in infoLabels {
            switch label.tag {
            case 0:
                label.text = "Preset: \(animation.preset)"
            case 1:
                label.text = "Curve: \(animation.curve)"
            case 2:
                label.text = "Forse: \(String (format: "%.2F", animation.force))"
            case 3:
                label.text = "Duration: \(String (format: "%.2F", animation.duration))"
            default:
                label.text = "Delay: \(String (format: "%.2F", animation.delay))"
            }
        }
    }
}

