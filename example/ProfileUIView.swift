//
//  ProfileUIView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/27.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct ProfileUIView: View {
    @State var button : Bool = false
    @State var appeared: Double = 0.0
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        
//        List {
//            RoundedRectangle(cornerRadius: 4)
//             .foregroundColor(.black)
//             .cornerRadius(4)
//             .frame(height: 104)
//             .padding()
//            ZStack(alignment: .top) {
//
//                Text("Name")
//                Text("Age")
//
//            }
//
//
//
//        }.onAppear(){
//            UITableView.appearance().separatorStyle = .none
//        }
        
//        List {
//            Text("Hello World")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
            
//            Button(action:{
//                self.button.toggle()
//            }){
//                Text("Button")
//                }.padding()
//                .sheet(isPresented: $button){
//                    AngularView()
//            }
//            GridStack(rows: 4, columns: 4) { row, col in
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//            }
//            GridStack(rows: 4, columns: 4) { row, col in
//                HStack {
//                    Image(systemName: "\(row * 4 + col).circle")
//                    Text("R\(row) C\(col)")
//                }
//                }.overlay(AngularView().gesture(
//                    DragGesture(minimumDistance: 50)
//                        .onChanged { _ in
//                            print("Dragged!")
//                        }
//                ))

        
//            AngularView()
//                .frame(width: 100, height: 100)
//                .transition(.move(edge: .trailing))
//            .animation(Animation.linear(duration: 2))
//                .edgesIgnoringSafeArea(.all)
//            AngularView().edgesIgnoringSafeArea(.all)
//        }
        NavigationView {
            GeometryReader { geometry in
                ScrollView (.horizontal){
                    HStack{
                        
                        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                            NavigationLink(destination:ContentView(button: self.$button)
//                                .opacity(self.appeared)
//                                .animation(Animation.easeInOut(duration: 3.0), value: self.appeared)
//                                .onAppear {self.appeared = 1.0}
//                                .onDisappear {self.appeared = 0.0}
                                
                            ){
                                AngularView().frame(width: geometry.size.width-20).padding(.horizontal,10)
                                
                            }
//                            .navigationBarTitle("Hidden Title")
//                            .navigationBarHidden(self.isNavigationBarHidden)
//                            .onAppear {
//                                self.isNavigationBarHidden = true
//                            }
                            
                            
                        }
                        
                    }
                }
                //        .content.offset(x:20)
                //            .frame(width: geometry.size.width)
            }
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct AngularView : View {
    @Environment(\.presentationMode) var presentationMode
    @GestureState var dragAmount = CGSize.zero

    var body: some View {
        Group {
        
//                DraggableView(){
                AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center).cornerRadius(5)
                    
//            }.onTapGesture {
//                self.presentationMode.wrappedValue.dismiss()
//
//            }
        }
        
    }
}

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct DraggableView<Content>: View where Content: View {
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero

    var content: () -> Content

    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut)
            .gesture(
                LongPressGesture(minimumDuration: 0)
                .sequenced(before: DragGesture())
                .updating($dragState, body: { (value, state, transaction) in

                    switch value {
                    case .first(true):
                        state = .pressing
                    case .second(true, let drag):
                        state = .dragging(translation: drag?.translation ?? .zero)
                    default:
                        break
                    }

                })
                .onEnded({ (value) in

                    guard case .second(true, let drag?) = value else {
                        return
                    }

                    self.position.height += drag.translation.height
                    self.position.width += drag.translation.width
                    
                    
                })
            )
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView()
    }
}
