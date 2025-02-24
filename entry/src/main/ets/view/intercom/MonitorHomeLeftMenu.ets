import { ItemCommonLeftMenu } from '../../itemview/ItemCommonLeftMenu';
import { IntercomHomeLeftMenuItemData,
  MONITOR_CLASSIFY_TYPE,
  MONITOR_DOOR_TYPE,
  MONITOR_IPC_TYPE,
  MONITOR_LADDER_TYPE} from '../../viewmodel/InterComData';


@ComponentV2
export struct MonitorHomeLeftMenu {
  // 首页左侧菜单列表数据
  @Local intercomHomeLeftMenuList: IntercomHomeLeftMenuItemData[]=[];
  // 左侧菜单点击的tab记录
  @Require @Param itemType: string
  @Event changeItemType: (val: string) => void;

  aboutToAppear(): void {
    this.intercomHomeLeftMenuList= [
      new IntercomHomeLeftMenuItemData(MONITOR_DOOR_TYPE,
        true,
        false,
        false,
        "预览门前",
        $r('app.media.icon_monitor_door_item')),
      new IntercomHomeLeftMenuItemData(MONITOR_LADDER_TYPE,
        false,
        false,
        false,
        "预览梯口",
        $r('app.media.icon_monitor_ladder_item')),
      new IntercomHomeLeftMenuItemData(MONITOR_CLASSIFY_TYPE,
        false,
        false,
        false,
        "预览区口",
        $r('app.media.icon_monitor_classify_item')),
      new IntercomHomeLeftMenuItemData(MONITOR_IPC_TYPE,
        false,
        false,
        false,
        "预览IPC",
        $r('app.media.icon_ipc_item')),

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
            this.changeItemType(item.type)
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