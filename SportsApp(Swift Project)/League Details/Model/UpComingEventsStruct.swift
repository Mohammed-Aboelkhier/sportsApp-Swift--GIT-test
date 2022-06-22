//
//  UpComingEventsStruct.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 18/06/2022.
//

import Foundation

struct UPComingEvent : Decodable
{
    var strEvent:String
    var dateEvent:String
    var strTime : String
    var strHomeTeam : String
    var strAwayTeam : String
    var intHomeScore  :String
    var intAwayScore : String
}

struct AllUpComingEvents : Decodable
{
    var events : [UPComingEvent]
}

struct team : Decodable
{
    var strTeambadge : String
    
}

struct allTeams : Decodable
{
    var teams : [team]
}
