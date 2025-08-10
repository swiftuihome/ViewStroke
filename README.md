# ViewStrokeKit - 视图描边工具

![Swift Version](https://img.shields.io/badge/Swift-5.9+-orange.svg) ![Platform](https://img.shields.io/badge/Platform-iOS%2016+%20%7C%20macOS%2014+%20%7C%20tvOS%2013+%20%7C%20watchOS%206+-lightgrey.svg) ![License](https://img.shields.io/badge/License-MIT-blue.svg) ![SPM Ready](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)

ViewStrokeKit 是一个轻量级 SwiftUI 视图描边库，提供简单易用的 API 为任意视图添加纯色或渐变色描边效果。



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
2. 输入仓库地址：`https://github.com/swiftuihome/ViewStrokeKit`
3. 选择版本规则（推荐最新版本）
4. 点击 **Add Package**

或直接在 `Package.swift` 中添加：

```swift
dependencies: [
    .package(url: "https://github.com/swiftuihome/ViewStrokeKit.git", from: "1.2.1")
]
```



## 🎨 使用指南

### 纯色描边

```swift
import SwiftUI

// 描边效果示例视图
public struct StrokeViewDemo: View {
    public init() {}
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .viewStroke(.orange, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.cyan)
                .font(.system(size: 60, weight: .bold))
                .viewStroke(.white, width: 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct StrokeViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        StrokeViewDemo()
    }
}
```

### 渐变多层描边

```swift
import SwiftUI
import ViewStrokeKit

struct StrokeGradientViewDemo: View {
    // 渐变色描边（图标）
    let iconStrokeGradient = LinearGradient(colors: [.yellow, .orange, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    // 渐变色描边（文字）
    let textStrokeGradient = LinearGradient(colors: [.cyan, .purple], startPoint: .leading, endPoint: .trailing)
    
    // 实心描边（文字）
    let textStrokeSolidColor = Color.white
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .viewStroke(iconStrokeGradient, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.white)
                .font(.system(size: 60, weight: .bold))
                .viewStroke(textStrokeGradient, width: 2)
                .viewStroke(textStrokeSolidColor, width: 3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct StrokeGradientViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        StrokeGradientViewDemo()
    }
}
```

### 使用 StrokeView 容器

```swift
import SwiftUI
import ViewStrokeKit

struct StrokeViewContainerDemo: View {
    // 定义渐变色
    let iconStrokeGradient = LinearGradient(
        colors: [.yellow, .orange, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    let textStrokeGradient = LinearGradient(
        colors: [.cyan, .purple],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    let textStrokeSolidColor = Color.white
    
    var body: some View {
        VStack(spacing: 40) {
            // 单层渐变描边图标
            StrokeView(iconStrokeGradient, width: 3) {
                Image(systemName: "swift")
                    .foregroundStyle(.white)
                    .font(.system(size: 60))
            }
            
            // 双层描边文字（外层白边+内层渐变边）
            StrokeView(textStrokeSolidColor, width: 3) {
                StrokeView(textStrokeGradient, width: 2) {
                    Text("SwiftUI")
                        .foregroundStyle(.white)
                        .font(.system(size: 60, weight: .bold))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

struct StrokeViewContainerDemo_Previews: PreviewProvider {
    static var previews: some View {
        StrokeViewContainerDemo()
    }
}
```

### 两种方式对比

| 特性           | `.viewStroke()` | `StrokeView` |
| -------------- | --------------- | ------------ |
| 语法简洁度     | ⭐️⭐️⭐️⭐️⭐️           | ⭐️⭐️⭐️          |
| 多重描边便利性 | ⭐️⭐️⭐️             | ⭐️⭐️⭐️⭐️⭐️        |
| 动态更新性能   | ⭐️⭐️⭐️⭐️            | ⭐️⭐️           |
| 代码可读性     | ⭐️⭐️⭐️             | ⭐️⭐️⭐️⭐️         |

**推荐场景**：
- 简单描边：使用 `.viewStroke()`
- 复杂多重描边：使用 `StrokeView` 容器


## 🛠 API 文档

### `viewStroke(_:width:)`

```swift
func viewStroke<S: ShapeStyle>(_ style: S, width: CGFloat) -> some View
```

**参数**:
- `style`: 描边样式（支持 `Color` 或任意 `ShapeStyle`）
- `width`: 描边宽度（单位：点）

**返回值**:
返回应用了描边效果的视图



## 💡 设计建议

1. **最佳宽度范围**：1-5 点（过宽可能影响可读性）
2. **多重描边顺序**：从外到内依次应用
3. **渐变描边**：使用 `LinearGradient`、`RadialGradient` 或 `AngularGradient`
4. **性能优化**：避免在滚动视图中使用过多动态描边



## 📜 许可证

MIT 许可证 - 详见 [LICENSE](LICENSE) 文件
