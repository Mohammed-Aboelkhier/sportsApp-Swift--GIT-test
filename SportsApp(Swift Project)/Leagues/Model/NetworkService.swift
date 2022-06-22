//
//  NetworkService.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 15/06/2022.
//

import Foundation
import Alamofire

class NetworkService
{
   let Leagueurl = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England"
    
//    let Leagueurl = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer"
    func getLeagueDetails(completion: @escaping (LeagueResults?,Error?) -> ()) {
        
            AF.request(Leagueurl).responseDecodable(of: LeagueResults.self) { response in
                switch response.result
                {
                case .success( _):
                    
                        guard let result = response.value else {return}
                        completion(result,nil)
                    //    print (result)
                    
                    
                case .failure(let error):
                   completion(nil,error)
                }
                
            }
    }
}
