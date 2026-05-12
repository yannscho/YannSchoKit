//  Calendar+Extension.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import Foundation

public extension Calendar {
    func numberOfDaysIn(_ component: Component, for date: Date) -> Int {
        range(of: .day, in: component, for: date)?.count ?? 0
    }
}
