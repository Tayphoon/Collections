//
//  LeftMenuAssembly.swift
//  ViperModule
//
//  Created by Tayphoon on 16/01/2018.
//  Copyright 2018 Tayphoon. All rights reserved.
//

import UIKit

/**
 *  Interactor 
 *	
 */

class LeftMenuAssembly {

    static func createModule() -> UIViewController {
        let viewModel = LeftMenuViewModel()
        let view = LeftMenuViewController(viewModel: viewModel)
        let interactor = LeftMenuInteractor()
        let presenter = LeftMenuPresenter()
        let router = LeftMenuRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        router.transitionHandler = view
        
        return view
    }
}
