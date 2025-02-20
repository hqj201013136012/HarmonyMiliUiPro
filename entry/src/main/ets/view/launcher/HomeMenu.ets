import { CommonIconAlertDialog } from "../../common/dialog/CommonIconAlertDialog"
import { router } from "@kit.ArkUI"

@Component
export struct HomeMenu {
  @State alertIcon:ResourceStr=$r('app.media.tip_success')
  @State alertText:string='成功'
  // alert提示弹窗
  alertDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonIconAlertDialog({
      icon: this.alertIcon,
      textStr:this.alertText
    }),
    alignment:DialogAlignment.Center,
    width:558,
    height:370,
  })

  build() {
    // 免打扰，紧急救援，呼叫中心
    RelativeContainer() {
      Row() {
        Column() {
          Image($r('app.media.icon_disturb'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('免打扰')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')
        .onClick(() => {
          this.alertIcon=$r('app.media.tip_success')
          this.alertText='免打扰已启用，30分钟后失败'
          if(this.alertDialogController!=undefined){
            this.alertDialogController.open()
          }
        })

        Column() {
          Image($r('app.media.icon_sos'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('紧急呼救')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')
        .onClick(() => {
          this.alertIcon=$r('app.media.tip_sos')
          this.alertText='报警成功!'
          if(this.alertDialogController!=undefined){
            this.alertDialogController.open()
          }
        })

        Column() {
          Image($r('app.media.icon_callcenter'))
            .width(70)
            .height(70)
            .margin({ top: 10 })

          Text('呼叫中心')
            .fontSize(22)
            .fontColor('#ffffff')
        }
        .width('33%')
        .height('100%')
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/IntercomHomePage'
          })
        })

      }
      .width('100%')

    }
    .width('45%')
    .backgroundColor(0x1A1A1A)
    .borderRadius(20)
    .alignRules({
      top: { anchor: "center_content", align: VerticalAlign.Bottom },
      bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
    })
    .margin({ left: 48, top: 20, bottom: 48 })
    .id('bottom_menu')
  }
}