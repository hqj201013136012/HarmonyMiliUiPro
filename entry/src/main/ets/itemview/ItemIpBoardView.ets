import {
  CallListItemData,
  callRdBoardItemData,
  CALL_KEY_BOARD_COMMON,
  CALL_KEY_BOARD_DIAL,
  CALL_KEY_BOARD_IP_CANCEL,
  CALL_KEY_BOARD_IP_FINISH,
  CALL_KEY_BOARD_IP_NUM,
  CALL_KEY_BOARD_RE_DIAL,
  IpBoardItemData
} from "../viewmodel/InterComData"


@ComponentV2
export struct ItemIpBoardView {
  @Require @Param itemData: IpBoardItemData

  build() {
    if (this.itemData.type == CALL_KEY_BOARD_IP_NUM) {
      Column() {
        Text(this.itemData.valueName)
          .fontColor('#ffffff')
          .fontSize(36)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#262626')
      .justifyContent(FlexAlign.Center)
    } else if (this.itemData.type == CALL_KEY_BOARD_IP_CANCEL) {
      Column() {
        Text(this.itemData.valueName)
          .fontColor('#ffffff')
          .fontSize(36)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#ff6161')
      .justifyContent(FlexAlign.Center)


    } else if (this.itemData.type == CALL_KEY_BOARD_IP_FINISH) {
      Column() {
        Image($r('app.media.ip_board_ok'))
          .width(52)
          .height(52)
      }
      .width('100%')
      .height('100%')
      .borderRadius(10)
      .backgroundColor('#2495ff')
      .justifyContent(FlexAlign.Center)
    }

  }
}