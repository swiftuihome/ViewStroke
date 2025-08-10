//
//  BasicStrokeExample.swift
//  ViewStrokeKit
//
//  Created by devlink on 2025/8/10.
//

import SwiftUI

// 基础描边示例
public struct BasicStrokeExample: View {
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .viewStroke(.orange, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.cyan)
                .font(.system(size: 50, weight: .bold))
                .viewStroke(.white, width: 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct BasicStrokeExample_Previews: PreviewProvider {
    static var previews: some View {
        BasicStrokeExample()
    }
}
