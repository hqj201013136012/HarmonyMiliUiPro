import { MessageItemData } from "../../viewmodel/MessageData"

@Component
export struct MessageRecordItemView {
  @ObjectLink itemData: MessageItemData

  build() {
    RelativeContainer() {
      Column(){
        if (!this.itemData.isRead) {
          Circle()
            .width(12)
            .height(12)
            .fill('#FF6161')
        }
      }
      .width(76)
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        top: { anchor: "__container__", align: VerticalAlign.Top },
        right: { anchor: "__container__", align: HorizontalAlign.End },
      })
      .id('read_icon')

      Row() {
        Image(this.itemData.imageSrc)
          .width(52)
          .height(52)
          .margin({ left: 30 })

        Column() {
          Text(this.itemData.infoTitle)
            .fontColor('#ffffff')
            .fontSize(30)

          Text(this.itemData.infoTextContent)
            .fontColor('#ffffff')
            .fontSize(22)
            .margin({ top: 5 })
        }
        .height('100%')
        .width(475)
        .margin({ left: 60 })
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Start)

        Text(this.itemData.infoTime)
          .fontColor('#ffffff')
          .fontSize(24)
          .align(Alignment.End)
      }
      .height('100%')
      .alignItems(VerticalAlign.Center)
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "read_icon", align: HorizontalAlign.Start },
      })
    }
    .height(100)
    .backgroundColor('#262626')
    .borderRadius(12)
  }
}