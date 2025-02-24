import { IntercomHomeRightContent } from '../view/intercom/IntercomHomeRightContent'
import { MonitorDeviceList } from '../view/intercom/MonitorDeviceList'
import { MonitorHomeLeftMenu } from '../view/intercom/MonitorHomeLeftMenu'
import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'
import { MONITOR_DOOR_TYPE } from '../viewmodel/InterComData'

@Entry
@ComponentV2
struct MonitorHomePage {
  @Local menuTabStatus: string = MONITOR_DOOR_TYPE

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "预览" })
      MonitorHomeLeftMenu({
        itemType: this.menuTabStatus, changeItemType: (val: string) => {
          this.menuTabStatus = val
        }
      })
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      MonitorDeviceList({ menuType: this.menuTabStatus })
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "left_menu", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}