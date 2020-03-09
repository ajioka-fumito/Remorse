//
//  DateInfo.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/03.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation

class DateInfo {
    let calendar = Calendar(identifier: .gregorian)
    var now: Date
    
    init(now:Date = Date()) {
        self.now = now
    }
    
    func weekDay() -> Int {
        return calendar.component(.weekday, from: self.now)
    }
    
    func monthAndDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM  d"
        return dateFormatter.string(from: self.now)
    }
    

    func subToString(from:Date,to:Date) -> String {
        let components = calendar.dateComponents([.hour,.minute], from: from, to: to)
        let sub:String = String((components.hour ?? 0)*60 + (components.minute ?? 0)  )
        return sub
    }
    
   
}
