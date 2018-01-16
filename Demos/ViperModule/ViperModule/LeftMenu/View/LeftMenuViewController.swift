//
//  LeftMenuViewController.swift
//  ViperModule
//
//  Created by Tayphoon on 16/01/2018.
//  Copyright 2018 Tayphoon. All rights reserved.
//

import UIKit
import Collections

/**
 *  View 
 *	
 */

class LeftMenuViewController: TableController, LeftMenuViewInput {
	
	var output: LeftMenuViewOutput?

	override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.setupView()
        
        self.view.backgroundColor = UIColor.white
    }
}
