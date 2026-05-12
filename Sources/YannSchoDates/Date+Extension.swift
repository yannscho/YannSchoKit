//  Date+Extension.swift
//  YannSchoKit
//  Created by Yann Scholtes on 12/05/2026.
import SwiftUI

public extension Date {
    var calendar: Calendar { Calendar.current }
    
    func adding(_ value: Int, _ component: Calendar.Component) -> Date {
        calendar.date(byAdding: component, value: value, to: self) ?? Date.now
    }
    
    func isSameDay(as other: Date) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }
    
    func hasSame(_ component: Calendar.Component, as other: Date) -> Bool {
        Calendar.current.isDate(self, equalTo: other, toGranularity: component)
    }
    
    func firstDay(of component: Calendar.Component, in calendar: Calendar = .current) -> Date {
        let interval = calendar.dateInterval(of: component, for: self)
        return calendar.startOfDay(for: interval?.start ?? self)
    }
    
    func lastDay(of component: Calendar.Component, in calendar: Calendar = .current) -> Date {
        let interval = calendar.dateInterval(of: component, for: self)
        guard let end = interval?.end else { return calendar.startOfDay(for: self) }
        return calendar.startOfDay(for: calendar.date(byAdding: .second, value: -1, to: end) ?? end)
    }
    
//    func firstDay(of component: Calendar.Component) -> Date {
//        switch component {
//        case .weekOfYear, .weekOfMonth:
//            return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? self
//        case .month:
//            return calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? self
//        case .year:
//            return calendar.date(from: calendar.dateComponents([.year], from: self)) ?? self
//        default:
//            return self
//        }
//    }
//    
//    func lastDay(of component: Calendar.Component) -> Date {
//        switch component {
//        case .weekOfYear, .weekOfMonth:
//            let firstDay = firstDay(of: .weekOfYear)
//            return calendar.date(byAdding: .day, value: 6, to: firstDay) ?? self
//        case .month:
//            let firstDay = firstDay(of: .month)
//            return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: firstDay) ?? self
//        case .year:
//            let firstDay = firstDay(of: .year)
//            return calendar.date(byAdding: DateComponents(year: 1, day: -1), to: firstDay) ?? self
//        default:
//            return self
//        }
//    }
    
    var asString: DateFormatter.Output {
        DateFormatter.Output(date: self)
    }
}

public extension DateFormatter {
    struct Output {
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
