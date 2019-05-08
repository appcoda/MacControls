//
//  WorkInfoView.swift
//  Mac-Controls
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

class WorkInfoView: NSView, LoadableView {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var professionLabel: NSTextField!
    
    @IBOutlet weak var professionCombo: NSComboBox!
    
    @IBOutlet weak var platformPrefBox: NSBox!
    
    @IBOutlet weak var mobileRadio: NSButton!
    
    @IBOutlet weak var desktopRadio: NSButton!
    
    @IBOutlet weak var webRadio: NSButton!
    
    @IBOutlet weak var experienceLevelLabel: NSTextField!
    
    @IBOutlet weak var experienceYearsLabel: NSTextField!
    
    @IBOutlet weak var experienceLevelSlider: NSSlider!
    
    @IBOutlet weak var experienceYearsSlider: NSSlider!
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    @IBOutlet weak var statusSegmented: NSSegmentedControl!
    
    @IBOutlet weak var satisfactionLabel: NSTextField!
    
    @IBOutlet weak var satisfactionLevelIndicator: NSLevelIndicator!
    
    @IBOutlet weak var relocateCheckbox: NSButton!
    
    
    
    // MARK: - Properties
    
    var mainView: NSView?
    
    
    
    // MARK: - Init
    
    init() {
        super.init(frame: NSRect.zero)
        
        if load(fromNIBNamed: "WorkInfoView") {
            applyConstraints()
            
            relocateCheckbox.state = .off
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: - IBAction Methods
    
    @IBAction func handlePlatformPreference(_ sender: Any) {
        guard let radio = sender as? NSButton else { return }
        print("Selected radio button:", radio.title)
    }
    
    @IBAction func handleExperienceLevelChange(_ sender: Any) {
        switch experienceLevelSlider.intValue {
        case 1: experienceLevelLabel.stringValue = "Experience Level: Junior"
        case 2: experienceLevelLabel.stringValue = "Experience Level: Mid"
        case 3: experienceLevelLabel.stringValue = "Experience Level: Senior"
        default: ()
        }
    }
    
    @IBAction func handleExperienceYearsChange(_ sender: Any) {
        experienceYearsLabel.stringValue = "Years of Experience: \(experienceYearsSlider.intValue)"
    }
    
    @IBAction func handleEmploymentStatusChange(_ sender: Any) {
        let selectedSegment = statusSegmented.selectedSegment
        print(statusSegmented.label(forSegment: selectedSegment))
    }
    
    @IBAction func handleSatisfactionLevelChange(_ sender: Any) {
        satisfactionLabel.stringValue = "Satisfaction Level: \(satisfactionLevelIndicator.intValue)/\(Int(satisfactionLevelIndicator.maxValue))"
    }
    
    @IBAction func handleRelocateChange(_ sender: Any) {
        print("Check box state:", relocateCheckbox.state)
    }
    
    
    
    // MARK: - Constraints
    
    fileprivate func applyConstraints() {
        guard let mainView = mainView else { return }
        
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        professionLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20.0).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        professionLabel.bottomAnchor.constraint(equalTo: professionCombo.topAnchor, constant: -8.0).isActive = true
        
        professionCombo.translatesAutoresizingMaskIntoConstraints = false
        professionCombo.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        professionCombo.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        professionCombo.bottomAnchor.constraint(equalTo: platformPrefBox.topAnchor, constant: -20.0).isActive = true
        
        platformPrefBox.translatesAutoresizingMaskIntoConstraints = false
        platformPrefBox.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        platformPrefBox.widthAnchor.constraint(equalToConstant: 170.0).isActive = true
        platformPrefBox.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -19.0).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: 170.0).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: statusSegmented.topAnchor, constant: -8.0).isActive = true
        
        statusSegmented.translatesAutoresizingMaskIntoConstraints = false
        statusSegmented.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0.0).isActive = true
        statusSegmented.bottomAnchor.constraint(equalTo: satisfactionLabel.topAnchor, constant: -16.0).isActive = true
        
        satisfactionLabel.translatesAutoresizingMaskIntoConstraints = false
        satisfactionLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        satisfactionLabel.widthAnchor.constraint(equalToConstant: 170.0).isActive = true
        satisfactionLabel.bottomAnchor.constraint(equalTo: satisfactionLevelIndicator.topAnchor, constant: -8.0).isActive = true
        
        satisfactionLevelIndicator.translatesAutoresizingMaskIntoConstraints = false
        satisfactionLevelIndicator.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        satisfactionLevelIndicator.widthAnchor.constraint(equalToConstant: 150.0).isActive = true
        satisfactionLevelIndicator.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20.0).isActive = true
        
        experienceLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceLevelLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        experienceLevelLabel.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        experienceLevelLabel.bottomAnchor.constraint(equalTo: experienceLevelSlider.topAnchor, constant: -8.0).isActive = true
        
        experienceLevelSlider.translatesAutoresizingMaskIntoConstraints = false
        experienceLevelSlider.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        experienceLevelSlider.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        experienceLevelSlider.bottomAnchor.constraint(equalTo: experienceYearsLabel.topAnchor, constant: -32.0).isActive = true
        
        experienceYearsLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceYearsLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        experienceYearsLabel.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        experienceYearsLabel.bottomAnchor.constraint(equalTo: experienceYearsSlider.topAnchor, constant: -8.0).isActive = true
        
        experienceYearsSlider.translatesAutoresizingMaskIntoConstraints = false
        experienceYearsSlider.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        experienceYearsSlider.widthAnchor.constraint(equalToConstant: 180.0).isActive = true
        experienceYearsSlider.bottomAnchor.constraint(equalTo: statusSegmented.topAnchor, constant: -44.0).isActive = true
        
        relocateCheckbox.translatesAutoresizingMaskIntoConstraints = false
        relocateCheckbox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        relocateCheckbox.widthAnchor.constraint(equalToConstant: 127.0).isActive = true
        relocateCheckbox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20.0).isActive = true
        
        mobileRadio.translatesAutoresizingMaskIntoConstraints = false
        mobileRadio.leftAnchor.constraint(equalTo: platformPrefBox.leftAnchor, constant: 20.0).isActive = true
        mobileRadio.rightAnchor.constraint(equalTo: platformPrefBox.rightAnchor, constant: -20.0).isActive = true
        mobileRadio.topAnchor.constraint(equalTo: platformPrefBox.subviews[0].topAnchor, constant: 20.0).isActive = true
        mobileRadio.bottomAnchor.constraint(equalTo: desktopRadio.topAnchor, constant: -12.0).isActive = true
        
        desktopRadio.translatesAutoresizingMaskIntoConstraints = false
        desktopRadio.leftAnchor.constraint(equalTo: platformPrefBox.leftAnchor, constant: 20.0).isActive = true
        desktopRadio.rightAnchor.constraint(equalTo: platformPrefBox.rightAnchor, constant: -20.0).isActive = true
        desktopRadio.bottomAnchor.constraint(equalTo: webRadio.topAnchor, constant: -12.0).isActive = true
        
        webRadio.translatesAutoresizingMaskIntoConstraints = false
        webRadio.leftAnchor.constraint(equalTo: platformPrefBox.leftAnchor, constant: 20.0).isActive = true
        webRadio.rightAnchor.constraint(equalTo: platformPrefBox.rightAnchor, constant: -20.0).isActive = true
        webRadio.bottomAnchor.constraint(equalTo: platformPrefBox.subviews[0].bottomAnchor, constant: -20.0).isActive = true
        
    }
    
}
