import { ItemCallRdView } from "../../itemview/ItemCallRdView"
import {
  boardList,
  callRdBoardItemData,
  CALL_KEY_BOARD_COMMON,
  CALL_KEY_BOARD_DIAL,
  CALL_KEY_BOARD_RE_DIAL
} from "../../viewmodel/InterComData"
import { router } from "@kit.ArkUI"

@ComponentV2
export struct CallResidentKeyBoard {
  @Local mBoardList: Array<callRdBoardItemData> = boardList
  @Local inputText: string = ''

  build() {
    Column() {
      Row() {
        Text(this.inputText == '' ? '请输入房号' : this.inputText)
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
      .width(630)
      .height(92)

      Grid() {
        ForEach(this.mBoardList, (item: callRdBoardItemData) => {
          GridItem() {
            ItemCallRdView({ itemData: item })
          }
          .height("100%")
          .width('100%')
          .onClick(() => {
            switch (item.type) {
              case CALL_KEY_BOARD_COMMON:
                this.inputText = this.inputText + item.valueName
                break
              case CALL_KEY_BOARD_RE_DIAL:
                router.pushUrl({
                  url: 'pages/AudioCallPage',
                })
                break
              case CALL_KEY_BOARD_DIAL:
                router.pushUrl({
                  url: 'pages/AudioCallPage',
                })
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
      .columnsGap(15)
      .rowsGap(15)

    }
    .width('100%')
    .height(514)
    .margin({ top: 160 })
    .backgroundColor('#000000')
    .borderRadius(20)
  }
}