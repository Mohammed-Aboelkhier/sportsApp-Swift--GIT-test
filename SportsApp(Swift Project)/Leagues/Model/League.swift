//
//  League.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 15/06/2022.
//

import Foundation

struct league : Decodable
{
    var strSport : String
    var strLeague :  String
    var strBadge  : String
    var strYoutube : String
    var idLeague : String
}

struct LeagueResults  : Decodable
{
    var countries : [league]
}
