/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry

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
        this.data = this.data.setImageURI(@r(app.media.hua))
        .setDiameter(200.0)
        .setBorderWidth(5.0)
        .setBorderColor(Color.WHITE)
        .setScaleType(ImageFit.Fill)
        .setDisableCircularTransformation(false)
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
