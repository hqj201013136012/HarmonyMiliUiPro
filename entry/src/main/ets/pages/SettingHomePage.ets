import { HeaderTitleBar } from '../view/HeaderTitleBar';
import { SetHomeLeftMenu } from '../view/SetHomeLeftMenu';
import { SetHomeRightContent } from '../view/SetHomeRightContent';
import { SET_USER_TYPE } from '../viewmodel/SetData';

@Entry
@Component
struct SettingHomePage {
  //@State setHomeLeftMenuList: SetHomeLeftMenuItemData[] = SetHomeLeftMenuList;

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "设置" })
      SetHomeLeftMenu()
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left:{ anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      SetHomeRightContent({menuType:SET_USER_TYPE})
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left:{ anchor: "left_menu", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
        .margin({top:48,bottom:48})


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}


