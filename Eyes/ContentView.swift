//
//  ContentView.swift
//  Eyes
//
//  Created by HomeMac on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth:3)
        }
    }
}
