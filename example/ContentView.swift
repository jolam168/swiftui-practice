//
//  ContentView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/18.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var button : Bool = true
    
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
        
        VStack {
            Text("Hello, World!")
                
            Button(action: {
                self.button.toggle()
                
            }) {
                Text("Me")
            }.alert(isPresented: $button) {self.alert}.actionSheet(isPresented: $button, content: {self.actionSheet})
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
