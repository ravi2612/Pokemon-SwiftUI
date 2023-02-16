//
//  KeyboardModifier.swift
//  Cattle
//
//  Created by Alberto Lourenço on 3/26/20.
//  Copyright © 2020 Madeinweb e Mobile. All rights reserved.
//

import SwiftUI
import Combine

struct KeyboardModifier: ViewModifier {
    
    @State var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear(perform: subscribeToKeyboardEvents)
    }
    
    private func subscribeToKeyboardEvents() {
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillShowNotification
        ).compactMap { notification in
            notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect
        }.map { rect in
            rect.height
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
        
        NotificationCenter.Publisher(
            center: NotificationCenter.default,
            name: UIResponder.keyboardWillHideNotification
        ).compactMap { notification in
            CGFloat.zero
        }.subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
    }
}
