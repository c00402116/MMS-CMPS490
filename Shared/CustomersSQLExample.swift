//
//  CustomersSQLExample.swift
//  MMS
//
//  Created by Daniel Metrejean on 2/5/22.
//

import SwiftUI
import Combine

struct Customer: Decodable, Identifiable {
    
    var customerID: Int!
    var phone: Int64!
    var email: String!
    var password: String!
    
    var id: Int
}

class CustomerService: ObservableObject {
    @Published var errorMessage: String = ""
    @Published var customers: [Customer] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    func downloadCustomers() {
        let urlstring = "http://frankcmps490sp22.cmix.louisiana.edu/Customers.php"
        let url = URL(string: urlstring)!
        
        URLSession.shared
            .dataTaskPublisher(for: URLRequest(url: url))
            .map(\.data)
            .decode(type: [Customer].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                }
            } receiveValue: {
                self.customers.removeAll()
                self.customers = $0
            }.store(in: &cancellableSet)
    }
}

struct CustomersSQLExample: View {
    @ObservedObject var customerService = CustomerService()
    //@State var month: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //TextField("Month:", text: $month)
                Button { customerService.downloadCustomers() } label: {
                    Text("Get Customers!")
                }
                Text(customerService.errorMessage)
                //.font(.largeTitle)
                    .foregroundColor(Color.gray)
            }
            
            List {
                ForEach(customerService.customers) {cust in
                    Text("**\(cust.customerID)** \(cust.phone) \(cust.email) \(cust.password)")
                }
            }
        }
        .navigationBarTitle(Text("Customers"))
    }
}

struct CustomersSQLExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomersSQLExample()
    }
}
