//
//  ProfileDetailView.swift
//  example
//
//  Created by 林 耀祖 on 2020/04/14.
//  Copyright © 2020 林 耀祖. All rights reserved.
//

import SwiftUI

struct ProfileDetailView:View {
    var profile : ProfileItem
    var body: some View{
        ZStack{
            VStack {
//                RemoteImageView(url: profile.user_profile_pic)
                Rectangle().cornerRadius(40).foregroundColor(Color.yellow)
                    .shadow(radius: 10)
                Text(profile.user_info)
                Divider()
                Spacer()
            }.padding()
            
//           Button(action: {}) {
//            Text("＋").font(.system(size: 80)).foregroundColor(Color.white)
//               .frame(width: 80, height: 80)
//           }
//           .background(Color.red)
//           .cornerRadius(40)
//           .frame(width: 80, height: 80)
//           .buttonStyle(PlainButtonStyle())
            
            Text("1").foregroundColor(Color.white).font(.system(size: 26))
                .background(Circle().foregroundColor(Color.red).frame(width: 80, height: 80))
                
            
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(profile: ProfileItem(name:"temp"))
    }
}
