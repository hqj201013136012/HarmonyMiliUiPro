import { SelectShortCutItemEntity } from "../viewmodel/ShotCutCardData"

/**
 * 快捷方式的选择Item组件
 */
@ComponentV2
export struct ShortCutSelectItem {
  @Require @Param itemData: SelectShortCutItemEntity
  @Event changeIsSelect: (val: boolean) => void;
 // @Local selectStatus: boolean = false

  build() {
    RelativeContainer() {
      Text(this.itemData.cardBean.name)
        .fontSize(30)
        .fontColor('#ffffff')
        .margin({ left: 15, top: 15 })

      Image(this.itemData.cardBean.imageSrc)
        .width(140)
        .height(140)
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          right: { anchor: "__container__", align: HorizontalAlign.End },
        })

      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
        .width(40)
        .height(40)
        .select(this.itemData.isSelect)
        .selectedColor(0x2495FF)
        .shape(CheckBoxShape.CIRCLE)
        .onChange((value: boolean) => {
          console.info('Checkbox1 change is' + value)
        })
        .margin({ left: 20, bottom: 20 })
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
    }
    .onClick(() => {
      this.changeIsSelect(!this.itemData.isSelect)
     // this.itemData.isSelect = !this.itemData.isSelect
    })
  }
}