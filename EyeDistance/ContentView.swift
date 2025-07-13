//
//  ContentView.swift
//  EyeDistance
//
//  Created by 凌嘉徽 on 2025/7/13.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(AppModel.self) private var appModel
    
    private var pupillaryDistance:Float? {
        appModel.pupillaryDistanceMod.pupillaryDistance
    }
    
    var body: some View {
        VStack {
            if let pupillaryDistance {
                Text("您的瞳距是：\(pupillaryDistance.formatted())毫米")
            } else {
                Text("请点击下方按钮测量瞳距")
            }

            ToggleImmersiveSpaceButton(havePupillaryDistance: pupillaryDistance != nil)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
