//
//  FormView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/19.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct FormView: View {
    @State var name = ""
    var body: some View {
        VStack{
            Group {
                TextField("Name", text: $name)
                    .padding(7.0)
            }
                
            Button(action: {
                print("pressed")
            }
            ) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }.padding()
        }

    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
