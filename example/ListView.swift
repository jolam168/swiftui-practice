//
//  ListView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/26.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
           

            List {
                ForEach(0 ..< 5) { item in
                    NavigationLink(destination:DetailView()){
                           ItemView()
                    }
                    
                }
            }.navigationBarTitle("Chat")
            }
    }
}

struct DetailView: View {
    var body: some View {
        ScrollView{
            VStack {
//                ForEach(0 ..< 5) { item in
                    DetailLeftRowView()
                    DetailRightRowView()
                
//                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
//        ListView()
        DetailView()
    }
}

struct ItemView: View {
    var body: some View {
        
        HStack {
            Circle().frame(width:50)
            VStack{
                Text("Title").font(.title).bold()
                Text("Detail").font(.subheadline)
                Spacer()
            }
            Spacer()
        }
    }
}

struct DetailLeftRowView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack{
                Circle()
                Text("Detail").font(.title)
                
            }.frame(width:300, height:60).background(Color(.cyan))
             
        }.padding(.trailing,15)
    }
}

struct DetailRightRowView: View {
    var body: some View {
        HStack {
            
            HStack{
                Text("Detail").font(.title)
                Circle()
                
                
            }.frame(width:300, height:60).background(Color(.cyan))
            Spacer()
        }.padding(.leading,15)
    }
}
