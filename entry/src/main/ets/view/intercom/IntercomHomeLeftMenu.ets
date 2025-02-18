import { ItemCommonLeftMenu } from '../../itemview/ItemCommonLeftMenu';
import { CALL_CENTER_TYPE,
  CALL_EXTENSION_TYPE,
  CALL_RECORD_TYPE,
  CALL_USER_TYPE, IntercomHomeLeftMenuItemData } from '../../viewmodel/InterComData';
import { SetHomeLeftMenuItemData,
  SET_ENGINE_TYPE,
  SET_SECURITY_TYPE,
  SET_SYS_INFO_TYPE,
  SET_USER_TYPE } from '../../viewmodel/SettingData';

@Component
export struct IntercomHomeLeftMenu {
  // 首页左侧菜单列表数据
  @State intercomHomeLeftMenuList: IntercomHomeLeftMenuItemData[]=[];
  // 左侧菜单点击的tab记录
  @Link itemType: string

  aboutToAppear(): void {
    this.intercomHomeLeftMenuList= [
      new IntercomHomeLeftMenuItemData(CALL_CENTER_TYPE,
        true,
        false,
        false,
        "呼叫中心",
        $r('app.media.icon_callcenter_manager_select')),
      new IntercomHomeLeftMenuItemData(CALL_USER_TYPE,
        false,
        false,
        false,
        "呼叫住户",
        $r('app.media.icon_callresident_leftmenu')),
      new IntercomHomeLeftMenuItemData(CALL_EXTENSION_TYPE,
        false,
        false,
        false,
        "呼叫分机",
        $r('app.media.icon_callextension_leftmenu')),
      new IntercomHomeLeftMenuItemData(CALL_RECORD_TYPE,
        false,
        false,
        false,
        "通话记录",
        $r('app.media.icon_calllog_leftmenu')),

    ]
  }

  build() {
    Column() {
      List({ space: 8, initialIndex: 0 }) {
        ForEach(this.intercomHomeLeftMenuList, (item: IntercomHomeLeftMenuItemData) => {
          ListItem() {
            ItemCommonLeftMenu({ itemData: item })
          }
          .onClick(() => {
            this.intercomHomeLeftMenuList.forEach(element => {
              element.isSelect = false
            });
            item.isSelect = true
            this.itemType=item.type
          })
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .backgroundColor('#1A1A1A')
      .borderRadius(20)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        for (let index = 0; index < this.intercomHomeLeftMenuList.length; index++) {
          // 顶部滑动标识图标显示逻辑
          if (firstIndex == index && firstIndex != 0) {
            console.info('ListScroll isTop index' + index)
            this.intercomHomeLeftMenuList[index].isTop = true
          } else {
            this.intercomHomeLeftMenuList[index].isTop = false
          }
          // 底部滑动标识图标显示逻辑
          if (lastIndex == index && lastIndex < (this.intercomHomeLeftMenuList.length - 1)) {
            console.info('ListScroll isBottom index' + index)
            this.intercomHomeLeftMenuList[index].isBottom = true
          } else {
            this.intercomHomeLeftMenuList[index].isBottom = false
          }
        }
      })
    }
    .width(124)
    .height(514)
    .margin({ top: 48, left: 52 })

  }
}