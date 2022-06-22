//
//  ViewModel.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 15/06/2022.
//

import Foundation


class LeaguesViewModel
{
    var arrayOfLeagues = [league]()
    var arrayOfFilteredLeagues = [league]()
    var LeaguesNetworkService = NetworkService()
    var LeaguesBindingClosure : (()->()) = {}
    
    
    func callNetworkService()
    {
        LeaguesNetworkService.getLeagueDetails { result, error in
            guard let result = result else {
                print (error?.localizedDescription)
                return
            }
            self.arrayOfLeagues = result.countries
            self.LeaguesBindingClosure()

        }
    }
    
    func filterResults (sport : String ) -> ()
    {
        for item in arrayOfLeagues
        {
            if item.strSport == sport
            {
                self.arrayOfFilteredLeagues.append(item)
            }
        }
    }
    
    
}
