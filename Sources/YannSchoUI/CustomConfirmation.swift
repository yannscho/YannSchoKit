//  CustomConfirmation.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import Foundation
import SwiftUI

public protocol CustomConfirmation {
    var title: String { get }
    var message: String? { get }
    var buttons: AnyView { get }
}

extension View {
    public func customConfirmation<T: CustomConfirmation>(confirmation: Binding<T?>) -> some View {
        self.confirmationDialog(
            confirmation.wrappedValue?.title ?? "",
            isPresented: Binding(
                get: { confirmation.wrappedValue != nil },
                set: { _ in confirmation.wrappedValue = nil }
            ),
            titleVisibility: .visible,
            actions: {
                confirmation.wrappedValue?.buttons
            },
            message: {
                if let message = confirmation.wrappedValue?.message {
                    Text(message)
                }
            }
        )
    }
}
