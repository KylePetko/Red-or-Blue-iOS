//
//  ContentView.swift
//  Red or Blue
//
//  Created by Kyle Petkovic on 3/7/20.
//  Copyright © 2020 Kyle Petkovic. All rights reserved.
//


import SwiftUI



struct ContentView: View {
    
    
    
    
    @ObservedObject var day = GetDay()
    let url = NSURL(string: "redorblue.kylepet.co")
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
                        Text("\(day.currentDay)")
                            .font(.largeTitle)
                            //.foregroundColor(.red)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    
                
                    
                }
                .navigationBarTitle("Red or Blue")
            }
        }
    
    
    

    
    
    
    
    
        
        
       
    }

class GetDay: ObservableObject {
    @Published var currentDay = "0"

    init() {
        
        let url = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/lgsuhsd.org_tebqf0pqvog3p4s5flsmddg4u8%40group.calendar.google.com/events?maxResults=3&key=AIzaSyCIQTEHeJgecY8GIZrHBnbgFWu3enzr304&futureevents=true&singleevents=true")
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            let dataAsNSString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
           DispatchQueue.main.async() {
               self.currentDay = dataAsNSString as! String
           }
           
        }
        task.resume()
        
        

        
        
        
        
        
        
    }
        
        
        
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}
