import { ItemCommonLeftMenu } from '../../itemview/ItemCommonLeftMenu';
import {  IntercomHomeLeftMenuItemData } from '../../viewmodel/InterComData';
import { ALARM_RECORD_TYPE,
  OPERATE_RECORD_TYPE,
  SecurityHomeLeftMenuItemData, SECURITY_MODE_TYPE } from '../../viewmodel/SecurityData';


@ComponentV2
export struct SecurityHomeLeftMenu {
  // 首页左侧菜单列表数据
  @Local leftMenuList: SecurityHomeLeftMenuItemData[]=[];
  // 左侧菜单点击的tab记录
  @Require @Param itemType: string
  @Event changeItemType: (val: string) => void;

  aboutToAppear(): void {
    this.leftMenuList= [
      new SecurityHomeLeftMenuItemData(SECURITY_MODE_TYPE,
        true,
        "安防模式",
        $r('app.media.icon_safety_leftmenu')),
      new SecurityHomeLeftMenuItemData(ALARM_RECORD_TYPE,
        false,
        "报警记录",
        $r('app.media.icon_alarmrecord_leftmenu')),
      new SecurityHomeLeftMenuItemData(OPERATE_RECORD_TYPE,
        false,
        "操作记录",
        $r('app.media.icon_perationrecords__leftmenu')),


    ]
  }

  build() {
    Column() {
      List({ space: 8, initialIndex: 0 }) {
        ForEach(this.leftMenuList, (item: IntercomHomeLeftMenuItemData) => {
          ListItem() {
            ItemCommonLeftMenu({ itemData: item })
          }
          .onClick(() => {
            this.leftMenuList.forEach(element => {
              element.isSelect = false
            });
            item.isSelect = true
            this.changeItemType(item.type)
          })
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .backgroundColor('#1A1A1A')
      .borderRadius(20)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
    }
    .width(124)
    .height(514)
    .margin({ top: 48, left: 52 })

  }
}