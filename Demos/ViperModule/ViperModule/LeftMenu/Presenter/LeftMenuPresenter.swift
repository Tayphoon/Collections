//
//  LeftMenuPresenter.swift
//  ViperModule
//
//  Created by Tayphoon on 16/01/2018.
//  Copyright 2018 Tayphoon. All rights reserved.
//

import Foundation

/**
 *  Presenter 
 *	
 */

class LeftMenuPresenter: LeftMenuViewOutput, LeftMenuInteractorOutput {

	weak var view: LeftMenuViewInput?
	var interactor: LeftMenuInteractorInput?
	var router: LeftMenuRouterInput?

	internal func setupView() {
		
	}
}
