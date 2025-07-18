//
//  Binding+Extension.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 15.07.2025.
//

import SwiftUI

extension Binding where Value == Bool {
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
