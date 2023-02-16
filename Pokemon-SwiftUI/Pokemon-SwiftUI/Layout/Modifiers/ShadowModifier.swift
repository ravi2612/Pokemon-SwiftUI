//
//  ShadowModifier.swift
//  Unimembros
//
//  Created by Felipe Bastos on 28/02/21.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        
        if colorScheme == .dark {
            return content
                    .shadow(color: Color.BlueDeepDark.opacity(0.4), radius: 15, x: 0, y: 10)
        }else{
            return content
                    .shadow(color: Color.BlueDeepDark.opacity(0.09), radius: 10, x: 0, y: 10)
        }
    }
}
