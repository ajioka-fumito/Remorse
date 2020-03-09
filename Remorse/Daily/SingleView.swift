//
//  SingleView.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/08.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct SingleView: View {
    let title:String
    let color:Color
    let times:CGFloat
    
    var body: some View {
        
        Rectangle().foregroundColor(color).opacity(0.1)
            .frame(width:UIScreen.width(2,5),height:UIScreen.height(8, 200)*CGFloat(times))
            .border(color, width: 2)
            .overlay(
                Text("\(title)")
        )
        
    }
}

struct SingleView_Previews: PreviewProvider {
    static var previews: some View {
        SingleView(title:"Run",color:Color.blue,times:2.0)
    }
}
