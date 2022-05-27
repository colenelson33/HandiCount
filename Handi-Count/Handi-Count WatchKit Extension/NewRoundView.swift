//
//  NewRoundView.swift
//  HandiCount WatchKit Extension
//
//  Created by 90304588 on 5/25/22.
//

import SwiftUI

struct NewRoundView: View {
    
    @AppStorage("coursePar") var coursePar: String = "0"
    @AppStorage("totalRounds") var totalRounds: Double = 0
    @AppStorage("currentHole") var currentHole: Int = 0
    @AppStorage("handicap") var handicap: Double = 0
    @AppStorage("currentScore") var currentScore: Int = 0
    
    @AppStorage("holeAmount") var holeAmt: Int = 9
    @AppStorage("check") var checked: Bool = true
    
    @State var check: Bool = true
   // @State var holeAmount: Int
    var body: some View {
        VStack{
            Picker(selection: $holeAmt) {
                Text("9 Holes")
                    .tag(9)
                    
                Text("18 Holes")
                    .tag(18)
                    
            } label: {
              // Text("Round Length")
            }
            
            .frame(width: 130, height: 30)
            Spacer()
            HStack{
                Text("Course Par")
                TextField(text: $coursePar) {
                Text("Course Par")
            }
            .frame(width: 40, height: 40)
                
            }
            HStack{
            
                Text("Count for handicap")
                    .font(.system(size: 12))
                    .onTapGesture {
                        checked.toggle()
                        check.toggle()
                    }
                if check{
                Image(systemName: "checkmark")
                        .foregroundColor(.green)
                        .onTapGesture {
                            checked.toggle()
                            check.toggle()
                        }
                }else{
                Image(systemName: "checkmark")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            checked.toggle()
                            check.toggle()
                        }
                }
                
            }
            .padding()
            Spacer()
            
            
            if coursePar != "0"{
            NavigationLink {
                
                RoundView()
            } label: {
                Text("Continue")
                    .font(.system(size: 15))
            }
            .frame(width: 100, height: 20)
            
            }
                
        }
    }
}

struct NewRoundView_Previews: PreviewProvider {
    static var previews: some View {
        NewRoundView()
    }
}
