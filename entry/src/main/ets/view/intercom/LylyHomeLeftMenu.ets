import { ItemCommonLeftMenu } from '../../itemview/ItemCommonLeftMenu';
import { IntercomHomeLeftMenuItemData } from '../../viewmodel/InterComData';


@ComponentV2
export struct LylyHomeLeftMenu {
  // 首页左侧菜单列表数据
  @Local leftMenuList: IntercomHomeLeftMenuItemData[]=[];
  // 左侧菜单点击的tab记录
 // @Link itemType: string

  aboutToAppear(): void {
    this.leftMenuList= [
      new IntercomHomeLeftMenuItemData("1",
        true,
        false,
        false,
        "影音",
        $r('app.media.icon_video_lyly')),
    ]
  }

  build() {
    Column() {
      List({ space: 8, initialIndex: 0 }) {
        ForEach(this.leftMenuList, (item: IntercomHomeLeftMenuItemData) => {
          ListItem() {
            ItemCommonLeftMenu({ itemData: item })
          }
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)

      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
    }
    .width(124)
    .height(514)
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
    .margin({ top: 48, left: 52 })

  }
}