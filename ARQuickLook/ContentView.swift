//
//  ContentView.swift
//  ARQuickLook
//
//  Created by 蘇健豪 on 2021/8/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingPreview = false
    @State var allowsScaling = true
    
    var body: some View {
        VStack {
            Toggle("Allow Scaling", isOn: $allowsScaling)
            
            Button("Show Preview") {
                showingPreview.toggle()
            }
            .sheet(isPresented: $showingPreview) {
                sheetView
            }
        }
        .padding()
    }
    
    var sheetView: some View {
        VStack {
            HStack {
                Button("Close") {
                    showingPreview.toggle()
                }
                Spacer()
            }
            .padding()
            
            ARQuickLookView(name: "slipper", allowScaling: allowsScaling)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
