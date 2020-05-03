//
//  DragUIView.swift
//  example
//
//  Created by 林 耀祖 on 2020/04/30.
//  Copyright © 2020 林 耀祖. All rights reserved.
//

import SwiftUI

struct DragUIView: View {
    @State private var currentPosition: CGSize = .zero
    
    var body: some View {
        AngularView().frame(
            minWidth:0, maxWidth:.infinity,minHeight: 0, maxHeight: .infinity)
        .cornerRadius(20)
        .offset(y:currentPosition.height)
            .animation(.spring())
        .gesture(
            DragGesture()
                .onChanged({ value in
                    if value.translation.height > 0 && value.translation.height < .infinity {
                        self.currentPosition.height = value.translation.height
                    }
                    
                }).onEnded({ value in
                    self.currentPosition = .zero
                })
        ).edgesIgnoringSafeArea(.bottom)
    }
}

struct DiceView : View {
    @State private var currentPosition: CGSize = .zero
    @State private var didLongPress: Bool = false
    var body: some View{
        AngularView().frame(width: 100, height: 100)
            .offset(self.currentPosition)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
            .scaleEffect(didLongPress ? 1 : 2)
            .gesture(
                DragGesture().onChanged({
                    value in
                    self.currentPosition = value.translation
                    self.didLongPress = true
                }).onEnded({ value in
                    self.currentPosition = .zero
                    self.didLongPress = false
                })
        )
    }
}
struct DragUIView_Previews: PreviewProvider {
    static var previews: some View {
        DragUIView()
    }
}
