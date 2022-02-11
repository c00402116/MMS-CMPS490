//
//  LoginRegister.swift
//  MMS
//
//  Created by Daniel Metrejean on 2/11/22.
//

import SwiftUI
import Combine

struct LoginRegister: View {
    
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("Email address")
            TextField("email", text: $email)
            Text("Password")
            TextField("password", text: $password)
        }
    }
}

struct LoginRegister_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegister()
    }
}
