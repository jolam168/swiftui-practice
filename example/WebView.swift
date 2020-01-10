//
//  WebView.swift
//  example
//
//  Created by 林 耀祖 on 2019/12/19.
//  Copyright © 2019 林 耀祖. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: View {
    
    @State var url = ""
    var body: some View {
        VStack{
            TextField("Enter Url Here", text: $url).textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .padding()
            WebViewContent(urlrequest:$url)
        }
    }
}

struct WebViewContent : UIViewRepresentable {
    typealias UIViewType = WKWebView
    @Binding var urlrequest : String
    
    func makeUIView(context: UIViewRepresentableContext<WebViewContent>) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViewContent>) {
    
        guard let link = URL(string: urlrequest)
        else{
            print("not found")
            return
            
        }
        uiView.load(URLRequest(url: link))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
