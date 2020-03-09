//
//  Daily.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/08.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation
import EventKit

class Daily {
    var date:Date
    var calendarId:Int
    
    let calendar = Calendar(identifier: .gregorian)
    let dateInfo = DateInfo()
    var flg:Bool = true
    
    init(date:Date=Date(),calenderId:Int=0){
        self.date = date
        self.calendarId = calenderId
    }
    
    func eventList() -> [[String]] {
        // return title start time and howlong
        var list = [[String]]()
        let schedules = CalendarInfo().getEvents(today: date, calendarId: calendarId)
        for i in (0 ..< schedules.count) {
            let start:Date = schedules[i].startDate
            let end:Date = schedules[i].endDate
            var criterion:Date = calendar.startOfDay(for: start)
            criterion = criterion.addingTimeInterval(3600*6)
            
            let ls: [String] = [schedules[i].title,
                                dateInfo.subToString(from: criterion, to: start),
                                dateInfo.subToString(from: start, to: end)]
            list.append(ls)
        }
        
        return list
        
    }
}
