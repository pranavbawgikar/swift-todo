//
//  AddView.swift
//  TodoList
//
//  Created by Pranav Bawgikar on 05/06/26.
//
import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("What's the damage?", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 35)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                Button(
                    action: saveButtonPressed,
                    label: {Text("Add")},
                )
                .padding(14)
            }
            .padding(14)
        }
        .navigationTitle("Log a mission")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textValidity() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            
        }
    }
    
    func textValidity() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "The new item is too short, it needs to be at least 3 characters."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
