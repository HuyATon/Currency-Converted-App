//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by HUY TON on 20/04/2024.
//

import Foundation
import SwiftUI
import TipKit




struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    
    func saveUserPreferences() {
        UserDefaults.standard.set(leftCurrency.name, forKey: "left")
        UserDefaults.standard.set(rightCurrency.name, forKey: "right")
    }
    
    func retrieveUserPreferences() {
        let storedLeftCurrency = UserDefaults.standard.string(forKey: "left")
        let storedRightCurrency = UserDefaults.standard.string(forKey: "right")

        if storedLeftCurrency != nil {
            Currency.allCases.forEach{ entry in
                if entry.name == storedLeftCurrency {
                    leftCurrency = entry
                }
            }
            if storedRightCurrency != nil {
                Currency.allCases.forEach{ entry in
                    if entry.name == storedRightCurrency {
                        rightCurrency = entry
                    }
                }
            }
        
           
            
        }
    }
    

    
    var body: some View {
        if #available(iOS 17.0, *) {
            ZStack{
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack {
                    Image("prancingpony")
                        .resizable()
                        .scaledToFit() // keep the height-width ratio
                        .frame(height: 200)
                    
                    Text("Currency Exchange")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    
                    HStack {
                        VStack {
                            HStack {
                                Image(leftCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                Text(leftCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                            .padding(.bottom, -5)
                            .onTapGesture{
                                showSelectCurrency.toggle()
                            }
                            
                            
                            if #available(iOS 17.0, *) {
                                TextField("Amount", text: $leftAmount)
                                    .textFieldStyle(.roundedBorder)
                                    .focused($leftTyping)
                                    .keyboardType(.decimalPad)
                                
                            } else {
                                // Fallback on earlier versions
                            }
                            
                            
                        }
                        
                        Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        
                        VStack {
                            HStack {
                                
                                Text(rightCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Image(rightCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                
                            }
                            .onTapGesture{
                                showSelectCurrency.toggle()
                            }
                            
                            .padding(.bottom, -5)
                            
                            if #available(iOS 17.0, *) {
                                TextField("Amount", text: $rightAmount)
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.trailing)
                                    .focused($rightTyping)
                                    .keyboardType(.decimalPad)
                                
                                
                                
                            } else {
                                // Fallback on earlier versions
                            }
                                
                            
                        }
                        
                    }
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button{
                            showExchangeInfo.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing)
                        
                    }
                }
                
                //            .border(.blue)
            }
            
            .task {
                try? Tips.configure()
                
               
            }
            .onChange(of: leftAmount) {
                
                if leftTyping   {
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
                
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
            }
            .onChange(of: leftCurrency) {
                
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) {
                
                rightAmount = leftCurrency.convert(rightAmount, to: leftCurrency)
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency, content: {
                SelectCurrency(topCurrency: $leftCurrency,
                               bottomCurrency: $rightCurrency)
            })
            .onAppear {
                retrieveUserPreferences()
            }
            .onChange(of: leftCurrency) {
                saveUserPreferences()
            }
            .onChange(of: rightCurrency) {
                saveUserPreferences()
            }
            .onTapGesture{
                if leftTyping {
                    leftTyping.toggle()
                }
                if rightTyping {
                    rightTyping.toggle()
                }
            }
            
        } else {
            // Fallback on earlier versions
        }
            
        
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
