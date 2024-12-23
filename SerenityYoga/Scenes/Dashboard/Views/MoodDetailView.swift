//
//  MoodDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.12.24.
//

import SwiftUI

struct MoodItem: Identifiable {
    let id = UUID()
    let mood: String
}

struct MoodDetailView: View {
    let mood: String
    @State private var favouriteSessions: [Int: Bool] = [:]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // MARK: - Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [.mainPink, .primaryPurple]),
                startPoint: .topLeading,
                endPoint: .topTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                
                // MARK: - Close button
                HStack {
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 45, height: 45)
                            .overlay(
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .frame(width: 12, height: 12)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack(spacing: 0) {
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
                    .padding(.bottom, 26)
                    
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
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                        .padding(12)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Session \(index)")
                                        .font(.headline)
                                    Spacer()
                                    
                                    HStack {
                                        Button(action: { print("Play \(index)") }) {
                                            Text("Listen")
                                                .padding(.horizontal, 24)
                                                .padding(.vertical, 6)
                                                .background(Color.gray.opacity(0.2))
                                                .foregroundColor(.black)
                                                .cornerRadius(16)
                                        }
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 16) {
                                            Image(systemName: "arrow.down.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.black)
                                                .frame(width: 20, height: 20)
                                            
                                            Button(action: {
                                                favouriteSessions[index]?.toggle()
                                                if favouriteSessions[index] == nil {
                                                    favouriteSessions[index] = true
                                                }
                                            }){
                                                Image(
                                                    systemName: favouriteSessions[index] == true ? "suit.heart.fill"
                                                    : "suit.heart")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(favouriteSessions[index] == true ? .purple : .black)
                                                .frame(width: 20, height: 20)
                                            }
                                        }
                                        
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
                    .padding(.horizontal, 12)
                    .padding(.top, 20)
                    .background(
                        Color.white
                            .clipShape(RoundedCorner(radius: 36, corners: [.topLeft, .topRight]))
                    )
                }
            }.scrollBounce(enabled: false)
        }
    }
}


#Preview {
    MoodDetailView(mood: "Stress")
}
