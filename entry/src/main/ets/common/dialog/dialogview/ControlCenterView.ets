import { router } from "@kit.ArkUI"
import { PromptDialogHelper } from "../../helper/PromptDialogHelper"

@Builder
export function ControlCenterView() {
  RelativeContainer() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      itemShortCut($r('app.media.icon_securitysettings'), '安防设置', 'pages/SettingHomePage')
      itemShortCut($r('app.media.icon_disturbsettings'), '设置', 'pages/SecurityHomePage')

      Column() {
        Stack() {
          Slider({ style: SliderStyle.NONE, value: 40 })
            .width(482)
            .trackThickness(76)
            .trackColor('#262626')
            .selectedColor('#ffffff')
            .trackBorderRadius(16)

          Image($r('app.media.iocn_brightness'))
            .width(52)
            .height(52)
            .margin({ left: 20 })
            .align(Alignment.Center)
        }
        .alignContent(Alignment.Start)


        Stack() {
          Slider({ style: SliderStyle.NONE, value: 50 })
            .width(482)
            .trackThickness(76)
            .trackColor('#262626')
            .selectedColor('#ffffff')
            .trackBorderRadius(16)

          Image($r('app.media.icon_volume'))
            .width(52)
            .height(52)
            .margin({ left: 20 })
            .align(Alignment.Center)
        }
        .alignContent(Alignment.Start)
        .margin({ top: 24 })

      }
      .width(482)
    }
    .margin({ left: 120, right: 120 })
    .alignRules({
      left: { anchor: "__container__", align: HorizontalAlign.Start },
      right: { anchor: "__container__", align: HorizontalAlign.End },
      bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      top: { anchor: "__container__", align: VerticalAlign.Top },
    })

    Divider()
      .strokeWidth(3)
      .width(53)
      .color('#4D4D4D')
      .margin({ bottom: 13 })
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "__container__", align: HorizontalAlign.End },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })
    // .onClick(()=>{
    //   if (this.controller != undefined) {
    //     this.controller.close()
    //   }
    // })
  }
  .width('100%')
  .height(288)
  .backgroundColor('#1F1F1F')

}

@Builder
export function itemShortCut(imgSrc: ResourceStr, name: string, urlStr: string) {
  Column() {
    Image(imgSrc)
      .width(70)
      .height(70)

    Text(name)
      .fontColor('#ffffff')
      .fontSize(22)
      .margin({ top: 17 })
  }
  .width(150)
  .height(176)
  .backgroundColor('#262626')
  .borderRadius(15)
  .justifyContent(FlexAlign.Center)
  .onClick(() => {
    PromptDialogHelper.closeDialog()
    router.pushUrl({
      url: urlStr,
    })
  })
}