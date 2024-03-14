//
//  Extension.swift
//  FlagGuessing
//
//  Created by JimmyChao on 2024/3/13.
//

import Foundation
import SwiftUI

struct SpecialTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundStyle(.blue)
            
    }
}

extension View {
    func customTitle() -> some View {
        modifier(SpecialTitle())
    }
}
