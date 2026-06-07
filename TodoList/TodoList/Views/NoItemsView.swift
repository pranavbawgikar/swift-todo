//
//  NoItemsView.swift
//  TodoList
//
//  Created by Pranav Bawgikar on 07/06/26.
//
import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("No missions available. \nPlease stand by.")
                    .font(.title2)
                    .fontWeight(.semibold)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Create Mission")
                            .font(.headline)
                            .frame(height: 35)
                    })
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
