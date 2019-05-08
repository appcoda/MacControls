//
//  ViewController.swift
//  Mac-Controls
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tabView: NSTabView!
    
    
    var personalInfoView: PersonalInfoView?
    
    var workInfoView: WorkInfoView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let view1 = tabView.tabViewItem(at: 0).view, let view2 = tabView.tabViewItem(at: 1).view else { return }
        
        personalInfoView = PersonalInfoView()
        personalInfoView?.add(toView: view1)
        
        workInfoView = WorkInfoView()
        workInfoView?.add(toView: view2)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
