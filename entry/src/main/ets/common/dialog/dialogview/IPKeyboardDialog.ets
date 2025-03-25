import { ItemIpBoardView } from "../../../itemview/ItemIpBoardView"
import {
  CALL_KEY_BOARD_IP_CANCEL,
  CALL_KEY_BOARD_IP_FINISH,
  CALL_KEY_BOARD_IP_NUM, IpBoardItemData, ipBoardList } from "../../../viewmodel/InterComData"

@Builder
export function IPKeyboardBuilder() {
  IPKeyboardDialog()
}

@ComponentV2
export struct IPKeyboardDialog {
  @Local mBoardList: Array<IpBoardItemData> = ipBoardList
  @Local inputText: string = ''

  build() {
    Column() {
      Row() {
        Text(this.inputText == '' ? '请输入IP' : this.inputText)
          .fontColor(this.inputText == '' ? '#808080' : '#000000')
          .fontSize(24)
          .layoutWeight(1)

        Image($r('app.media.icon_delect'))
          .width(52)
          .height(52)
          .align(Alignment.End)
          .onClick(() => {
            if(this.inputText.length>0){
              this.inputText=this.inputText.substring(0, this.inputText.length-1)
            }
          })
      }
      .padding({ left: 20, right: 28 })
      .borderRadius(10)
      .backgroundColor('#ffffff')
      .width(770)
      .height(92)

      Grid() {
        ForEach(this.mBoardList, (item: IpBoardItemData) => {
          GridItem() {
            ItemIpBoardView({ itemData: item })
          }
          .height("100%")
          .width('100%')
          .onClick(() => {
            switch (item.type) {
              case CALL_KEY_BOARD_IP_NUM:
                this.inputText = this.inputText + item.valueName
                break
              case CALL_KEY_BOARD_IP_CANCEL:

                break
              case CALL_KEY_BOARD_IP_FINISH:

                break
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .margin({ top: 26 })
      .width(630)
      .height(396)
      .columnsGap(16)
      .rowsGap(16)

    }
    .width(770)
    .height(600)
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
    .padding({left:50,right:50,top:38,bottom:32})
  }
}