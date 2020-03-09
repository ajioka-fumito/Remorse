//
//  LeftView.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/08.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct HalfView: View {
    var dailyEvent:[[String]]
    let color:Color
    
    let simplelenth:CGFloat = UIScreen.height(8, 200)
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 0){
                ForEach(6 ..< 26){ _ in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.width(2,5), height: UIScreen.height(8,200))
                        .border(Color.gray,width:0.5)
                } // ForEach
            } // VStack
            ZStack{
                ForEach(0 ..< dailyEvent.count){ i in
                    VStack{
                        Spacer().frame(width: UIScreen.width(2,5), height: self.spaceheight(criterion: self.simplelenth, start: self.dailyEvent[i][1]))
                        SingleView(title: self.dailyEvent[i][0], color: self.color, times: self.times(time:self.dailyEvent[i][2]) )
                        Spacer()
                    } // VStack
                } // ZStack
            } // ForEach
        } // ZStack
    } // body
    
    func spaceheight(criterion:CGFloat,start:String) -> CGFloat {
        let st = (CGFloat(start) ?? 0)/60
        return criterion*(st)
    }
    func times(time:String) -> CGFloat {
        return (CGFloat(time) ?? 0) / 60
    }
} // HalfView


