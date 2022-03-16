//
//  ContentView.swift
//  SlotMachine
//
//  Created by Andrii Zozulych on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape","gfx-bell", "gfx-seven", "gfx-strawberry"]
    
    @State private var highscore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins: Int = 100
    @State private var betAmount = 10
    @State private var reels: Array = [0,1,2]
    @State private var showingInfoView: Bool = false
    @State private var showingModal: Bool = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModal: Bool = false
    // MARK: - FUNCTIONS
    
    // SPIN THE REELS
    func spinReels(){
        //reels[0] = Int.random(in: 0..<symbols.count)
        //reels[1] = Int.random(in: 0..<symbols.count)
        //reels[2] = Int.random(in: 0..<symbols.count)
        
        reels = reels.map({ _ in
            Int.random(in: 0..<symbols.count)
        })
        playSound(sound: "spin", type: "mp3")
        
    }
    // CHECK THE WINNING
    func checkWinning(){
        print("First: \(reels[0]), Second: \(reels[1]), Third: \(reels[2])")
        if reels[0] == reels[1] && reels[0] == reels[2] && reels[1] == reels[2]{
            // PLAYER WINS
            playerWins()
            // NEW HIGHSCORE
            if coins > highscore{
                newHighScore()
                playSound(sound: "high-score", type: "mp3")
            } else{
                playSound(sound: "win", type: "mp3")
            }
        } else{
            // PLAYER LOSES
            playerLose()
        }
    }
    // PLAYER WINS
    func playerWins(){
        coins += betAmount * 10
    }
    // NEW HIGHSCORE
    func newHighScore(){
        UserDefaults.standard.set(highscore, forKey: "HighScore")
        highscore = coins
    }
    // PLAYER LOSES
    func playerLose(){
        coins -= betAmount
    }
    
    func activateBet20(){
        betAmount = 20
        playSound(sound: "casino-chips", type: "mp3")
    }
    func activateBet10(){
        betAmount = 10
        playSound(sound: "casino-chips", type: "mp3")
    }
    // GAME IS OVER
    func isGameOver(){
        if coins <= 0{
            // SHOW MODAL WINDOW
            showingModal = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    func resetGame(){
        UserDefaults.standard.set(0, forKey: "HighScore")
        highscore = 0
        coins = 100
        activateBet10()
        playSound(sound: "chimeup", type: "mp3")
    }
    
    var body: some View {
        ZStack{
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5, content: {
                // MARK: - HEADER
                
                LogoView()
                
                Spacer()
                
                // MARK: - SCORE
                
                HStack {
                    HStack{
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack{
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                        
                    }
                    .modifier(ScoreContainerModifier())
                    
                }
                
                // MARK: - SLOT MACHINE
                
                VStack(alignment: .center, spacing: 0, content: {
                    // MARK: - REEL #1
                    ZStack{
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: Double.random(in: 0.5...0.7)))
                            .onAppear(perform: {
                                self.animatingSymbol.toggle()
                                playSound(sound: "riseup", type: "mp3")
                            })
                    }
                    
                    HStack(alignment: .center, spacing: 0, content: {
                        // MARK: - REEL #2
                        
                        ZStack{
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.7...0.9)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
                        }
                        
                        Spacer()
                        
                        // MARK: - REEL #3
                        
                        ZStack{
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: Double.random(in: 0.9...1.1)))
                                .onAppear(perform: {
                                    self.animatingSymbol.toggle()
                                })
                        }
                        
                    })
                    .frame(maxWidth: 500)
                    
                    // MARK: - SPIN BUTTON
                    
                    Button(action: {
                        
                        // 1. SET THE DEFAULT STATE: NO ANIMATION
                        withAnimation {
                            self.animatingSymbol = false
                        }
                        // 2. SPIN THE REELS WITH CHANGING THE SYMBOLS
                        self.spinReels()
                        
                        // 3. TRIGGER THE ANIMATION AFTER CHANGING THE SYMBOLS
                        withAnimation {
                            self.animatingSymbol = true
                        }
                        
                        self.checkWinning()
                        
                        self.isGameOver()
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                    
                })// Slot Machine
                .layoutPriority(2)
                
                // MARK: - FOOTER
                
                Spacer()
                
                HStack{
                    // MARK: - BET 20
                    
                    HStack(alignment: .center, spacing: 10) {
                    
                    Button(action: {
                        activateBet20()
                    }, label: {
                        Text("20")
                            .fontWeight(.heavy)
                            .foregroundColor(betAmount==20 ? .yellow : .white)
                            .modifier(BetNumberModifier())
                    })
                    .modifier(BetCapsuleModifier())
                    Image("gfx-casino-chips")
                        .resizable()
                        .offset(x: betAmount == 20 ? 0 : 20)
                        .opacity(betAmount == 20 ? 1 : 0)
                        .modifier(CasinoChipsModifier())
                    }
                    Spacer()
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: betAmount == 10 ? 0 : -20)
                            .opacity(betAmount == 10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                    Button(action: {
                        activateBet10()
                    }, label: {
                        Text("10")
                            .fontWeight(.heavy)
                            .foregroundColor(betAmount==10 ? .yellow : .white)
                            .modifier(BetNumberModifier())
                    })
                    .modifier(BetCapsuleModifier())
                    
                    }
                }
                
            })
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                // RESET
                Button(action: {
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false )
            
            if $showingModal.wrappedValue{
                ZStack{
                    Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
                    
                    // MODAL
                    VStack(spacing:0){
                        // TITLE
                        Text("Game over".uppercased())
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth:0, maxWidth: .infinity)
                            .background(Color("ColorPink"))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        // MESSAGE
                        VStack(alignment: .center, spacing: 16, content: {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                                .padding(.top, 30)
                            
                            Text("Bad luck! You lost all of the coins. \n Let's play again!")
                                .font(.system(.body, design: .serif))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                self.showingModal = false
                                self.animatingModal = false
                                activateBet10()
                                self.coins = 100
                            }, label: {
                                Text("New game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color("ColorPink"))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 12)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(Color("ColorPink"))
                                    )
                            })
                            
                            Spacer()
                        })
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1, blendDuration: 1))
                    .onAppear(perform: {
                        self.animatingModal = true
                    })
                }
            }
            
        }//: ZStack
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }
}
