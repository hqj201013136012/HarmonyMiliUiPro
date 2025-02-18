import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'
import { SecurityHomeLeftMenu } from '../view/security/SecurityHomeLeftMenu'
import { SecurityHomeRightContent } from '../view/security/SecurityHomeRightContent'
import { SECURITY_MODE_TYPE } from '../viewmodel/SecurityData'

@Entry
@Component
struct SecurityHomePage {
  @State menuTabStatus:string=SECURITY_MODE_TYPE

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "安防" })
      SecurityHomeLeftMenu({itemType:this.menuTabStatus})
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left:{ anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      SecurityHomeRightContent({menuType:this.menuTabStatus})
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