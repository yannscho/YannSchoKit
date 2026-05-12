//  Date+Extension.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import SwiftUI

extension Date {
    var calendar: Calendar { Calendar.current }
    
    public func adding(_ value: Int, _ component: Calendar.Component) -> Date {
        calendar.date(byAdding: component, value: value, to: self) ?? Date.now
    }
    
    public func isSameDay(as other: Date) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }
    
    public func hasSame(_ component: Calendar.Component, as other: Date) -> Bool {
        Calendar.current.isDate(self, equalTo: other, toGranularity: component)
    }
    
    public func firstDay(of component: Calendar.Component) -> Date {
        switch component {
        case .weekOfYear, .weekOfMonth:
            return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? self
        case .month:
            return calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? self
        case .year:
            return calendar.date(from: calendar.dateComponents([.year], from: self)) ?? self
        default:
            return self
        }
    }
    
    public func lastDay(of component: Calendar.Component) -> Date {
        switch component {
        case .weekOfYear, .weekOfMonth:
            let firstDay = firstDay(of: .weekOfYear)
            return calendar.date(byAdding: .day, value: 6, to: firstDay) ?? self
        case .month:
            let firstDay = firstDay(of: .month)
            return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: firstDay) ?? self
        case .year:
            let firstDay = firstDay(of: .year)
            return calendar.date(byAdding: DateComponents(year: 1, day: -1), to: firstDay) ?? self
        default:
            return self
        }
    }
    
    public var asString: DateFormatter.Output {
        DateFormatter.Output(date: self)
    }
}

extension DateFormatter {
    public struct Output {
        let date: Date
        
        public var abbreviated: String {
            date.formatted(date: .abbreviated, time: .omitted)
        }
        
        public var long: String {
            date.formatted(date: .long, time: .omitted)
        }
        
        public var numeric: String {
            date.formatted(date: .numeric, time: .omitted)
        }
        
        public var full: String {
            date.formatted(date: .complete, time: .omitted)
        }
        
        public var weekdayShort: String {
            date.formatted(.dateTime.weekday(.abbreviated))
        }
        
        public var weekday: String {
            date.formatted(.dateTime.weekday(.wide))
        }
        
        public var yearShort: String {
            date.formatted(.dateTime.year(.twoDigits))
        }
        
        public var year: String {
            date.formatted(.dateTime.year(.extended()))
        }
        
        public var monthShort: String {
            date.formatted(.dateTime.month(.abbreviated))
        }
        
        public var month: String {
            date.formatted(.dateTime.month(.wide))
        }
        
        public var day: String {
            date.formatted(.dateTime.day())
        }
    }
}
