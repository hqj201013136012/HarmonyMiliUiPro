import { router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct CallPage {
  @Local processValue: number = 40

  build() {
    RelativeContainer() {
      Slider({
        value: this.processValue,
        style: SliderStyle.OutSet,
        direction: Axis.Vertical,
        reverse: true // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
      })
        .trackThickness(16)
        .blockSize({width:38,height:38})
        .height(350)
        .blockColor('#ffffff')
        .trackColor('#262626')
        .selectedColor('#2495ff')
        .margin({ left: 90 })
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
        })
        .onChange((value: number, mode: SliderChangeMode) => {
          this.processValue = value
        })
        .id('slider_view')

      Column() {
        Image($r('app.media.icon_volume_on'))
          .width(52)
          .height(52)
      }
      .width(80)
      .height(80)
      .borderRadius(40)
      .backgroundColor('#262626')
      .margin({ top: 30 })
      .justifyContent(FlexAlign.Center)
      .alignRules({
        top: { anchor: "slider_view", align: VerticalAlign.Bottom },
        middle: { anchor: "slider_view", align: HorizontalAlign.Center },
      })

      Column() {
        Image($r('app.media.extension_click'))
          .width(188)
          .height(188)

        Text('分机1')
          .fontSize(30)
          .fontColor('#ffffff')
          .margin({ top: 6 })

        Text('等待接听')
          .fontSize(22)
          .fontColor('#ffffff')
          .margin({ top: 10 })

        Image($r('app.media.button_hangup'))
          .width(100)
          .height(100)
          .margin({ top: 116 })
          .onClick(()=>{
            router.back()
          })
      }
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        right: { anchor: "__container__", align: HorizontalAlign.End },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}