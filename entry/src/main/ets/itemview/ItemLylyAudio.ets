import { LylyAudioItemData } from "../viewmodel/InterComData"

@Component
export struct ItemLylyAudio {
  @ObjectLink itemData: LylyAudioItemData

  build() {
    RelativeContainer() {
      Column() {
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
        Row() {
          Image(this.itemData.imageSrc)
            .width(52)
            .height(52)
          Text(this.itemData.snapDevno)
            .fontColor('#ffffff')
            .fontSize(30)
            .margin({left:50})
        }

        Text(this.itemData.snapDuration)
          .fontColor('#ffffff')
          .fontSize(24)
        Text(this.itemData.snapTime)
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