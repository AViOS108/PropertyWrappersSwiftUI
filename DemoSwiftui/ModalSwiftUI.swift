//
//  ModalSwiftUI.swift
//  DemoSwiftui
//
//  Created by Anurag Bhakuni on 04/08/21.
//


import Foundation
import Combine

class User : ObservableObject{
    @Published var name : String = ""
    @Published var pwd : String = ""

}
