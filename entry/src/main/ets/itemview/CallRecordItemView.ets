import {
  CallRecordItemData,
  CALL_RECORD_CALLIN_TYPE,
  CALL_RECORD_CALLOUT_TYPE,
  CALL_RECORD_MISS_TYPE
} from "../viewmodel/InterComData"

@ComponentV2
export struct CallRecordItemView {
  @Require @Param itemData: CallRecordItemData
  @Local callStr: string = ''

  aboutToAppear(): void {
    switch (this.itemData.callType) {
      case CALL_RECORD_MISS_TYPE:
        this.callStr = "未接"
        break;
      case CALL_RECORD_CALLIN_TYPE:
        this.callStr = "呼入"
        break;
      case CALL_RECORD_CALLOUT_TYPE:
        this.callStr = "未接"
        break;
    }
  }

  build() {
    RelativeContainer(){
      Column(){
        if (!this.itemData.isRead) {
          Circle()
            .width(12)
            .height(12)
            .fill('#FF6161')
        }
      }
      .width(80)
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End },
      })
      .id('read_icon')

      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Image(this.itemData.imageSrc)
          .width(70)
          .height(70)

        Text(this.itemData.devNo)
          .fontColor('#ffffff')
          .fontSize(30)

        Text(this.callStr)
          .fontColor('#ffffff')
          .fontSize(24)

        Image($r('app.media.button_photo_click'))
          .width(70)
          .height(70)

        Text(this.itemData.callTime)
          .fontColor('#ffffff')
          .fontSize(24)
      }
      .height('100%')
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "read_icon", align: HorizontalAlign.Start },
      })

    }
    .height(92)
    .width('100%')
    .padding({ left: 20 })
    .backgroundColor('#1A1A1A')
    .borderRadius(12)


  }
}