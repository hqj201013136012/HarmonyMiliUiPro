import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar';
import { SetHomeLeftMenu } from '../view/setting/SetHomeLeftMenu';
import { SetHomeRightContent } from '../view/setting/SetHomeRightContent';
import { SET_USER_TYPE } from '../viewmodel/SettingData';

@Entry
@ComponentV2
struct SettingHomePage {
  @Local menuTabStatus: string = SET_USER_TYPE

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "设置" })
      SetHomeLeftMenu({
        itemType: this.menuTabStatus, changeItemType: (val: string) => {
          this.menuTabStatus = val
        }
      })
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left: { anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      SetHomeRightContent({ menuType: this.menuTabStatus })
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left: { anchor: "left_menu", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
        .margin({ top: 48, bottom: 48 })


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}


