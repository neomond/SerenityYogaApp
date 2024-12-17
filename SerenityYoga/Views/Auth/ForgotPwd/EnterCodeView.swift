//
//  EnterCodeView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 17.12.24.
//

import SwiftUI

struct EnterCodeView: View {
    @Binding var code: String
    @Binding var codeError: Bool
    var onNext: () -> Void
    
    @State private var codeDigits = ["", "", "", ""]
    @FocusState private var focusedField: Int? // To focus fields dynamically
    
    var body: some View {
        VStack(spacing: 12) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.bottom, 80)
            
            Text("Enter Code").font(.title)
            Text("Enter the code we sent you by email")
                .foregroundColor(.gray)
                .font(.callout)
                .padding(.bottom, 10)
            
            // HStack for 4 separate text fields
            HStack(spacing: 20) {
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: $codeDigits[index])
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .font(.title)
                        .frame(width: 50, height: 50)
                        .background(Color.clear)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(codeError ? .red : .gray),
                            alignment: .bottom
                        )
                        .focused($focusedField, equals: index)
                        .onChange(of: codeDigits[index]) { newValue in
                            if newValue.count > 1 {
                                codeDigits[index] = String(newValue.prefix(1))
                            }
                            moveFocus(from: index)
                        }
                }
            }
            .padding(.bottom, codeError ? 5 : 20)
            
            if codeError {
                Text("The code is wrong")
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            AppButton(title: "Continue") {
                code = codeDigits.joined()
                print("Entered Code: \(code)")
                onNext()
            }
            Spacer()
        }
        .onAppear {
            focusedField = 0 // Focus the first field on appear
        }
    }
    
    private func moveFocus(from index: Int) {
        if codeDigits[index].count == 1 {
            if index < 3 { focusedField = index + 1 } // Move to the next field
        }
    }
}

#Preview {
    @State var previewCode: String = ""
    @State var previewCodeError: Bool = false
    
    return EnterCodeView(
        code: $previewCode,
        codeError: $previewCodeError,
        onNext: { print("Continue button tapped") }
    )
}

