//
//  GradientStrokeExample.swift
//  ViewStroke
//
//  Created by devlink on 2025/8/10.
//

import SwiftUI

// 渐变描边示例
public struct GradientStrokeExample: View {
    // 渐变色描边（图标）
    let iconGradient = LinearGradient(
        colors: [.yellow, .orange, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // 渐变色描边（文字）
    let textGradient = LinearGradient(
        colors: [.cyan, .purple],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    // 实心描边（文字）
    let solidStroke = Color.white
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .viewStroke(iconGradient, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.white)
                .font(.system(size: 50, weight: .bold))
                .viewStroke(textGradient, width: 2)
                .viewStroke(solidStroke, width: 3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct GradientStrokeExample_Previews: PreviewProvider {
    static var previews: some View {
        GradientStrokeExample()
    }
}
