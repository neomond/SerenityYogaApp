//
//  AuthManager.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.03.25.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var authError: Error?
    
    init() {
        // Listen for authentication state changes
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.user = user
                self?.isAuthenticated = user != nil
            }
        }
    }
    
    // MARK: - User Registration
    func signUp(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.authError = error
                    completion(false, error)
                    return
                }
                
                // User created successfully
                self?.user = result?.user
                self?.isAuthenticated = true
                
                // Create user profile in Firestore
                if let uid = result?.user.uid {
                    self?.createUserProfile(uid: uid, email: email)
                }
                
                completion(true, nil)
            }
        }
    }
    
    // MARK: - User Login
    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.authError = error
                    completion(false, error)
                    return
                }
                
                // User signed in successfully
                self?.user = result?.user
                self?.isAuthenticated = true
                completion(true, nil)
            }
        }
    }
    
    // MARK: - User Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
            self.isAuthenticated = false
        } catch {
            self.authError = error
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    // MARK: - User Profile
    private func createUserProfile(uid: String, email: String) {
        let db = Firestore.firestore()
        
        let userData: [String: Any] = [
            "email": email,
            "createdAt": FieldValue.serverTimestamp(),
            // Add any other user data you want to store
        ]
        
        db.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                print("Error creating user profile: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Password Reset
//    func sendPasswordResetEmail(to email: String, completion: @escaping (Bool, Error?) -> Void) {
//        Auth.auth().sendPasswordReset(withEmail: email) { error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(false, error)
//                } else {
//                    completion(true, nil)
//                }
//            }
//        }
//    }
    
    // MARK: - Custom Password Reset with Verification Code
    // For your custom flow, we need to create and verify codes in Firestore
    
    // Send a verification code
//    func sendPasswordResetCode(to email: String, completion: @escaping (Bool, Error?) -> Void) {
//        // First check if the email exists in Firebase Auth
//        Auth.auth().fetchSignInMethods(forEmail: email) { methods, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    completion(false, error)
//                }
//                return
//            }
//            
//            // If no methods found, user doesn't exist
//            if methods == nil || methods?.isEmpty == true {
//                let error = NSError(domain: "com.serenityYoga.auth",
//                                   code: 404,
//                                   userInfo: [NSLocalizedDescriptionKey: "No account found with this email address."])
//                DispatchQueue.main.async {
//                    completion(false, error)
//                }
//                return
//            }
//            
//            // Generate a 4-digit code
//            let verificationCode = String(Int.random(in: 1000...9999))
//            
//            // Store the code in Firestore with expiration time (30 minutes from now)
//            let db = Firestore.firestore()
//            let resetData: [String: Any] = [
//                "code": verificationCode,
//                "email": email,
//                "expiresAt": FieldValue.serverTimestamp(),
//                "used": false
//            ]
//            
//            db.collection("passwordResetCodes").document(email).setData(resetData) { error in
//                DispatchQueue.main.async {
//                    if let error = error {
//                        completion(false, error)
//                        return
//                    }
//                    
//                    // In a real app, you would send an email with the code here
//                    // For development, we'll just print it to the console
//                    print("Verification code for \(email): \(verificationCode)")
//                    completion(true, nil)
//                }
//            }
//        }
//    }
    
    // Verify reset code
//    func verifyPasswordResetCode(_ code: String, email: String, completion: @escaping (Bool, Error?) -> Void) {
//        let db = Firestore.firestore()
//        let docRef = db.collection("passwordResetCodes").document(email)
//        
//        docRef.getDocument { document, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(false, error)
//                    return
//                }
//                
//                guard let document = document, document.exists,
//                      let data = document.data(),
//                      let storedCode = data["code"] as? String,
//                      let used = data["used"] as? Bool else {
//                    
//                    let error = NSError(domain: "com.serenityYoga.auth",
//                                       code: 404,
//                                       userInfo: [NSLocalizedDescriptionKey: "No valid reset code found."])
//                    completion(false, error)
//                    return
//                }
//                
//                // Check if code has been used
//                if used {
//                    let error = NSError(domain: "com.serenityYoga.auth",
//                                       code: 400,
//                                       userInfo: [NSLocalizedDescriptionKey: "This code has already been used."])
//                    completion(false, error)
//                    return
//                }
//                
//                // Check if code is correct
//                if storedCode == code {
//                    completion(true, nil)
//                } else {
//                    let error = NSError(domain: "com.serenityYoga.auth",
//                                       code: 400,
//                                       userInfo: [NSLocalizedDescriptionKey: "Invalid verification code."])
//                    completion(false, error)
//                }
//            }
//        }
//    }
    
    // Reset password with verified code
//    func resetPassword(email: String, newPassword: String, code: String, completion: @escaping (Bool, Error?) -> Void) {
//        // First verify the code one more time
//        verifyPasswordResetCode(code, email: email) { [weak self] success, error in
//            if !success {
//                completion(false, error)
//                return
//            }
//            
//            // Mark code as used
//            let db = Firestore.firestore()
//            db.collection("passwordResetCodes").document(email).updateData(["used": true]) { error in
//                if let error = error {
//                    DispatchQueue.main.async {
//                        completion(false, error)
//                    }
//                    return
//                }
//                
//                // Since we can't directly reset a password without the user clicking the reset link,
//                // we'll need to use Firebase Admin SDK in a cloud function
//                // For now, we'll use a workaround for development purposes
//                
//                // Workaround: Create a custom Firebase function that resets the password
//                // This is just a placeholder - you would need to implement a Cloud Function
//                self?.resetPasswordWithAdminSDK(email: email, newPassword: newPassword) { success, error in
//                    DispatchQueue.main.async {
//                        completion(success, error)
//                    }
//                }
//            }
//        }
//    }
    
    
    // MARK: - Google Sign In
    func signInWithGoogle() {
        // Implementation for Google Sign-In would go here
        // Requires additional setup with GoogleSignIn SDK
    }
}
