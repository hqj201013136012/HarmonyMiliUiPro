import { ItemSetSwitchView } from '../../itemview/ItemSetSwitchView'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

/**
 * wifi列表页面
 */
@Entry
@ComponentV2
struct WifiListPage {
  build() {
    Column() {
      HeaderTitleBar({ title: "无线网络" })
      Scroll() {
        ItemSetSwitchView({ name: "无线网络", swichStatus: false })
      }
      .margin({ left: 52, right: 52,top:60 })
      .layoutWeight(1)
      .align(Alignment.Top)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
}