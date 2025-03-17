import { router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct AudioCallPage {
  @Local processValue: number = 40

  build() {
    RelativeContainer() {

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

      }
      .justifyContent(FlexAlign.Center)
      .margin({top:140})
      .alignRules({
        right: { anchor: "__container__", align: HorizontalAlign.End },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
      })

      Row(){
        Image($r('app.media.button_hangup'))
          .width(100)
          .height(100)
          .onClick(()=>{
            router.back()
          })

        Image($r('app.media.button_callup'))
          .width(100)
          .height(100)
          .margin({left:70})
      }
      .alignRules({
        middle: { anchor: "__container__", align: HorizontalAlign.Center },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })


      Slider({
        value: this.processValue,
        style: SliderStyle.OutSet,
        direction: Axis.Vertical,
        reverse: true // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
      })
        .trackThickness(16)
        .blockSize({width:38,height:38})
        .height(330)
        .blockColor('#ffffff')
        .trackColor('#262626')
        .selectedColor('#2495ff')
        .margin({ bottom: 28 })
        .alignRules({
          middle: { anchor: "volume_btn", align: HorizontalAlign.Center },
          bottom: { anchor: "volume_btn", align: VerticalAlign.Top },
        })
        .onChange((value: number, mode: SliderChangeMode) => {
          this.processValue = value
        })

      Column() {
        Image($r('app.media.icon_volume_on'))
          .width(52)
          .height(52)
      }
      .id('volume_btn')
      .width(100)
      .height(100)
      .borderRadius(50)
      .backgroundColor('#262626')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })
    }
    .height('100%')
    .width('100%')
    .padding({left:52,right:52,bottom:100})
    .backgroundColor('#000000')
  }
}