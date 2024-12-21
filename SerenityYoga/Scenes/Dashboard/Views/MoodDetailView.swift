//
//  MoodDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.12.24.
//

import SwiftUI

struct MoodDetailView: View {
    let mood: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [.mainPink, .primaryPurple]),
                    startPoint: .topLeading,
                    endPoint: .topTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        // MARK: - Header Section
                        VStack(alignment: .leading) {
                            Text(mood)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                            Text("Keep busy taking care of your own life if you want to avoid \(mood.lowercased()).")
                                .font(.callout)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 40)
                        .padding(.bottom, 18)
                        
                        // MARK: - Sessions Section
                        VStack(spacing: 16) {
                            ForEach(1...15, id: \.self) { index in
                                HStack {
                                    ZStack(alignment: .topLeading) {
                                        Image("yogaasana1")
                                            .resizable()
                                            .frame(width: 114, height: 86)
                                            .cornerRadius(10)
                                        
                                        Text("\(10 + index * 5) min")
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .background(Color.gray.opacity(0.3))
                                            .cornerRadius(8)
                                            .padding(6)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Session \(index)")
                                            .font(.headline)
                                        Spacer()
                                        Button(action: { print("Play \(index)") }) {
                                            Text("Listen")
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 8)
                                                .background(Color.tertiaryInput)
                                                .foregroundColor(.black)
                                                .cornerRadius(16)
                                        }
                                    }
                                    .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                                .background(Color.white)
                                .cornerRadius(12)
                                
                                // MARK: - Light Gray Divider
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                            }
                            Spacer()
                        }
                        .padding()
                        .padding(.top, 10)
                        .background(
                            Color.white
                                .clipShape(RoundedCorner(radius: 36, corners: [.topLeft, .topRight]))
                                .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                }
                .scrollBounce(enabled: false)
            }
        }   .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MoodDetailView(mood: "Stress")
}
