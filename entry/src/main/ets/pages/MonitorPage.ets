import { router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct MonitorPage {
  @Local processValue: number = 40
  build() {
    RelativeContainer() {

      Row() {
        Row() {
          Image($r('app.media.user'))
            .width(65)
            .height(65)

          Text('1栋2单元梯口机正在呼叫您！（留言提示中…）')
            .fontSize(30)
            .fontColor('#ffffff')
            .margin({ left: 14 })
        }

        Row() {
          Image($r('app.media.monitor_calin_icon'))
            .width(50)
            .height(50)

          Text('有一个新的来电…')
            .fontSize(24)
            .fontColor('#ffffff')
            .margin({ left: 20 })
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.End)
      }
      .width('100%')
      .height(140)
      .padding({ left: 44, right: 50 })


      RelativeContainer() {
        Column() {
          Image($r('app.media.icon_volume_on'))
            .width(52)
            .height(52)
        }
        .id('volume_btn')
        .width(100)
        .height(100)
        .borderRadius(50)
        .backgroundColor('#66000000')
        .justifyContent(FlexAlign.Center)
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
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
          .height(350)
          .blockColor('#ffffff')
          .trackColor('#262626')
          .selectedColor('#2495ff')
          .margin({ bottom: 38 })
          .alignRules({
            middle: { anchor: "volume_btn", align: HorizontalAlign.Center },
            bottom: { anchor: "volume_btn", align: VerticalAlign.Top },
          })
          .onChange((value: number, mode: SliderChangeMode) => {
            this.processValue = value
          })


        Row(){
          Image($r('app.media.button_photograph'))
            .width(100)
            .height(100)

          Image($r('app.media.button_hangup'))
            .width(100)
            .height(100)
            .margin({left:40})
          Image($r('app.media.button_callup'))
            .width(100)
            .height(100)
            .margin({left:40})
          Image($r('app.media.button_lock'))
            .width(100)
            .height(100)
            .margin({left:40})
        }
        .alignRules({
          middle: { anchor: "__container__", align: HorizontalAlign.Center },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })


        Column() {
          Image($r('app.media.icon_close'))
            .width(52)
            .height(52)
        }
        .width(100)
        .height(100)
        .borderRadius(50)
        .backgroundColor('#66000000')
        .justifyContent(FlexAlign.Center)
        .alignRules({
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
        .onClick(()=>{
          router.back()
        })

      }
      .id('bottom_btn')
      .width('100%')
      .padding({ left: 52, right: 52,bottom:53 })
      .alignRules({
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
      })

    }
    .height('100%')
    .width('100%')
    .background()
    //.backgroundImage($r('app.media.monitor_bac'))
    .backgroundImage($r('app.media.monitor_bac'), ImageRepeat.NoRepeat)
    .backgroundImageSize({ width: 1280, height: 800 })
  }
}