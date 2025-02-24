import { CallListItemData } from "../viewmodel/InterComData"

/**
 * 对讲-呼叫列表的Item
 */
@ComponentV2
export struct ItemCallView {
  @Require @Param itemData:CallListItemData

  build() {
   Column(){
     Image(this.itemData.imageSrc)
       .width(138)
       .height(138)

     Text(this.itemData.name)
       .fontColor('#ffffff')
       .fontSize(24)
       .margin({top:16})

   }
   .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}