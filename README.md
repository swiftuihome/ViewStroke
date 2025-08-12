# ViewStroke - 视图描边工具

![Swift Version](https://img.shields.io/badge/Swift-5.9+-orange.svg) ![Platform](https://img.shields.io/badge/Platform-iOS%2016+%20%7C%20macOS%2014+%20%7C%20tvOS%2013+%20%7C%20watchOS%206+-lightgrey.svg) ![License](https://img.shields.io/badge/License-MIT-blue.svg) ![SPM Ready](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)

ViewStroke 是一个轻量级 SwiftUI 视图描边库，提供简单易用的 API 为任意视图添加纯色或渐变色描边效果。



## 📱效果展示

<img src="screenshot.png" alt="效果图" style="width: 300px;" />



## 🌟 核心特性

- **全视图支持** - 完美适配 Text、Image、Shape 及自定义 SwiftUI 视图
- **两种使用方式**：
  - 视图扩展 `.viewStroke()`
  - 容器视图 `StrokeView`
- **丰富样式** - 支持 `Color` 和任意 `ShapeStyle`（包括渐变）
- **多重描边** - 可叠加多层不同样式的描边
- **高性能实现** - 基于 SwiftUI Canvas 优化渲染



## 📦 安装

### Swift Package Manager

1. 在 Xcode 中选择 **File > Add Packages...**
2. 输入仓库地址：`https://github.com/swiftuihome/ViewStroke`
3. 选择版本规则（推荐最新版本）
4. 点击 **Add Package**

或直接在 `Package.swift` 中添加：

```swift
dependencies: [
    .package(url: "https://github.com/swiftuihome/ViewStroke.git", from: "1.0.0")
]
```



## 🎨 使用指南

### 渐变多层描边

```swift
import SwiftUI
import ViewStroke

// 渐变描边示例
public struct GradientStrokeDemo: View {
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

struct GradientStrokeDemo_Previews: PreviewProvider {
    static var previews: some View {
        GradientStrokeDemo()
    }
}
```

### 使用 StrokeView 容器

```swift
import SwiftUI
import ViewStroke

// 容器式描边示例
public struct NestedStrokeDemo: View {
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

struct NestedStrokeDemo_Previews: PreviewProvider {
    static var previews: some View {
        NestedStrokeDemo()
    }
}
```

