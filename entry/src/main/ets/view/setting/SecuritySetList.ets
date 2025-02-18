import { ItemSetArrowView } from "../../itemview/ItemSetArrowView"
import { ItemSetSwitchView } from "../../itemview/ItemSetSwitchView"

@Component
export struct SecuritySetList {
  build() {
    Scroll() {
      Column() {
        Column() {
          ItemSetArrowView({ name: "用户密码管理" })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "开门密码管理" })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)

        ItemSetArrowView({ name: "安防预约" })
          .margin({ top: 24 })
        Column() {
          ItemSetArrowView({ name: "防区启用设置" })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "夜间防区设置" })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)
        .margin({ top: 24 })

        Text('联动设置')
          .padding({ left: 45, top: 28, bottom: 15 })
          .fontColor('#ffffff')
          .fontSize(30)
          .width('100%')

        Column() {
          ItemSetSwitchView({ name: "外出状态下联动留影留言", swichStatus: false })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetSwitchView({ name: "门前刷卡撤防", swichStatus: false })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetSwitchView({ name: "第八防区当门前铃", swichStatus: false })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)

      }
    }
    .padding({ left: 48, right: 48 })
  }
}