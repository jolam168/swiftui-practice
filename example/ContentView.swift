//
//  ContentView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/18.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Binding var button : Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var actionSheet : ActionSheet{
        ActionSheet(title: Text("Action Sheet"), message: Text("Choose Option"), buttons: [
            .default(Text("Save")),
            .default(Text("Delete")),
            .destructive(Text("Cancel"))
        ])
    }
    
    var alert : Alert{
        Alert(title: Text("yes"), message: Text(""), dismissButton: Alert.Button.cancel()
        )
    }
    
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.4)
                
                
            VStack {
                Text("Hello, World!").foregroundColor(Color.white)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("Me").foregroundColor(Color.white)
                }
                
            }
//            .alert(isPresented: $button) {self.alert}.actionSheet(isPresented: $button, content: {self.actionSheet})
        }.edgesIgnoringSafeArea(.all)
        

    }
}

struct SheetView<Content>: View where Content: View {
    
    var body: some View {
        Text("Hello World!")
    }
}

//struct BottomSheetView<Content: View>: View {
//    typealias Body = <#type#>
//
//
//    @Binding var isOpen: Bool
//
//    let maxHeight: CGFloat
//    let minHeight: CGFloat
//    let content: Content
//
//    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
//        self.minHeight = maxHeight * 0.7
//        self.maxHeight = maxHeight
//        self.content = content()
//        self._isOpen = isOpen
//    }
//}

struct BottomView : View{
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
//                self.indicator.padding()
//                self.content
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.secondary)
                    .frame(
                        width: 100,
                        height: 10
                ).padding()
            }
            
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: 10)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(button: )
//        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.secondary)
//            .frame(
//                width: 100,
//                height: 5
//        )
//    }
//}
