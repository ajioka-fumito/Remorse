//
//  dailyView.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/03.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI
import Foundation
struct DailyView: View {
    let date:Date
    @EnvironmentObject var data: SettingData
    var body: some View {
        VStack{
            // Button and date and Button
            HStack{
                Button(action:{
                    let daily = Daily()
                    print(daily.eventList())
                }){
                    Image(systemName: "chevron.left.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                Text(DateInfo(now:date).monthAndDay()).font(.custom("", size: 40))
                Spacer()
                Button(action:{}){
                    Image(systemName: "chevron.right.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
            .frame(width:UIScreen.width(1,1),height:UIScreen.height(1,20))
            
            // time table and schedule(left) and schedule(right)
            HStack(alignment: .center, spacing: 0){
                Spacer().frame(width:UIScreen.width(3,80))
                // time table
                VStack(alignment: .center, spacing: 0){
                    ForEach(6 ..< 26){ time in
                        ZStack(alignment: .topTrailing){
                            Rectangle().foregroundColor(.white)
                            Text(String(format:"%02d:00",time))
                                .foregroundColor(.gray)
                                .font(.custom("", size: 12))
                        }
                        
                        
                        
                    }
                }.frame(width:UIScreen.width(1,8))
                // schedule left
                HalfView(dailyEvent: self.dailyEvent(calendarId: self.data.calendarleft, date: self.data.date) ,color: Color.red)
                    .frame(width:UIScreen.width(2, 5))
                // schedule right
                HalfView(dailyEvent: self.dailyEvent(calendarId: self.data.calendarleft, date: self.data.date) ,color: Color.blue)
                    .frame(width:UIScreen.width(2, 5))
                
                Spacer().frame(width:UIScreen.width(3,80))
            }
        }
    }
    func dailyEvent(calendarId:Int, date:Date ) -> [[String]] {
        let daily = Daily(date:date,calenderId:calendarId)
        return daily.eventList()
    }
} // View



