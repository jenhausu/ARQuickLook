//
//  ContentView.swift
//  ARQuickLook
//
//  Created by 蘇健豪 on 2021/8/16.
//

import SwiftUI

struct ContentView: View {
    
    private let modelNames = ["slipper", "shoe", "franchshoe", "叉燒包"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelNames.indices) { index in
                    NavigationLink(destination: ARQuickLookView(name: modelNames[index]).navigationTitle(modelNames[index])) {
                        ModelRow(name: modelNames[index])
                    }
                }
            }
            .navigationTitle("模型列表")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct ModelRow: View {
    
    var name: String
    
    var body: some View {
        Text(name)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
