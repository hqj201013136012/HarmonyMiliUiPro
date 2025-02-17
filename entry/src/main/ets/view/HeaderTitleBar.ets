import { router } from "@kit.ArkUI"

@Preview
@Component
export struct HeaderTitleBar{
  @Prop title: string = '标题'
  @Prop isShowRightText: boolean = false
  @Prop rightText: string = 'xxx'
  build() {
    RelativeContainer(){
      Image($r('app.media.icon_back'))
        .width(60)
        .height(60)
        .margin({left:48})
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('back_iv')

      Text(this.title)
        .fontColor($r('sys.color.white'))
        .fontSize(36)
        .margin({left:20})
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          left: { anchor: "back_iv", align: HorizontalAlign.End },
        })

      if(this.isShowRightText){
        Text(this.rightText)
          .fontColor($r('sys.color.white'))
          .fontSize(28)
          .margin({right:48})
          .width(175)
          .height(70)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .alignRules({
            center: { anchor: "__container__", align: VerticalAlign.Center },
            right: { anchor: "__container__", align: HorizontalAlign.End },
          })
      }

    }
    .width('100%')
    .height(80)
    .margin({top:30})
    .backgroundColor('#000000')
    .id('header_rl')
    .onClick(()=>{
      router.back()
    })
  }
}