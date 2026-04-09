//
//  ContentView.swift
//  A2_IOS_Wassn_101468092
//
//  Created by user947626 on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: A2_IOS_Wassn_101468092Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(A2_IOS_Wassn_101468092Document()))
}
