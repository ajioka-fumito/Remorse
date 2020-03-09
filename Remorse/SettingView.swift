//
//  SettingView.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/07.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var data : SettingData
    let calendarInfo = CalendarInfo()
    var body: some View {
        VStack{
            ForEach(0 ..< calendarInfo.getCalendars().count){ num in
                HStack{
                    Text("\(self.calendarInfo.getCalendars()[num].title)")
                        .frame(width:UIScreen.width(1,3),height: UIScreen.height(1,15))
                        .font(.custom("", size: 20))
                    
                    Button(action:{
                        self.data.calendarleft = num
                    }){
                        if ( self.data.calendarleft == num) {
                            Image(systemName:"1.circle.fill")
                        } else {
                            Image(systemName:"1.circle")
                        }
                    }

                    Button(action:{
                        self.data.calendarright = num
                    }){
                        if ( self.data.calendarright == num) {
                            Image(systemName:"2.circle.fill")
                        } else {
                            Image(systemName:"2.circle")
                        }
                    }
                    
                } // HSstack
            } // ForEach
        } // VStack
    } // body
} // struct


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(SettingData())
    }
}
