//
//  NestedStrokeExample.swift
//  ViewStrokeKit
//
//  Created by devlink on 2025/8/10.
//


import SwiftUI

// 容器式描边示例
public struct NestedStrokeExample: View {
    // 定义渐变色
    let iconGradient = LinearGradient(
        colors: [.yellow, .orange, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    let textGradient = LinearGradient(
        colors: [.cyan, .purple],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    let solidStroke = Color.white
    
    public init() {}
    
    public var body: some View {
        VStack {
            // 单层渐变描边图标
            StrokeView(iconGradient, width: 3) {
                Image(systemName: "swift")
                    .foregroundStyle(.white)
                    .font(.system(size: 60))
            }
            
            // 双层描边文字（外层白边+内层渐变边）
            StrokeView(solidStroke, width: 3) {
                StrokeView(textGradient, width: 2) {
                    Text("SwiftUI")
                        .foregroundStyle(.white)
                        .font(.system(size: 50, weight: .bold))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct NestedStrokeExample_Previews: PreviewProvider {
    static var previews: some View {
        NestedStrokeExample()
    }
}
