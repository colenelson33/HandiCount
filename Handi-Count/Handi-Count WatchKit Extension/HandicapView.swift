//
//  HandicapView.swift
//  HandiCount WatchKit Extension
//
//  Created by 90304588 on 5/24/22.
//

import SwiftUI

struct HandicapView: View {
    
    @AppStorage("handicap") var handicap: Double = 0.0
    var body: some View {
        
        let roundedHandicap = String(format: "%.1f", handicap)
        VStack{
        Text("Current Handicap: \(roundedHandicap)")
                .foregroundColor(.green)
            .font(.subheadline)
        Text("This means that on average, you shoot \(roundedHandicap) over par in every round you play. To be considered a \"scratch\" golfer you need to have a 0 handicap.")
                .font(.system(size: 13))
             }
        .padding()
    }
}

struct HandicapView_Previews: PreviewProvider {
    static var previews: some View {
        HandicapView()
    }
}
