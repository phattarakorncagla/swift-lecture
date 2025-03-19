//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/19.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
