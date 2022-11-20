//
//  ContentView.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel : SearchViewModel
    var body: some View {
        
        NavigationView{
            
            VStack(spacing:15){
                
                Text("Weather App")
                    .font(.system(.largeTitle, design: .rounded))
                TextField("Search a city", text: $viewModel.searchText)
                    .multilineTextAlignment(.center)
                    .frame(width:300, height:50)
                    .overlay(RoundedRectangle(cornerRadius: 15, style: .continuous).stroke())
                
                if !viewModel.isTextValid{
                    Text("No special characters or empty searches")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundColor(.red)
                }
                
                NavigationLink {
                    SearchListView(viewModel: viewModel)
                } label: {
                    Text("Search!")
                }
                .disabled(!viewModel.isTextValid)
                .frame(width:100,height: 40)
                .foregroundColor(.white)
                .background(viewModel.isTextValid ? Color.blue : Color.blue.opacity(0.5))
                .cornerRadius(15)
            }
            
        }
    }
}


