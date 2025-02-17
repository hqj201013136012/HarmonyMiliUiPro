import { ItemSetArrowView } from "../itemview/ItemSetArrowView"
import { ItemSetSwitchView } from "../itemview/ItemSetSwitchView"

@Component
export struct UserSetList {

  build() {
    Scroll() {
      Column() {
        ItemSetArrowView({ name: "无线网络" })
        ItemSetArrowView({ name: "时间设置" })
          .margin({ top: 24 })
        ItemSetArrowView({ name: "个性化设置" })
          .margin({ top: 24 })
        ItemSetSwitchView({name:"开启免打扰",discribeStr:"开启后，新消息将不会进行铃声提醒",swichStatus:true})
          .margin({ top: 24 })
        ItemSetArrowView({ name: "免打扰时长" ,rightText:"30分钟"})
          .margin({ top: 24 })
      }
    }
    .padding({ left: 48, right: 48 })
  }
}