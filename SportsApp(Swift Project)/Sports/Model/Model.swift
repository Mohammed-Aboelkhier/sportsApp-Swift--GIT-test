//
//  Model.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 14/06/2022.
//

import Foundation
import Alamofire

class Model
{
    let url = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    
    func getDataFromAPI (completion : @escaping (MyResult?,Error?)->Void)
    {
        AF.request(url).responseDecodable(of: MyResult.self) { response in
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
