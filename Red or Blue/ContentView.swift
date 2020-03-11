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
        
        var url = NSURL(string: "https://redorblue.kylepet.co")

        if url != nil {
            let task = URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) -> Void in
                print(data)

                if error == nil {

                    var urlContent = NSString(data: data!, encoding: String.Encoding.ascii.rawValue) as NSString?

                    self.currentDay = urlContent as! String
                }
            })
            task.resume()
        }
        
        
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
