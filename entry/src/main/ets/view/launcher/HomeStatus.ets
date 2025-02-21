import { router } from "@kit.ArkUI"

@Preview
@Component
export struct HomeStatus {
  build() {
    RelativeContainer() {
      Row() {
        Text('NO.10101001')
          .fontSize(30)
          .margin({ left: 48 })
          .fontColor('#ffffff')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/TestPage'
            })
          })
        Image($r('app.media.icon_information'))
          .width(70)
          .height(70)
          .margin({ left: 28 })
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/MessageListPage'
            })
          })

      }
      .height(80)
      .margin({ top: 30 })


      // 状态栏右侧
      Row() {
        Image($r('app.media.icon_state_net_1'))
          .width(80)
          .height(80)
          .margin({ right: 12 })

        Image($r('app.media.icon_state_ip_1'))
          .width(80)
          .height(80)
          .margin({ right: 48 })
      }
      .height(80)
      .margin({ top: 30 })
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End }
      })
    }
    .width('100%')
    .height(110)
    .id("status_bar")
  }
}