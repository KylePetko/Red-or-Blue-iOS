//
//  ContentView.swift
//  Red-or-Blue-WatchOS Extension
//
//  Created by Kyle Petkovic on 3/7/20.
//  Copyright © 2020 Kyle Petkovic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var day = GetDay()
    var body: some View {
        
        
        VStack {
                    Text("\(day.currentDay)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(day.textColor)
                    .animation(Animation.spring())
                }
            
        
            
                
        
       
    }
}


class GetDay: ObservableObject {
    @Published var currentDay = ""
    @Published var textColor = Color.white

    init() {
        
        //Calculate date
        let today = Date()
        let formatter = ISO8601DateFormatter()
        let timeFromGMT = -1 * 60 * 60 * 7
        formatter.timeZone = TimeZone(secondsFromGMT: timeFromGMT)
        formatter.formatOptions.insert(.withFractionalSeconds)
        var modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        
        let dateText = formatter.string(from: today)
        
        var modifiedDateBeforeText = formatter.string(from: modifiedDate)
        
        
        var beforeDate = modifiedDateBeforeText.prefix(10)
       
        
        
        
        let session = URLSession.shared
        
        
        let url = URL(string: "https://www.googleapis.com/calendar/v3/calendars/lgsuhsd.org_tebqf0pqvog3p4s5flsmddg4u8%40group.calendar.google.com/events?&key=AIzaSyB9LL_hsg4zvXzMhUATBCXp92P5Q7LHxe0&timeMin=\(beforeDate)T10:00:00-07:00&singleEvents=true&orderBy=startTime&timeMax=\(beforeDate)T10:01:00-07:00")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            var dateData = ""
            
            if data != nil{
                let dataAsNSString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                dateData = dataAsNSString! as String
            }
            else {
                self.currentDay = "You're offline \n Turn off airplain mode or connect to wifi."
            }
            
          
            
          
            
            
            
           DispatchQueue.main.async() {
            
            if dateData.range(of:"RED") != nil{
                self.currentDay = "Tomorrow is a red day"
                self.textColor = Color.red
            }
            else if dateData.range(of:"BLUE") != nil{
                self.currentDay = "Tomorrow is a blue day"
                self.textColor = Color.blue
            }
            else if dateData.range(of:"FINALS") != nil{
                self.currentDay = "Tomorrow you have finals"
                self.textColor = Color.white
            }
            else{
                self.currentDay = "Tomorrow there is no school"
                self.textColor = Color.white
            }
            
            
            
            //self.currentDay = "now: \(dateText) before: \(beforeDate) after: \(afterDate)"
            
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
