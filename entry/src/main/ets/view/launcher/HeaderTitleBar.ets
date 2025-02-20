import { router } from "@kit.ArkUI"
// export  interface HeaderController {
//   rightClick?: () => void
// }

@ComponentV2
export struct HeaderTitleBar{
  @Param title: string = '标题'
  @Param isShowRightText: boolean = false
  @Param rightText: string = 'xxx'
  @Event rightClick: () => void;
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
        .onClick(() =>{
          router.back()
        })

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
          .onClick(()=>{
            this.rightClick()
          })
      }

    }
    .width('100%')
    .height(80)
    .margin({top:30})
    .backgroundColor('#000000')
    .id('header_rl')
  }
}