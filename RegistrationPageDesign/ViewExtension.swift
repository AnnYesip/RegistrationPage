//
//  ViewExtension.swift
//  RegistrationPageDesign
//
//  Created by Ann Yesip on 02.11.2021.
//

import SwiftUI

extension View {
    public func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
