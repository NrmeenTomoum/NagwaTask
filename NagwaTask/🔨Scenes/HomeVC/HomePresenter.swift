//
//  HomePresenter.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright (c) 2018 Nagwa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
    func presentStopLoader()
    func presentLoader()
    func presentAlertMessage(message : String)
    func presentListOfRepositories(response: [Home.Repository.Response])
}

class HomePresenter: HomePresentationLogic
{

  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
    func presentListOfRepositories(response: [Home.Repository.Response])
    {
        var list = [Home.Repository.ViewModel]()
            for item in response
            {
                
                let viewModel = Home.Repository.ViewModel(id: item.id ?? 0, name: item.name ?? "", description: item.description ?? "" , isLoadingMore: true)
                
                list.append(viewModel)
            }
        viewController?.displayListOfRepositories(viewModel: list)
    }
    func presentAlertMessage(message : String)
    {
        viewController?.createAlert(title: "", subTitle: message)
    }
    func presentStopLoader() {
        viewController?.stopIndecator()
    }
    
    func presentLoader() {
        viewController?.displayIndecator()
    }
}
