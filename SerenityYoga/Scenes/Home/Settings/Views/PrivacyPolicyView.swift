//
//  PrivacyPolicyView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        NavigationStack {
            CustomNavigationBar(title: "Privacy Policy 🐾")
            
            VStack {
                Text("Lorem ipsum odor amet, consectetuer adipiscing elit. Mattis blandit rhoncus arcu non consectetur sed sollicitudin. At nisi per inceptos ullamcorper commodo in. Magna vehicula tempor magna elit luctus tristique maximus. Porta fermentum magna velit nibh senectus pulvinar commodo ridiculus nascetur. Et fermentum sit vitae tristique enim fames class sodales. Nec placerat augue tristique vehicula sodales; congue est lobortis.Molestie risus tortor in porta per eget sapien mus.")
                Text("Proin augue ridiculus sed et facilisi inceptos. Aliquam montes semper; dictum mauris sagittis sit. Volutpat vehicula donec risus viverra lectus. Integer mauris etiam, donec congue molestie mollis sit dolor. Bibendum penatibus feugiat facilisis ante dolor. Lectus laoreet enim elementum nam feugiat nunc eleifend neque vel. Quisque eros etiam mi tempor mus diam fermentum praesent. Neque porttitor aliquet nisi rhoncus montes.")
                    .padding(.top, 10)
            }           
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PrivacyPolicyView()
}
