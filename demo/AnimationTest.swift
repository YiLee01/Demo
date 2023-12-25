//
//  AnimationTest.swift
//  demo
//
//  Created by YL on 2023/12/25.
//

import SwiftUI
import Foundation

struct TestView: View {
    @State private var isPressed = false

    var body: some View {
        VStack {
            // 按钮
            Button("点击我") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.isPressed.toggle()
                }
            }
            .padding()
            .background(Circle().fill(Color.blue))

            // 周围的视图
            ForEach(0..<5) { item in
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                    .scaleEffect(self.isPressed ? 0.9 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.5).delay(Double(item) * 0.1), value: isPressed)
            }
        }
    }
}

#Preview(body: {
    TestView()
})
