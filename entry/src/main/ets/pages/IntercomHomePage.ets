import { IntercomHomeLeftMenu } from '../view/intercom/IntercomHomeLeftMenu'
import { IntercomHomeRightContent } from '../view/intercom/IntercomHomeRightContent'
import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'
import { CALL_CENTER_TYPE } from '../viewmodel/InterComData'

@Entry
@Component
struct IntercomHomePage {
  @State menuTabStatus:string=CALL_CENTER_TYPE

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "对讲" })
      IntercomHomeLeftMenu({itemType:this.menuTabStatus})
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left:{ anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      IntercomHomeRightContent({menuType:this.menuTabStatus})
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left:{ anchor: "left_menu", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}


