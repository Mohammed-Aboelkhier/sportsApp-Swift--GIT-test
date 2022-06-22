//
//  LeagueDetailsViewModel.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 18/06/2022.
//

import Foundation

class leagueDetailsViewModel
{
    var networkService = NetworkServiceForLeagueDetails()
    var arrayOfEvents = [UPComingEvent]()
    var bindingClosure : (()->()) = {}
    var arrOfFilterdEvemts = [UPComingEvent]()
    var arrayOfTeams = [team]()
    var leagueID = ""
    
    func getUpComingEvents()
    {
      networkService.upComingEventsURL = "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(leagueID)"
        networkService.getUpComingEventsFromAPI { result, error in
            
            guard let result = result else {
                print (error?.localizedDescription)
                return
            }
            self.arrayOfEvents = result.events
            self.bindingClosure()
        }
    }
    func getAllTeams()
    {
        networkService.getTeamsFromAPI { result, error in
            guard let result = result else {
                print (error?.localizedDescription)
                return
            }
            self.arrayOfTeams = result.teams
            self.bindingClosure()
        }
    }
    
    func filterEvents ()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        //var tempDate = dateFormatter.date(from: )
        for item in arrayOfEvents
        {
            guard var tempDate = dateFormatter.date(from:item.dateEvent ) else { return }
            var currentDateString = dateFormatter.string(from: Date.now)
            var currentDate = dateFormatter.date(from: currentDateString)
            if tempDate > currentDate!
            {
                arrOfFilterdEvemts.append(item)
                
            }
            print(arrOfFilterdEvemts)
        }
    }
    
}
