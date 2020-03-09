//
//  SettingData.swift
//  Remorse
//
//  Created by Ajioka Fumito on 2020/03/07.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation
import SwiftUI
class SettingData: ObservableObject{
    // hour minute second
    @Published var authorization:Bool = Authorization().getAuthorizationStatus()
    @Published var calendarleft:Int = 0
    @Published var calendarright:Int = 1
    @Published var date: Date = Date()
}
