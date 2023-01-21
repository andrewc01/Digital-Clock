//
//  ContentView.swift
//  Digital Clock
//
//  Created by Andy C on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(timeString(date: date))")
                    .onAppear(perform: {let _ = self.updateTimer})
                    .font(.system(size: 80))
                    .foregroundColor(.white)
            }
            .padding()
        }
        
    }
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy hh:mm:ss a"
        return formatter
    }
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: true,
                             block: {_ in self.date = Date()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
