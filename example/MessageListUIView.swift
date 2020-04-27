//
//  MessageListUIView.swift
//  example
//
//  Created by 林 耀祖 on 2020/04/14.
//  Copyright © 2020 林 耀祖. All rights reserved.
//

import SwiftUI

struct MessageItemView: View {
    var profile : ProfileItem
    var body: some View{
        HStack{
            RemoteImageView(url: profile.user_profile_pic)
            VStack{
                Text("Name")
                Text("")
                Spacer()
            }
        }
    }
    
}

struct MessageListUIView: View {
    var profile : ProfileItem
    var body: some View {
        NavigationView{
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                NavigationLink(destination:DetailView()){
//                    MessageItemView(profile: self.profile)
                    ItemView()
                }
            }
        }
    }
}

struct MessageListUIView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListUIView(profile: ProfileItem(name:"temp"))
    }
}
