import { SecurityOperateRecordItemData } from "../viewmodel/SecurityData"

@ComponentV2
export struct ItemSecurityOperate {
  @Require @Param itemData: SecurityOperateRecordItemData

  aboutToAppear(): void {

  }

  build() {
    RelativeContainer(){
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Image(this.itemData.imageSrc)
          .width(52)
          .height(52)

        Text(this.itemData.operationType)
          .fontColor('#ffffff')
          .fontSize(24)

        Text(this.itemData.operationalSource)
          .fontColor('#ffffff')
          .fontSize(24)

        Text(this.itemData.dateTime)
          .fontColor('#ffffff')
          .fontSize(24)
      }
      .height('100%')
      .alignRules({
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "__container__", align: HorizontalAlign.End },
      })

    }
    .height(92)
    .width('100%')
    .padding({ left: 30,right:70 })
    .backgroundColor('#1A1A1A')
    .borderRadius(12)


  }
}