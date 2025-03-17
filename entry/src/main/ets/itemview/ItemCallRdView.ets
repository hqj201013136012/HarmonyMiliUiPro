import {
  CallListItemData,
  callRdBoardItemData,
  CALL_KEY_BOARD_COMMON,
  CALL_KEY_BOARD_DIAL,
  CALL_KEY_BOARD_RE_DIAL
} from "../viewmodel/InterComData"

/**
 * 对讲-呼叫列表的Item
 */
@ComponentV2
export struct ItemCallRdView {
  @Require @Param itemData: callRdBoardItemData

  build() {
    if (this.itemData.type == CALL_KEY_BOARD_COMMON) {
      Column() {
        Text(this.itemData.valueName)
          .fontColor('#ffffff')
          .fontSize(36)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#1A1A1A')
      .justifyContent(FlexAlign.Center)
    } else if (this.itemData.type == CALL_KEY_BOARD_RE_DIAL) {
      Column() {
        Text(this.itemData.valueName)
          .fontColor('#ffffff')
          .fontSize(36)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#2495ff')
      .justifyContent(FlexAlign.Center)

    } else if (this.itemData.type == CALL_KEY_BOARD_DIAL) {
      Column() {
        Image($r('app.media.call_rd_callup'))
          .width(52)
          .height(52)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#3Ad0ae')
      .justifyContent(FlexAlign.Center)
    }

  }
}