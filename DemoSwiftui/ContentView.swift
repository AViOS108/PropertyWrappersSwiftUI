//
//  ContentView.swift
//  DemoSwiftui
//
//  Created by Anurag Bhakuni on 04/08/21.
//

import SwiftUI
import CoreData



struct SecondView : View {
    
    var body: some View{
        NavigationLink(
            "Navigate", destination: ThirdView())
    }
}


struct  ThirdView : View{
    @EnvironmentObject var user : User
    var body: some View{
        Text("USERNAME " + user.name)

    }
}


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State private var username : String = String()
    @State private var password : String = String()
    @State private var isActive : Bool = true
    @State private var isPush : Bool = false

    @ObservedObject private var user = User()
    
    var body: some View {
       
        NavigationView{
            
            VStack{
                Text( isActive ? "Login" : "Forget password" ).padding()
                Text( isActive ? "Enter your username and password" : "Please type your Email")
                TextField("Username", text: $user.name).padding().background(Color.gray).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                if isActive{
                    SecureField("Password", text: $user.pwd).padding().background(Color.gray).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                }
                HorizontalButtonsView(isActive: $isActive, user: .constant(user), isPush: $isPush)
                NavigationLink(
                    "", destination: SecondView(),
                    isActive: $isPush)

            }.padding()
            
        }.environmentObject(user)
        
        
        
    }

    func add(a : Int)-> Int{
        a + a
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
