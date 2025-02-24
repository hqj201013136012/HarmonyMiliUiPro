import { SetHomeLeftMenuItemData } from "../viewmodel/SettingData"

@ComponentV2
export struct ItemCommonLeftMenu {
  @Require @Param itemData: SetHomeLeftMenuItemData

  build() {
    Column() {
      Image($r('app.media.icon_move_top'))
        .width(20)
        .height(20)
        .visibility(this.itemData.isTop==true?Visibility.Visible:Visibility.Hidden)
      Image(this.itemData.imageSrc)
        .width(60)
        .height(60)
        .margin({top:3})

      Text(this.itemData.name)
        .fontColor('#ffffff')
        .fontSize(22)
        .margin({top:4})
      Image($r('app.media.icon_move_bottom'))
        .width(20)
        .height(20)
        .margin({top:3})
        .visibility(this.itemData.isBottom==true?Visibility.Visible:Visibility.Hidden)
    }
    .width(124)
    .height(166)
    .justifyContent(FlexAlign.Center)
    .borderRadius(20)
    .backgroundColor(this.itemData.isSelect==true?'#2495FF':'#1A1A1A')

  }
}