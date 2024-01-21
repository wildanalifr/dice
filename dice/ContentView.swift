//
//  ContentView.swift
//  dice
//
//  Created by Wildan on 20/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = 0
    @State var cpuCard = 0
    
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var drawScore = 0
    var random = 0
    
    func printSaja(){
        playerCard = Int.random(in: 2...14)
        cpuCard = Int.random(in: 2...14)
        
        if(cpuCard>playerCard){
            cpuScore+=1
        }else if(playerCard>cpuCard) {
            playerScore+=1
        }else {
            drawScore+=1
        }
    }
    
    func reset(){
        playerScore=0
        playerCard=0
        
        cpuScore=0
        cpuCard=0
        
        drawScore=0
    }
    
    var body: some View {
        ZStack{
            Image("background-cloth").resizable().ignoresSafeArea()
            
            VStack{
                Image("logo").padding()
                
                HStack{
                    Spacer()
                    Image(playerCard==0 ? "back":"card\(String(playerCard))")
                    Spacer()
                    Image(cpuCard==0 ? "back":"card\(String(cpuCard))")
                    Spacer()
                }
                
                Button(action: {
                    printSaja()
                   
                }, label: {
                    Image("button").resizable().frame(width: 250,height: 80)
                }).padding()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").padding(.bottom,10)
                        Text(String(playerScore))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Draw").padding(.bottom,10)
                        Text(String(drawScore))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU").padding(.bottom,10)
                        Text(String(cpuScore))
                    }
                    Spacer()
                }.foregroundColor(.white).font(.title2)
                
                Button(action: {
                    reset()
                }, label: {
                    Text("Reset").font(.title2)
                }).foregroundStyle(.white).padding(.top,20).padding(.trailing,50).padding(.leading,50).padding(.bottom,20).background(.red).cornerRadius(12).padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
