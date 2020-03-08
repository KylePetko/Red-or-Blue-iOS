//
//  ContentView.swift
//  Red or Blue
//
//  Created by Kyle Petkovic on 3/7/20.
//  Copyright © 2020 Kyle Petkovic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
            NavigationView {
                ScrollView {
                Divider()
                
                    
                
                    VStack(alignment: .center, spacing: 20) {
                        Spacer() //lol
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Tomorrow is a red day")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    
                
                    
                }
                .navigationBarTitle("Red or Blue")
            }
        }
        
        
       
    }
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
