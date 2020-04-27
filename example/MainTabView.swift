//
//  MainTabView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/26.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ListView().tabItem{
                //                Image()
                Text("Chat")
            }
            MainView().tabItem{
                //                Image()
                Text("Main")
            }
            ProfileHomeView().tabItem{
                Text("Main")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
