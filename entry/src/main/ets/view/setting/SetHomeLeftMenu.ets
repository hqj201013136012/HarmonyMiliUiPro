import { ItemCommonLeftMenu } from '../../itemview/ItemCommonLeftMenu';
import { SetHomeLeftMenuItemData,
  SET_ENGINE_TYPE,
  SET_SECURITY_TYPE,
  SET_SYS_INFO_TYPE,
  SET_USER_TYPE } from '../../viewmodel/SettingData';

@Component
export struct SetHomeLeftMenu {
  // 首页左侧菜单列表数据
  @State setHomeLeftMenuList: SetHomeLeftMenuItemData[]=[];
  // 左侧菜单点击的tab记录
  @Link itemType: string

  aboutToAppear(): void {
    this.setHomeLeftMenuList= [
      new SetHomeLeftMenuItemData(SET_USER_TYPE,
        true,
        false,
        false,
        "用户设置",
        $r('app.media.icon_s_leftmenu_usersetting')),
      new SetHomeLeftMenuItemData(SET_SECURITY_TYPE,
        false,
        false,
        false,
        "安防设置",
        $r('app.media.icon_leftmenu_safetysetting')),
      new SetHomeLeftMenuItemData(SET_ENGINE_TYPE,
        false,
        false,
        false,
        "工程设置",
        $r('app.media.icon_leftmenu_engine_set')),
      new SetHomeLeftMenuItemData(SET_SYS_INFO_TYPE,
        false,
        false,
        false,
        "系统信息",
        $r('app.media.icon_leftmenu_systeminfo')),

    ]
  }

  build() {
    Column() {
      List({ space: 8, initialIndex: 0 }) {
        ForEach(this.setHomeLeftMenuList, (item: SetHomeLeftMenuItemData) => {
          ListItem() {
            ItemCommonLeftMenu({ itemData: item })
          }
          .onClick(() => {
            this.setHomeLeftMenuList.forEach(element => {
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
        for (let index = 0; index < this.setHomeLeftMenuList.length; index++) {
          // 顶部滑动标识图标显示逻辑
          if (firstIndex == index && firstIndex != 0) {
            console.info('ListScroll isTop index' + index)
            this.setHomeLeftMenuList[index].isTop = true
          } else {
            this.setHomeLeftMenuList[index].isTop = false
          }
          // 底部滑动标识图标显示逻辑
          if (lastIndex == index && lastIndex < (this.setHomeLeftMenuList.length - 1)) {
            console.info('ListScroll isBottom index' + index)
            this.setHomeLeftMenuList[index].isBottom = true
          } else {
            this.setHomeLeftMenuList[index].isBottom = false
          }
        }
      })
    }
    .width(124)
    .height(514)
    .margin({ top: 48, left: 52 })

  }
}