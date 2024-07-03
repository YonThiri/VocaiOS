//
//  ContentView.swift
//  Voca
//
//  Created by Yon Thiri Aung on 03/07/2024..
//

import SwiftUI

struct SignInView: View {
    
    // MARK: - PROPERTIES
    @State private var showVocabView = false // State variable to control navigation
    
    // MARK: - BODY
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // MARK: - BACKGROUND
                BackgroundView()
                    .ignoresSafeArea()
                
                // MARK: - CONTENTS
                VStack(spacing: 25) {
                    
                    // Onboarding Image
                    Image("SignIn")
                        .resizable()
                        .scaledToFit()
                        
                    VStack(spacing: 15) {
                        // Onboarding Text
                        Text("Discover a new\nvocabulary word \nevery day")
                            .font(Font.onboardintText)
                            .foregroundStyle(Color.background)
                            .lineSpacing(10)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        // Sign In With Apple Button
                        ButtonView(title: "Get Started") {
                            showVocabView = true
                        }
                        .navigationDestination(isPresented: $showVocabView) {
                            VocabView()
                        }
                    }
                    .padding(.bottom, 20)
                    
                    
                }//: CONTENTS
                .padding(.top, headerTopPadding)
                .padding()
            }//: ZStack
        }//: Navigation Stack
    }
}

#Preview {
    SignInView()
}
