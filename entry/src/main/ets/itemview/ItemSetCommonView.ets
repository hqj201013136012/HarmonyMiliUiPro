import { RadiusType, SetItemData, SetItemType } from "../viewmodel/SettingData"

/**
 * 通用的设置ItemView
 */
@ComponentV2
export struct ItemSetCommonView {
  @Require @Param itemData: SetItemData

  build() {
    Column() {
      if (this.itemData.itemType == SetItemType.SwitchItem) {
        RelativeContainer() {
          Column() {
            Text(this.itemData.name)
              .fontColor('#ffffff')
              .fontSize(28)
            Text(this.itemData.discribeStr)
              .fontColor('#808080')
              .fontSize(22)
              .margin({ top: 4 })
          }
          .margin({ left: 56 })
          .height('100%')
          .alignItems(HorizontalAlign.Start)
          .justifyContent(FlexAlign.Center)

          Toggle({ type: ToggleType.Switch, isOn: this.itemData.swichStatus })
            .size({ width: 96, height: 52 })
            .selectedColor('#2495ff')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              right: { anchor: "__container__", align: HorizontalAlign.End },
            })
            .margin({ right: 58 })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius({
          topLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          topRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          bottomLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
          bottomRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
        })
        .height(100)

      } else if (this.itemData.itemType == SetItemType.ArrowItem) {
        RelativeContainer() {
          Text(this.itemData.name)
            .fontColor('#ffffff')
            .fontSize(28)
            .margin({ left: 56 })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            })
          Image($r('app.media.icon_next'))
            .width(36)
            .height(36)
            .margin({ right: 56 })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              right: { anchor: "__container__", align: HorizontalAlign.End },
            })
            .id('right_next_img')
          Text(this.itemData.rightText)
            .fontColor('#ffffff')
            .fontSize(28)
            .margin({ right: 8 })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              right: { anchor: "right_next_img", align: HorizontalAlign.Start },
            })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius({
          topLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          topRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          bottomLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
          bottomRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
        })
        .height(100)

      } else if (this.itemData.itemType == SetItemType.ProcessItem) {
        RelativeContainer() {
          Text(this.itemData.name)
            .fontColor('#ffffff')
            .fontSize(28)
            .margin({ left: 56 })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            })
          Row() {
            Slider({
              value: this.itemData.processValue,
              style: SliderStyle.OutSet,
              direction: Axis.Horizontal,
            })
              .trackThickness(16)
              .blockSize({ width: 30, height: 30 })
              .width(550)
              .blockColor('#ffffff')
              .trackColor('#262626')
              .selectedColor('#2495ff')
              .onChange((value: number, mode: SliderChangeMode) => {
                this.itemData.processValue = value
              })
              .id('slider_view')

            Text(this.itemData.processValue+'%')
              .fontColor('#ffffff')
              .fontSize(28)
              .margin({left:24,right:56})
          }
          .justifyContent(FlexAlign.Center)
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            right: { anchor: "__container__", align: HorizontalAlign.End },
          })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius({
          topLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          topRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.TopRad) ? 12 : 0,
          bottomLeft: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
          bottomRight: (this.itemData.radType == RadiusType.AllRad || this.itemData.radType == RadiusType.BottomRad) ?
            12 : 0,
        })
        .height(100)

      } else if (this.itemData.itemType == SetItemType.TitleText) {
        Column() {
          Text(this.itemData.name)
            .padding({ left: 45, top: 28, bottom: 15 })
            .fontColor('#ffffff')
            .fontSize(30)
            .width('100%')
        }
      }
      if (this.itemData.isShowDiv) {
        Column() {
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        }
        .backgroundColor('#1A1A1A')
      }

    }
    .padding({ bottom: this.itemData.isPaddingBot ? 24 : 0 })

  }
}