//
//  ProfileHomeView.swift
//  example
//
//  Created by 林 耀祖 on 2020/04/11.
//  Copyright © 2020 林 耀祖. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
//http://tutorial-mysiteapp.herokuapp.com/api/profile/

struct ProfileItem: Codable , Identifiable{
    let id: Int
    let user_gender: String
    let user_birth: String
    let user_profile_pic: String
    let created_at: String
    let user_info: String
}

class ImageLoader : ObservableObject{
    @Published var data: Data?
    
    init(imageUrl: String){
        let url = URL(string: imageUrl)!
        loadImage(url: url)
    }
    
    func loadImage(url:URL){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
             if let error = error {
                 print(error)
             }
             
             if let response = response {
                 print(response)
             }
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}

class ProfileListViewModel: ObservableObject {
    @Published var profiles = [ProfileItem]()
    func fetch(){
           let url = URL(string: "http://tutorial-mysiteapp.herokuapp.com/api/profile/?format=json")!
                   
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
               if let d = data {
                   do {
                       let decodedLists = try JSONDecoder().decode([ProfileItem].self, from: d )
                       DispatchQueue.main.async {
                           self.profiles = decodedLists
                        
                       }
                   }catch{
                       print ("Error")
                   }
               }else{
                print("error")
            }
           }.resume()
    }
    
    
}

struct RemoteImageView: View{
    @ObservedObject var imageData: ImageLoader
    
    init(url: String) {
        imageData = ImageLoader(imageUrl: url)
    }
    var body: some View{
        
        VStack {
            Image(uiImage:imageData.data != nil ? UIImage(data: imageData.data!)! : UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
        }
        
    }
}

struct ProfileHomeView: View {
    @ObservedObject var viewModel = ProfileListViewModel()
    
    var body: some View {
        List(viewModel.profiles){ p in
            
            HStack {
                RemoteImageView(url: p.user_profile_pic)
                Text(p.user_info)

            }
            
        }.onAppear(){
            self.viewModel.fetch()
        }
    }
}

struct ProfileHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHomeView()
    }
}
