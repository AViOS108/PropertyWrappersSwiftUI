//
//  HorizontalButtonsView.swift
//  DemoSwiftui
//
//  Created by Anurag Bhakuni on 04/08/21.
//

import SwiftUI

struct HorizontalButtonsView: View {
    @Binding  var isActive : Bool
    @Binding  var user : User
    @Binding  var isPush : Bool

    var body: some View {
        VStack{
            HStack{
                Button("Forget password") {
                    isActive = false
                    print("Forget password tapped")
                }.padding()
                 Button("Login ") {
                    isActive = true
                    print("Login tapped")
                 }.padding()
            }.padding()
            
            VStack{
                Button("Navigate") {
                    isPush = true
                }.padding()
                Button("Load") {
                    user.name = "Anurag"
                    user.pwd = "Anurag123"

                   print("Login tapped")
                }.padding()
            }
        }
    }
}

struct HorizontalButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalButtonsView(isActive: .constant(true), user:.constant(User()), isPush: .constant(false))
    }
}
