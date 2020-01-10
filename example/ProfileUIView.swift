//
//  ProfileUIView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/27.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct ProfileUIView: View {
    var body: some View {
        
        List {
            RoundedRectangle(cornerRadius: 4)
             .foregroundColor(.black)
             .cornerRadius(4)
             .frame(height: 104)
             .padding()
            Text("Name")
            Text("Age")
            
            
        }.onAppear(){
            UITableView.appearance().separatorStyle = .none
        }
        
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView()
    }
}
