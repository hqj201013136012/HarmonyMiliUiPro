import { SelectShortCutItemData } from "../viewmodel/ShotCutCardData"

/**
 * 快捷方式的选择Item组件
 */
@Component
export struct ShortCutSelectItem {
  @Prop itemData:SelectShortCutItemData
  @State selectStatus:boolean=false

  build() {
    RelativeContainer() {
      Text(this.itemData.name)
        .fontSize(30)
        .fontColor('#ffffff')
        .margin({ left: 15, top: 15 })

      Image(this.itemData.imageSrc)
        .width(140)
        .height(140)
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          right: { anchor: "__container__", align: HorizontalAlign.End },
        })

      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
        .width(40)
        .height(40)
        .select(this.selectStatus)
        .selectedColor(0x2495FF)
        .shape(CheckBoxShape.CIRCLE)
        .onChange((value: boolean) => {
          console.info('Checkbox1 change is' + value)
        })
        .margin({left:20,bottom:20})
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
    }
    .onClick(() => {
      this.selectStatus=!this.selectStatus
    })
  }
}