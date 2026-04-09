//
//  A2_IOS_Wassn_101468092App.swift
//  A2_IOS_Wassn_101468092
//
//  Created by user947626 on 4/9/26.
//

import SwiftUI

@main
struct A2_IOS_Wassn_101468092App: App {
    var body: some Scene {
        DocumentGroup(newDocument: A2_IOS_Wassn_101468092Document()) { file in
            ContentView(document: file.$document)
        }
    }
}
