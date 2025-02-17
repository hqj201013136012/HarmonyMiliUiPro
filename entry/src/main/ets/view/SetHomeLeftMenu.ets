import { ItemSetHomeLeftMenu } from '../itemview/ItemSetHomeLeftMenu';
import { SetHomeLeftMenuItemData, SetHomeLeftMenuList } from '../viewmodel/SetData';

@Component
export struct SetHomeLeftMenu {
  @State setHomeLeftMenuList: SetHomeLeftMenuItemData[] = SetHomeLeftMenuList;

  build() {
    Column(){
      List({ space: 8, initialIndex: 0 }) {
        ForEach(this.setHomeLeftMenuList, (item: SetHomeLeftMenuItemData) => {
          ListItem() {
            ItemSetHomeLeftMenu({ itemData: item })
          }
          .onClick(() => {
            this.setHomeLeftMenuList.forEach(element => {
              element.isSelect=false
            });
            item.isSelect=true
          })
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      // .divider({ strokeWidth: 20, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
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
          }else {
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