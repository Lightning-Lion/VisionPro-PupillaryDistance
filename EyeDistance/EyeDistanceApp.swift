//
//  EyeDistanceApp.swift
//  EyeDistance
//
//  Created by 凌嘉徽 on 2025/7/13.
//

import SwiftUI
import CompositorServices
import os
import RealityKit

@main
struct EyeDistanceApp: App {

    @State private var appModel = AppModel()
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
ImmersiveSpace(id: appModel.immersiveSpaceID) {
    CompositorLayer(renderer: { renderer in
        let drawables = renderer.queryNextFrame()!.queryDrawables()
        guard let drawable = drawables.first else { fatalError("请CompositorServices异常") }
        let views = drawable.views
        os_log("眼睛数量：\(views.count)")
        guard views.count == 2 else { fatalError("请在Vision Pro真机上运行") }
        let leftView = drawable.views[0]
        let leftViewOffset = leftView.transform
        
        let rightView = drawable.views[1]
        let rightViewOffset = rightView.transform
        
        os_log("左眼位移：\(Transform(matrix: leftViewOffset).translation)")
        os_log("右眼位移：\(Transform(matrix: rightViewOffset).translation)")
        let pupillaryDistance = distance(Transform(matrix: leftViewOffset).translation, Transform(matrix: rightViewOffset).translation)*1000
        os_log("瞳距（米）：\(pupillaryDistance)")
    })
}
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
