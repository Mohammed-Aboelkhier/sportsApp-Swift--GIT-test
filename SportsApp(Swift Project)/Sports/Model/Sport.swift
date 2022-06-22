//
//  Sport.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 14/06/2022.
//

import Foundation

struct Sport : Decodable
{
    var strSport : String
    var strSportThumb : String
}

struct MyResult : Decodable
{
    var sports : [Sport]
}



