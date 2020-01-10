//
//  MainView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/26.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
               
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    HStack {
                        ForEach(0 ..< 2) { item in
                            TempView(row: item)
                        }
                    }.padding(.bottom,0).padding(.top,0)
                }
               
            }.navigationBarTitle("Home")
        }
    }
}


struct TempView: View {
    var row : Int
    var body: some View {
        NavigationLink(destination: DetailView()){
//            ExtractedView().background(Color(.clear)).frame(height:190).cornerRadius(10).padding(.leading,10).padding(.trailing,10)
            VStack {
                if row == 0 {
                    ExtractedView().background(Color(.yellow)).frame(height:190).cornerRadius(10).clipShape(Rectangle()).shadow(radius: 4).padding(.leading, 5).padding(.trailing,5)
                } else {
                    ExtractedView().background(Color(.yellow)).frame(height:190).cornerRadius(10).clipShape(Rectangle()).shadow(radius: 4).padding(.trailing, 5)
                }
            }
            
                
        }.buttonStyle(PlainButtonStyle())
    }
}

    
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ExtractedView: View {
    var body: some View {
    HStack{
        Spacer()
        HStack{
            
            Circle().frame(width:50)
            
            
        }
        HStack{
            Text("Detail").font(.title)
            Spacer()
        }
        Spacer()
    }
    }
}
