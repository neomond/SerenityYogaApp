//
//  CategoryDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 23.12.24.
//

import SwiftUI

struct CategoryDetailView: View {
    let title: String
    let items: [ContentCardModel]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [.primaryPurple, .mainPink]),
                    startPoint: .topLeading,
                    endPoint: .topTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    // MARK: - Header
                    HStack {
                        Spacer()
                        Text("\(title) ✨")
                            .font(SizeMetrics.Fonts.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Button(action: { dismiss() }) {
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
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    
                    // MARK: - Content
                    ScrollView {
                        VStack(spacing: 16) {
                            
                            if let firstItem = items.first {
                                ZStack(alignment: .bottomTrailing) {
                                    Image(firstItem.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                        .cornerRadius(16)
                                        .clipped()
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Image(systemName: "clock")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                                .frame(width: 20, height: 20)
                                            
                                            Text(firstItem.duration)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            Button(action: { print("Favorite tapped") }) {
                                                Image(systemName: "suit.heart")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.white)
                                                    .frame(width: 20, height: 20)
                                                
                                            }
                                        }
                                        .padding(20)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Text(firstItem.title)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            Button(action: { print("\(firstItem.title) Play tapped") }) {
                                                Text("Play")
                                                    .padding(.horizontal, 34)
                                                    .padding(.vertical, 6)
                                                    .background(Color.lavenderBg)
                                                    .foregroundColor(.black)
                                                    .cornerRadius(16)
                                                    .font(.callout)
                                            }
                                        }
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 12)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.black.opacity(0.2).blur(radius: 5))
                                    .cornerRadius(16)
                                }
                                .padding(.bottom, 12)
                            }
                            
                            ForEach(items.dropFirst(), id: \.id) { item in
                                HStack {
                                    
                                    ZStack(alignment: .topLeading) {
                                        Image(item.imageName)
                                            .resizable()
                                            .frame(width: 114, height: 86)
                                            .cornerRadius(10)
                                        
                                        Text(item.duration)
                                            .font(.callout)
                                            .foregroundColor(.white)
                                            .fontWeight(.regular)
                                            .padding(12)
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .font(.headline)
                                        Spacer()
                                        HStack {
                                            Button(action: { print("Play \(String(describing: index))") }) {
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
                                                
                                                Button(action: { }){
                                                    Image(
                                                        systemName: "suit.heart")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.black)
                                                    .frame(width: 20, height: 20)
                                                }
                                            }
                                            
                                        }
                                    }
                                    .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .background(Color.white)
                                .cornerRadius(12)
                                
                                // MARK: - Light Gray Divider
                                Divider()
                                    .background(Color.gray.opacity(0.3))
                            }
                            Spacer()
                        }
                        
                        .padding(.horizontal, 20)
                        .padding(.top, 35)
                        
                        .background(
                            Color.white
                                .clipShape(RoundedCorner(radius: 36, corners: [.topLeft, .topRight]))
                                .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                    
                    .scrollBounce(enabled: false)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    CategoryDetailView(
        title: "Try this",
        items: [
            ContentCardModel(title: "Yoga Basic", duration: "25:00", imageName: "yogaImage"),
            ContentCardModel(title: "Morning Meditation", duration: "10:00", imageName: "yogaasana1"),
            ContentCardModel(title: "Unwind after work", duration: "15:30", imageName: "yogaasana2"),
            ContentCardModel(title: "Morning Yoga", duration: "25:00", imageName: "yogaasana3"),
            ContentCardModel(title: "Morning Yoga", duration: "25:00", imageName: "yogaasana3")
        ]
    )
}
