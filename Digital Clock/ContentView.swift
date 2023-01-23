//
//  ContentView.swift
//  Digital Clock
//
//  Created by Andy C on 1/21/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var date = Date()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
            VStack {
                Text("\(timeString(date: date))")
                    .onAppear(perform: {let _ = self.updateTimer})
                    .font(.system(size: 80))
                    
                
                Toggle("Dark Mode", isOn: $isDarkMode)
            }
            .padding()
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .statusBar(hidden: true)
        }
    
    // This is where the app shows the time
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy hh:mm:ss a"
        return formatter
    }
    
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    // This is how the app updates time
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: true,
                             block: {_ in self.date = Date()
        })
    }
}

// App preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
