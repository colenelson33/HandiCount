//
//  RoundView.swift
//  HandiCount WatchKit Extension
//
//  Created by 90304588 on 5/25/22.
//

import SwiftUI

struct RoundView: View {
  //  var check: Bool
  //  var holeCount: Int
    
    @AppStorage("check") var checked: Bool = true
    @AppStorage("coursePar") var coursePar: String = "0"
    @AppStorage("totalRounds") var totalRounds: Double = 0
    @AppStorage("currentHole") var currentHole: Int = 0
    @AppStorage("handicap") var handicap: Double = 0.0
    
    @AppStorage("holeAmount") var holeAmt: Int = 0
    @AppStorage("currentScore") var currentScore: Int = 0
    
    @AppStorage("isComplete") var isDone: Bool = false
    
    @State var hole: Int = 1
    @State var score: Int = 0
    @State var roundScore: [Int] = [0]
    var body: some View {
        VStack{
            HStack{
        Text("Hole \(hole)")
                .font(.system(size: 30))
                .foregroundColor(.green)
                .cornerRadius(15)
                .padding()
                Spacer()
                Text("Score: \(currentScore)")
            }
            Spacer()
            
            HStack{
                
                ZStack{
                Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        roundScore[hole-1] -= 1
                        currentScore -= 1
                        score -= 1
                    }
                    .zIndex(2)
                    .padding()
                    Circle()
                            .foregroundColor(.green)
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                roundScore[hole-1] -= 1
                                currentScore -= 1
                                score -= 1
                            }
                }
                Text("\(roundScore[hole-1])")
                    .font(.system(size: 40))
                    .padding()
                ZStack{
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                    .onTapGesture {
                        roundScore[hole-1] += 1
                        score += 1
                        currentScore += 1
                    }
                    .zIndex(2)
                    .padding()
                Circle()
                        .foregroundColor(.green)
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            roundScore[hole-1] += 1
                            score += 1
                            currentScore += 1
                        }
                }
            }
            HStack{
                
            Image(systemName: "arrow.left")
                    
                    .onTapGesture(perform: {
                        if hole != 1{
                    
                        hole -= 1
                        score = 0
                        }
                    })
                    .padding(.horizontal)
                Spacer()
            Image(systemName: "arrow.right")
                    .onTapGesture(perform: {
                        if hole != holeAmt{
                            print(holeAmt)
                            print(hole)
                            roundScore.append(0)
                        hole += 1
                        score = 0
                        }
                    })
                    .padding(.horizontal)
                
            }
            
            if hole == holeAmt{
                HStack{
            
            
                    if isDone == false{
                    
                        if checked{
                    Button {
                        
                        let par = Int(coursePar)
                        let overPar = currentScore - par!
                        
                        handicap = ((handicap * totalRounds) + Double(overPar))/Double(totalRounds + 1)
                        totalRounds += 1
                        
                        
                        isDone = true
                        print(totalRounds)
                    } label: {
                        Text("Done")
                    }
                    .frame(width: 80, height: 40)
                        }
                    }
                    Spacer()
                    NavigationLink {
                        ContentView()
                    } label: {
                        Image(systemName: "house")
                    }
                    .padding()
                    .frame(width: 50, height: 40)
                    
                }
            }
          
            

        }.onAppear {
            checked = true
            isDone = false
            currentScore = 0
        }
    }
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundView()
    }
}
