//
//  ViewModel.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 14/06/2022.
//

import Foundation

class viewModel
{
    var sportsArray = [Sport]()
    var myModel = Model()
    
    
    var bindingClosure :( ()->()) = {}
    
    
    //getting data from Api
    func getData () -> ()
    {
    myModel.getDataFromAPI(completion: { result,error in
        guard let result = result else {
            print (error!.localizedDescription)
            return}
        self.sportsArray = result.sports
           // print (result.sports)
            self.bindingClosure()
        })
        
    }
    }
    
    
   
    
    

