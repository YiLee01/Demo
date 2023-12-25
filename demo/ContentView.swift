//
//  ContentView.swift
//  demo
//
//  Created by YL on 2023/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ViewControllerWrapper()
    }
}

struct ViewControllerWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // 可选：在此处更新视图控制器的状态或配置
    }
}

#Preview {
    ContentView()
}
