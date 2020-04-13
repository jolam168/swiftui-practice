//
//  DataUIView.swift
//  example
//
//  Created by 林 耀祖 on 2020/03/30.
//  Copyright © 2020 林 耀祖. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

struct Post: Codable , Identifiable{
    let id: Int
    let title: String
    let body: String
    let userId: Int
}


class ListViewModel: ObservableObject {
    
   @Published var isEnabled: Bool = false
   @Published var Posts = [Post]()
    
    init(){
        fetch()
    }
    
    func fetch(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        //traditional
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
            }
            
            if let response = response {
                print(response)
            }
            
            if let d = data {
                do {
                    let decodedLists = try JSONDecoder().decode([Post].self, from: d )
                    DispatchQueue.main.async {
                        self.Posts = decodedLists
                        debugPrint(self.Posts)
                    }
                }catch{
                    print("error")
                }
            }
        }.resume()
        
        //Combine
//        _ = URLSession.shared.dataTaskPublisher(for: url!)
//            .map{ $0.data }
//            .decode(type: [Post].self, decoder: JSONDecoder())
//            .replaceError(with: [])
//            .sink(receiveValue: { posts in
//                print(posts.count)
//                self.Posts = posts
//            })
//            .receive(on: RunLoop.main)
        
        
    }
}


struct DataUIView: View {
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {

        List(viewModel.Posts){ post in
            
            Text(post.title)
            
        }.onAppear(){
            self.viewModel.fetch()
        }
    }
}

struct DataUIView_Previews: PreviewProvider {
    static var previews: some View {
        DataUIView()
    }
}
