//
//  Sample.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/02/29.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation
import EventKit

class CalendarInfo {
    let eventStore = EKEventStore()
    
    func getEvents(today:Date,calendarId:Int) -> [EKEvent]{
        let calendar = Calendar(identifier: .gregorian)
        // fix time difference
        let start = calendar.startOfDay(for: today)
        let end:Date    = Date(timeInterval: 3600*24, since: start)
        let defaultCalendar = self.getCalendars()[calendarId]
        let predicate = eventStore.predicateForEvents(withStart:start, end: end, calendars: [defaultCalendar])
        let events = eventStore.events(matching: predicate)
        return events
    }
    
    func getCalendars() -> [EKCalendar]{
        let calendars = eventStore.calendars(for: .event)
        var localCalendars:[EKCalendar] = []
        for i in 0 ..< calendars.count {
            if (calendars[i].allowsContentModifications) {
                localCalendars.append(calendars[i])
            }
        }
        return localCalendars
    }
}
