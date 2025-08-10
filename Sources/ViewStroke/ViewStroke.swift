// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

// 视图扩展：为任意View添加描边功能
public extension View {
    func viewStroke<S: ShapeStyle>(_ style: S, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeStyle: style, strokeSize: width))
    }
}

// 视图修饰器：使用Canvas实现描边效果
public struct StrokeModifier<S: ShapeStyle>: ViewModifier {
    // 唯一标识
    private let id = UUID()
    
    // 描边样式（颜色/渐变）
    var strokeStyle: S
    
    // 描边宽度
    var strokeSize: CGFloat
    
    public init(strokeStyle: S, strokeSize: CGFloat = 1) {
        self.strokeStyle = strokeStyle
        self.strokeSize = strokeSize
    }
    
    // 实现描边效果的主体逻辑
    public func body(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundStyle(strokeStyle)
                    .mask {
                        outline(context: content)
                    }
            )
    }
    
    // 使用Canvas创建描边轮廓
    func outline(context: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width / 2, y: size.height / 2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}

// 带描边效果的视图容器
public struct StrokeView<Content: View, S: ShapeStyle>: View {
    // 唯一标识
    private let id = UUID()
    
    // 描边样式
    let strokeStyle: S
    
    // 描边宽度
    let strokeSize: CGFloat
    
    // 需要添加描边的内容
    let content: Content
    
    public init(_ strokeStyle: S, width: CGFloat = 1, @ViewBuilder content: () -> Content) {
        self.strokeStyle = strokeStyle
        self.strokeSize = width
        self.content = content()
    }
    
    public var body: some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundStyle(strokeStyle)
                    .mask {
                        outline
                    }
            )
    }
    
    // 使用Canvas创建描边轮廓
    private var outline: some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let resolved = context.resolveSymbol(id: id) {
                    layer.draw(resolved, at: .init(x: size.width / 2, y: size.height / 2))
                }
            }
        } symbols: {
            content.tag(id)
                .blur(radius: strokeSize)
        }
    }
}
