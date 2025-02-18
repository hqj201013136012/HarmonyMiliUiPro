import { ItemSetArrowView } from "../../itemview/ItemSetArrowView"
import { ItemSetSwitchView } from "../../itemview/ItemSetSwitchView"

@Component
export struct UserSetList {
  build() {
    Scroll() {
      Column({ space: 24 }) {
        ItemSetArrowView({ name: "无线网络" })
        ItemSetArrowView({ name: "时间设置" })
        ItemSetArrowView({ name: "个性化设置" })
        ItemSetSwitchView({ name: "开启免打扰", discribeStr: "开启后，新消息将不会进行铃声提醒", swichStatus: true })
        ItemSetArrowView({ name: "免打扰时长", rightText: "30分钟" })

        Column() {
          ItemSetSwitchView({
            name: "启用留影留言",
            discribeStr: "开启后，室内机可在不同状态下与留言留言功能进行联动",
            swichStatus: true
          })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetSwitchView({ name: "外出状态下联动留影留言", swichStatus: false })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetSwitchView({ name: "夜间状态下联动留影留言", swichStatus: false })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetSwitchView({ name: "免打扰状态下联动留影留言", swichStatus: false })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)
      }
    }
    .padding({ left: 48, right: 48 })
  }
}