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
  
    @State var users = [Data]()
    @State var allUsers: [String] = []
    @State var loading: Bool = false
    
    var body: some View {
        
        NavigationView {
                
                List {
                    if loading {
                        ForEach(allUsers, id: \.self) { user in
                            Text(user)
                        }
                    }
                }
                
            
           
            .navigationBarTitle("Users")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        Button(action: {
                getUsers()
        }, label: {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.black)
                    .frame(width: 150, height: 55)
                
                Text("Show users")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
            
        })
        
        
        
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
                users = result.users ?? []
                // show users
                var count = 0
                users.forEach { user in
                    guard let userFirstName = user.firstName else { return }
                    allUsers.append(userFirstName)
                    print(allUsers[count])
                    count += 1
                }
                loading = true
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
