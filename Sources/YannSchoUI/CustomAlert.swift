//  CustomAlert.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import Foundation
import SwiftUI

public protocol CustomAlert: Error, LocalizedError {
    var title: String { get }
    var message: String? { get }
    var buttons: AnyView { get }
}

extension View {
    public func customAlert<T: CustomAlert>(alert: Binding<T?>) -> some View {
        self.alert(
            alert.wrappedValue?.title ?? "Error",
            isPresented: Binding(
                get: { alert.wrappedValue != nil },
                set: { _ in alert.wrappedValue = nil }
            ),
            actions: {
                alert.wrappedValue?.buttons
            },
            message: {
                if let subtitle = alert.wrappedValue?.message {
                    Text(subtitle)
                }
            }
        )
    }
}
