//
//  FyeryTabView.swift
//  Fyery
//
//  Created by Fery Lancz on 07.02.23.
//

import SwiftUI

struct FyeryTabView: View {
    var body: some View {
        HStack {
            Image(systemName: "display")
                .foregroundColor(.main)
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.main)
                        .padding(1)
                }
            Image(systemName: "person")
                .foregroundColor(.main)
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.main)
                        .padding(1)
                }
            VStack {
                Image(systemName: "phone")
                    .foregroundColor(.main)
                    .padding(10)
                    .background {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.main)
                            .padding(1)
                    }
                    .padding(.bottom, 20)
            }
            
            Image(systemName: "person.3")
                .foregroundColor(.main)
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.main)
                        .padding(1)
                }
            Image(systemName: "gear")
                .foregroundColor(.main)
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.main)
                        .padding(1)
                }
        }
    }
}

struct CustomTabItem: View {
    var title: String
    var systemName: String
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .heading3()
            Heading3(title)
        }
    }
}

struct FyeryTabView_Previews: PreviewProvider {
    static var previews: some View {
        FyeryTabView()
            .previewLayout(.sizeThatFits)
    }
}
