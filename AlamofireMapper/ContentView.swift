//
//  ContentView.swift
//  AlamofireMapper
//
//  Created by Evgeniy Safin on 09.07.2022.
//

import SwiftUI
import Alamofire
import AlamofireObjectMapper

struct ContentView: View {
    
    var users = [Data]()
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
            .onAppear {
                getUsers()
            }
    }
    
    func getUsers() {
        Alamofire.request(
            "https://reqres.in/api/users",
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: nil)
        .responseObject { (response: DataResponse<UsersResponse>) in
            if let result = response.result.value {
                //self.users = result.users ?? []
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}