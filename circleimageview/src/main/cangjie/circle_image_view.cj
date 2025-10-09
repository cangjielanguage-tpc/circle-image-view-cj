/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package circleimageview

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.resource_manager.AppResource

@Component
public class CircleImageView {
    @Link
    var model: CircleImageModel = CircleImageModel()

    func build() {
        Stack() {
            Column() {
                if(this.model.disableCircularTransformation) {
                    Image(this.model.src)
                    .objectFit(this.model.scaleType)
                    .clip(false)
                    .width(this.model.diameter)
                    .height(this.model.diameter)
                    .backgroundColor(this.model.color)
                } else {
                     Image(this.model.src)
                    .objectFit(this.model.scaleType)
                    .clip(this.model.circle)
                    .width(this.model.diameter)
                    .height(this.model.diameter)
                    .backgroundColor(this.model.color)
                }

            }.width(this.model.diameter + this.model.borderWidth)
            .height((this.model.diameter + this.model.borderWidth))
            .borderRadius(radiusValue((this.model.diameter + this.model.borderWidth) / 2.0))
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.model.borderColor)
        }
    }

    private func radiusValue(value: Float64): Float64 {
        if (this.model.disableCircularTransformation) {
        	return 0.0
        } else {
        	return value
        }
    }

}

public class CircleImageModel {
    var src: AppResource = AppResource("","",0)
    var diameter: Float64 = 0.0
    var scaleType: ImageFit = ImageFit.Contain
    var disableCircularTransformation: Bool = true
    var circle: CircleShape = CircleShape()
    var color: Color = Color(0xffffff)
    var borderWidth: Float64 = 0.0
    var borderColor: Color = Color.GRAY
    var isCircle: Bool = true

    public func setImageURI(src: AppResource): CircleImageModel {
        this.src = src
        return this
    }

    public func getImageURI(): AppResource {
        return this.src
    }

    public func setDiameter(diameter: Float64): CircleImageModel {
        if(diameter < 0.0) {
            this.diameter = 0.0
        } else {
            this.diameter = diameter
        }

        return this
    }

    public func getDiameter(): Float64 {
        return this.diameter
    }

    public func setScaleType(scaleType: ImageFit): CircleImageModel {
        this.scaleType = scaleType
        return this
    }

    public func getScaleType(): ImageFit {
        return this.scaleType
    }

    public func setDisableCircularTransformation(disableCircularTransformation: Bool): CircleImageModel {
        this.disableCircularTransformation = disableCircularTransformation
        if (!disableCircularTransformation) {
            this.isCircle = true
            this.circle = CircleShape(width: this.diameter, height: this.diameter)
        }
        return this
    }

    public func isDisableCircularTransformation(): Bool {
        return this.disableCircularTransformation
    }

    public func setCircleBackgroundColor(color: Color): CircleImageModel {
        this.color = color
        return this
    }

    public func getCircleBackgroundColor(): Color {
        return this.color
    }

    public func setBorderWidth(borderWidth: Float64): CircleImageModel {
        if(borderWidth < 0.0) {
            this.borderWidth = 0.0
        } else {
            this.borderWidth = borderWidth
        }

        return this
    }

    public func getBorderWidth(): Float64 {
        return this.borderWidth
    }
    public func setBorderColor(borderColor: Color): CircleImageModel {
        this.borderColor = borderColor
        return this
    }

    public func getBorderColor(): Color {
        return this.borderColor
    }
}
