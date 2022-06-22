//
//  NetworkServiceLeagueDetails.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 17/06/2022.
//

import Foundation
import Alamofire

class NetworkServiceForLeagueDetails
{
    var upComingEventsURL = ""
    //https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4617
    var allTeamsURL = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
    
    func getUpComingEventsFromAPI(completion : @escaping (AllUpComingEvents?,Error?)->())
    {
        
            AF.request(upComingEventsURL).responseDecodable(of: AllUpComingEvents.self) { response in
                switch response.result
                {
                case .success( _):
                    
                        guard let result = response.value else {return}
                        completion(result,nil)
                        print ("up coming events\(result)")
                    
                    
                case .failure(let error):
                   completion(nil,error)
                }
                
            }
    }
    
    func getTeamsFromAPI (completion : @escaping (allTeams?,Error?)->())
    {
        
            AF.request(allTeamsURL).responseDecodable(of: allTeams.self) { response in
                switch response.result
                {
                case .success( _):
                    
                        guard let result = response.value else {return}
                        completion(result,nil)
                        print ("up coming events\(result)")
                    
                    
                case .failure(let error):
                   completion(nil,error)
                }
                
            }
    }
}
