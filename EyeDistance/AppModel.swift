//
//  AppModel.swift
//  EyeDistance
//
//  Created by 凌嘉徽 on 2025/7/13.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    var pupillaryDistanceMod = PupillaryDistanceModel()
}

@MainActor
@Observable
class PupillaryDistanceModel {
    var pupillaryDistance:Float? = nil
}
