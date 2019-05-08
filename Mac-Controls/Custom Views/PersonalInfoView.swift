//
//  PersonalInfoView.swift
//  Mac-Controls
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

class PersonalInfoView: NSView, LoadableView {
    
    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var fullnameLabel: NSTextField!
    
    @IBOutlet weak var fullnameTextfield: NSTextField!
    
    @IBOutlet weak var genderLabel: NSTextField!
    
    @IBOutlet weak var genderPopup: NSPopUpButton!
    
    @IBOutlet weak var birthdateLabel: NSTextField!
    
    @IBOutlet weak var birthdatePicker: NSDatePicker!
    
    @IBOutlet weak var avatarColorLabel: NSTextField!
    
    @IBOutlet weak var colorWell: NSColorWell!
    
    
    // MARK: - Properties
    
    var mainView: NSView?
    
    
    
    // MARK: - Init
    
    init() {
        super.init(frame: NSRect.zero)
        
        if load(fromNIBNamed: "PersonalInfoView") {
            applyConstraints()
            
            birthdatePicker.dateValue = Date()
            colorWell.color = NSColor.lightGray
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: - IBAction Methods
    
    @IBAction func handleGenderSelection(_ sender: Any) {
        print("Selected gender:", genderPopup.titleOfSelectedItem ?? "")
    }
    
    
    @IBAction func handleDateChange(_ sender: Any) {
        print("Date:", birthdatePicker.dateValue)
    }
    
    
    @IBAction func handleColorPick(_ sender: Any) {
        print("Selected Color:", colorWell.color)
    }
    
    
    
    
    // MARK: - Constraints
    
    fileprivate func applyConstraints() {
        guard let mainView = mainView else { return }
        
        fullnameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullnameTextfield.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderPopup.translatesAutoresizingMaskIntoConstraints = false
        birthdateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdatePicker.translatesAutoresizingMaskIntoConstraints = false
        avatarColorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        
        fullnameLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        fullnameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20.0).isActive = true
        fullnameLabel.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        fullnameLabel.bottomAnchor.constraint(equalTo: fullnameTextfield!.topAnchor, constant: -8.0).isActive = true
        
        fullnameTextfield.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        fullnameTextfield.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        fullnameTextfield.bottomAnchor.constraint(equalTo: genderLabel!.topAnchor, constant: -24.0).isActive = true
        
        genderLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        genderLabel.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        genderLabel.bottomAnchor.constraint(equalTo: genderPopup!.topAnchor, constant: -8.0).isActive = true
        
        genderPopup.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        genderPopup.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        genderPopup.bottomAnchor.constraint(equalTo: avatarColorLabel!.topAnchor, constant: -24.0).isActive = true
        
        birthdateLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        birthdateLabel.topAnchor.constraint(equalTo: genderLabel!.topAnchor, constant: 1.0).isActive = true
        birthdateLabel.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        birthdateLabel.heightAnchor.constraint(equalTo: genderLabel!.heightAnchor, multiplier: 1.0).isActive = true
        
        birthdatePicker.topAnchor.constraint(equalTo: birthdateLabel!.bottomAnchor, constant: 8.0).isActive = true
        birthdatePicker.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0).isActive = true
        birthdatePicker.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        birthdatePicker.heightAnchor.constraint(equalToConstant: 23.0).isActive = true
        
        avatarColorLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        avatarColorLabel.bottomAnchor.constraint(equalTo: colorWell!.topAnchor, constant: 1.0).isActive = true
        avatarColorLabel.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        colorWell.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0).isActive = true
        colorWell.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        colorWell.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }
    
}
