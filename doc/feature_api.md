# circleImageView4cj 特性文档

## 介绍

circleImageView4cj 是一个图片处理库，可以将图片裁剪为圆形或者给图片设置边框。

## 1 图片裁剪为圆形或者给图片设置边框

### 1.1 CircleImageModel class API Description

图片裁剪数据

```cangjie
public class CircleImageModel {
    /*
     * 初始化图片裁剪数据。
     */
    public init()
    
    /*
     * 设置裁剪大小，默认 0.0，单位 vp,若为负值，默认0.0。
     * 
     * 参数 diameter - 裁剪大小
     * 返回值 CircleImageModel - 图片裁剪数据实例  
     */
    public func setDiameter(diameter: Float64): CircleImageModel
    
    /*
     * 设置图片地址。
     * 
     * 参数 src - 图片地址，参考 cangjieUI API 
     * 返回值 CircleImageModel - 图片裁剪数据实例  
     */
    public func setImageURI(src: CJResource): CircleImageModel 
    
    /*
     * 设置图片缩放类型，默认 ImageFit.Contain。
     * 
     * 参数 scaleType - 缩放类型，参考 cangjieUI API 
     * 返回值 CircleImageModel - 图片裁剪数据实例  
     */
    public func setScaleType(scaleType: ImageFit): CircleImageModel
    
    /*
     * 设置是否禁用图片圆形属性。
     * 
     * 参数 disableCircularTransformation - 默认 true 
     * 返回值 CircleImageModel - 图片裁剪数据实例  
     */
    public func setDisableCircularTransformation(disableCircularTransformation: Bool): CircleImageModel 

    /*
     * 判断是否禁用图片圆形属性。
     *
     * 返回值 Bool
     */
    public func isDisableCircularTransformation(): Bool 

    /*
     * 设置圆背景颜色,默认 Color(0xffffff)。
     * 
     * 参数 color - 圆背景颜色
     * 返回值 CircleImageModel - 图片裁剪数据实例 
     */
    public func setCircleBackgroundColor(color: Color): CircleImageModel
    
    /*
     * 设置边框宽度，默认 0.0 vp，若为负值，默认0.0。
     * 
     * 参数 borderWidth - 边框宽度
     * 返回值 CircleImageModel - 图片裁剪数据实例 
     */
    public func setBorderWidth(borderWidth: Float64): CircleImageModel
    
    /*
     * 设置边框颜色。
     * 
     * 参数 borderColor - 边框颜色
     * 返回值 CircleImageModel - 图片裁剪数据实例 
     */
    public func setBorderColor(borderColor: Color): CircleImageModel

    /*
     * 获取边框颜色。
     *
     * 返回值 Color - 边框颜色
     */
    public func getBorderColor(): Color
    
    /*
     * 获取裁剪大小，若为负值，默认0.0。
     *
     * 返回值 Float64 - 裁剪大小
     */
    public func getDiameter(): Float64
    
    /*
     * 获取图片地址。
     *
     * 返回值 CJResource - 图片地址
     */
    public func getImageURI(): CJResource 
    
    /*
     * 获取图片缩放类型。
     *
     * 返回值 ImageFit - 图片缩放类型
     */
    public func getScaleType(): ImageFit
    
    /*
     * 获取圆背景颜色。
     *
     * 返回值 Color - 圆背景颜色
     */
    public func getCircleBackgroundColor(): Color
    
    /*
     * 获取边框宽度，若为负值，默认0.0。
     *
     * 返回值 Float64 - 边框宽度
     */
    public func getBorderWidth(): Float64
}
```

### 1.2 CircleImageView Component API Description

自定义图片裁剪组件

```cangjie
@Component
public class CircleImageView {
    @Link
    var model: CircleImageModel = CircleImageModel()
}
```

### 1.3 示例

```cangjie
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import circleimageview.*

@Entry
@Component
class EntryView {
    @State
    var data: CircleImageModel = CircleImageModel()

    protected override func aboutToAppear() {
        this.data = this.data.setImageURI(@r(app.media.hugh)).setDiameter(200.0).setBorderWidth(5.0).setBorderColor(
            Color.WHITE).setScaleType(ImageFit.Fill).setDisableCircularTransformation(false)
    }
    func build() {
        Column() {
            List(space: 0, initialIndex: 0) {
                ListItem() {
                    Column(5) {
                        CircleImageView(model: data)
                    }.align(Alignment.Center).width(200).height(200)
                }.height(50.percent).width(100.percent)

                ListItem() {
                    Column(5) {
                        CircleImageView(model: data)
                    }.align(Alignment.Center)
                }.height(50.percent).backgroundColor(0x000000).width(100.percent)
            }.width(100.percent).margin(top: 5)
        }
    }
}
```
