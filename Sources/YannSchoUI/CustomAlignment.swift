//  CustomAlignment.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import SwiftUI

public struct CustomAlignment: ViewModifier {
    public let alignment: Alignment
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}

public extension View {
    func customAlignment(_ alignment: Alignment = .leading) -> some View {
        modifier(CustomAlignment(alignment: alignment))
    }
}
