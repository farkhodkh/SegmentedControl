//
//  ContentView.swift
//  SegmentedControl
//
//  Created by Farkhod on 25.10.2021.
//

import SwiftUI

struct ContentView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
    @State private var selectedSide: SideOfTheForce = .dark
    var body: some View {
        NavigationView {
            VStack {
                Picker ("Choose a side", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                ChoosenHeroView(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a side!")
        }
    }
}

enum SideOfTheForce: String, CaseIterable {
    case light = "Light"
    case gray = "Gray"
    case dark = "Dark"
}

struct ChoosenHeroView: View {
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .light: HeroImageView(heroName: "anakin")
        case .gray: HeroImageView(heroName: "ashoka")
        case .dark: HeroImageView(heroName: "vader")
        }
    }
}
struct HeroImageView: View {
    var heroName: String
    
    var body: some View {
        Image(heroName)
            .resizable()
            .frame(width: 350, height: 550)
            .shadow(color: .white, radius: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
