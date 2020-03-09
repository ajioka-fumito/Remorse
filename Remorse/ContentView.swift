//
//  ContentView.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/02/29.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI
import EventKit

struct ContentView: View {
    let calendar:Calendar = Calendar(identifier: .gregorian)
    let dateInfo = DateInfo(now:Date())
    @EnvironmentObject var  data : SettingData
    @State var isModal : Bool = false
    
    var body: some View {
        VStack{
            if Authorization().getAuthorizationStatus() {
                // Top Bar
                HStack(alignment: .center){
                    Spacer().frame(width:5)
                    // option button
                    Button(action:{
                        self.isModal = true
                    }){
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .frame(width:UIScreen.height(1, 30),height:UIScreen.height(1, 30))
                    }
                    .sheet(isPresented: self.$isModal){
                        SettingView().environmentObject(self.data)
                    }
                    Spacer()
                    Button(action:{}){
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width:UIScreen.height(1, 30),height:UIScreen.height(1, 30))
                        Spacer().frame(width:5)
                    }
                    
                }.frame(width: UIScreen.width(1, 1), height: UIScreen.height(1, 20))
                DailyView(date:self.data.date)
                
            } else {
                VStack{
                    Button(action: {
                        self.data.authorization = Authorization().getAuthorizationStatus()
                    }){
                        Image(systemName: "goforward")
                    } // Button
                } // VStack
            } // HStack
            
        } // VStack
    } // body
} // View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingData())
    }
}
