//
//  PreliminarySurvey.swift
//  MMS
//
//  Created by Daniel Metrejean on 2/3/22.
//

import SwiftUI

struct PreliminarySurvey: View {
    
    @State var origAddrDisabled: Bool = true
    @State var showOrigItems: Bool = false;
    
    @State var originAddr: String = ""
    @State var originType: Int = 0
    @State var originFloor: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Section {
                    VStack {
                        HStack {
                            Text("**Origin**")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        HStack {
                            Text("Address")
                                .foregroundColor(Color.white)
                            TextField("", text: $originAddr)
                                .padding()
                                .background(origAddrDisabled ? Color.gray: Color.white)
                                .disabled(origAddrDisabled)
                                .cornerRadius(8)
                        }
                        HStack {
                            Text("Type")
                                .foregroundColor(Color.white)
                            TextField("\(originType)", text: $originAddr)
                                .padding()
                                .background(origAddrDisabled ? Color.gray: Color.white)
                                .disabled(origAddrDisabled)
                                .cornerRadius(8)
                        }
                        HStack {
                            Text("Floor")
                                .foregroundColor(Color.white)
                            TextField("\(originFloor)", text: $originAddr)
                                .padding()
                                .background(origAddrDisabled ? Color.gray: Color.white)
                                .disabled(origAddrDisabled)
                                .cornerRadius(8)
                        }
                        HStack {
                            Text("Itemized List")
                                .foregroundColor(Color.white)
                            Spacer()
                            //NavigationLink(destination: editPrelim(originAddr: originAddr, originType: originType, originFloor: originFloor)) {
                            //   Text("Edit")
                            //       .foregroundColor(Color.white)
                        }
                    }
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(8)
            Spacer()
        }
    }
}

struct PreliminarySurvey_Previews: PreviewProvider {
    static var previews: some View {
        PreliminarySurvey()
    }
}
