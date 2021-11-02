//
//  ARQuickLookView.swift
//  ARQuickLookView
//
//  Created by 蘇健豪 on 2021/8/16.
//

import SwiftUI
import QuickLook
import ARKit

struct ARQuickLookView: UIViewControllerRepresentable {
    
    var name: String
    
    func makeCoordinator() -> ARQuickLookView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ controller: QLPreviewController,
                                context: Context) {
        
    }
    
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        let parent: ARQuickLookView
        
        init(_ parent: ARQuickLookView) {
            self.parent = parent
            super.init()
        }
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            guard let fileURL = Bundle.main.url(forResource: parent.name, withExtension: "usdz") else {
                fatalError("Unable to load \(parent.name).reality from main bundle")
            }
            
            let item = ARQuickLookPreviewItem(fileAt: fileURL)
            item.allowsContentScaling = true
            return item
        }
    }
}

struct ARQuickLookView_Previews: PreviewProvider {
    static var previews: some View {
        ARQuickLookView(name: "shoe")
    }
}
