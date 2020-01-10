//
//  HomeView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/19.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI
import VisionKit

struct HomeView: View {
    @State var button: Bool = false

    var body: some View {
        NavigationView {
            VStack {
//                Button(action: {
//                    self.button.toggle()
//
//                }) {
//                    Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
//                }
                NavigationLink(destination: ScanningView()){
                    Text("message")
                }
            }
        }
                    
        
            
    }
}

struct NormalView : UIViewControllerRepresentable{
    func makeUIViewController(context: UIViewControllerRepresentableContext<NormalView>) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NormalView>) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
}

struct ScanningView : UIViewControllerRepresentable{
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScanningView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
//        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScanningView>) {
        
    }
    
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
