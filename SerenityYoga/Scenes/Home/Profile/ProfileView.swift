//
//  ProfileView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.01.25.
//

import SwiftUI

struct ProfileView: View {
    @State private var navigateToSettings = false
    @State private var selectedDays: [String] = []
    @State private var totalDays: Int = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                // MARK: - Gradient Background
                GradientBg(colors: [.blueBg, .skyblueBg])
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Circle()
                                .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                .frame(width: SizeMetrics.xmediumIcon,
                                       height: SizeMetrics.xmediumIcon)
                                .overlay(
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                )
                        }
                        Spacer()
                        
                        Text("Profile")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            navigateToSettings = true
                        }) {
                            Circle()
                                .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                .frame(width: SizeMetrics.xmediumIcon, height: SizeMetrics.xmediumIcon)
                                .overlay(
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.white)
                                        .frame(width: SizeMetrics.extraSmallIcon, height: SizeMetrics.extraSmallIcon)
                                )
                        }
                    }
                    .padding(.horizontal, SizeMetrics.largePadding)
                    .padding(.bottom, SizeMetrics.mediumPadding)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            VStack(spacing: 12) {
                                Text("Weekly Goal")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("Complete a workout on 4 days each week to achieve your goal")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 48)
                                    .padding(.bottom, 24)
                                
                                // MARK: - Progress View
                                CircularProgressView(
                                    selectedDays: $selectedDays,
                                    totalDays: $totalDays,
                                    isEditable: true,
                                    subtitleText: "/\(totalDays) days"
                                )
                                
                                // MARK: - Calendar
                                Text("Calendar")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                CalendarView()
                                
                                // MARK: - Log out button
                                HStack {
                                    Button(action: {
                                    }) {
                                        Text("Log out")
                                            .frame(maxWidth: .infinity)
                                            .foregroundStyle(Color.black)
                                    }
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 20)
                                .background(Color.white)
                            }
                            .padding(.vertical, 40)
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.white
                                .clipShape(RoundedCorner(
                                    radius: SizeMetrics.xlargeRadius,
                                    corners: [.topLeft, .topRight]))
                        )
                        
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
            }
            .navigationDestination(isPresented: $navigateToSettings){
                SettingsView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
