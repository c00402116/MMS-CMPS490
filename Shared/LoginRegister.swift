//
//  LoginRegister.swift
//  MMS
//
//  Created by Daniel Metrejean on 2/11/22.
//

import SwiftUI
import Combine

struct LoginRegister: View {
    
    @ObservedObject var customerService = CustomerService()
    
    //This is an integer for tracking the Picker at the top of the View. When = 0 for login, the user is using email[0] and password[0] which is used in a GET query to compare existing database entries. When = 1 for register, the user is in email[1] and password[1] which is used for a POST query to add a new entry.
    @State var loginOrRegister: Int = 0
    
    @State var email: [String] = ["", ""]
    @State var password: [String] = ["", ""]
    @State var phone: [String] = ["", ""]
    @State var name: [String] = ["", ""]
    
    @State var options: [String] = ["Log In", "Register"]
    @State var headers: [String] = ["Log in to an existing account.", "Register for a new account."]
    
    //valid = 2 is fail, valid == 1 is success
    @State public var valid: Int = 0
    
    var body: some View {
        VStack {
            Picker("Options", selection: $loginOrRegister) {
                ForEach(0..<options.count) { option in
                    Text("\(options[option])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if (loginOrRegister==1) {
                HStack {
                    Text("Name")
                        .padding()
                        .frame(width:140, alignment: .leading)
                    TextField("name", text: $password[loginOrRegister])
                        .padding()
                }
            }
            HStack {
                Text("Email")
                    .padding()
                    .frame(width:140, alignment: .leading)
                TextField("email", text: $email[loginOrRegister])
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(UITextAutocapitalizationType.none)
            }
            HStack {
                Text("Password")
                    .padding()
                    .frame(width:140, alignment: .leading)
                SecureField("password", text: $password[loginOrRegister])
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(UITextAutocapitalizationType.none)
            }
            if (loginOrRegister==1) {
                HStack {
                    Text("Phone")
                        .padding()
                        .frame(width:140, alignment: .leading)
                    TextField("password", text: $password[loginOrRegister])
                        .padding()
                }
            }
            Spacer()
            Text("\(headers[loginOrRegister])")
                .padding()
            if (valid == 0) {
                Text("")
            } else if (valid == 1) {
                Text("Log in successful!")
                    .padding()
                    .foregroundColor(Color.green)
            } else {
                Text("Log in failed.")
                    .padding()
                    .foregroundColor(Color.red)
            }
            Spacer()
            Button { checkLogin() } label: {
                Text("Log In")
                    .padding()
                    .foregroundColor(Color.white)
            }
            .background(Color.blue)
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(8)
            .padding()
        }
    }
    
    private func checkLogin() {
        
        let passwordReturn = customerService.checkLogin(email[0])
        
        //customerService.checkLogin(email[0])
        
        debugPrint(customerService.errorMessage)
        //debugPrint(customerService.customers[0].email!)
        //debugPrint(customerService.customers[0].password!)
        
        //if (customerService.customers.count > 0) {
            //for pwd in customerService.customers {
            if (password[0] == passwordReturn) {
                    valid = 1
                } else {
                    valid = 2
                }
            //}
        //} else {valid = 2}
    }
}

struct LoginRegister_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegister()
    }
}
