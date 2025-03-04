import { SelectDialogItemData } from "../../viewmodel/SelectDialogItemData"

@CustomDialog
export struct CommonSelectListDialog {
  @Prop title:string
  @Prop selectList: Array<SelectDialogItemData> = []
  controller?: CustomDialogController

  build() {
    Column() {
      Text(this.title)
        .fontColor('#ffffff')
        .fontSize(30)

      List({ space: 14 }) {
        ForEach(this.selectList, (item: SelectDialogItemData) => {
          ListItem() {
            RelativeContainer() {
              Text(item.itemName)
                .fontColor('#ffffff')
                .fontSize(28)
                .alignRules({
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                  center: { anchor: "__container__", align: VerticalAlign.Center },
                })

              Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
                .width(40)
                .height(40)
                .alignRules({
                  right: { anchor: "__container__", align: HorizontalAlign.End },
                  center: { anchor: "__container__", align: VerticalAlign.Center },
                })
                .select(item.isSelect)
                .selectedColor(0x2495FF)
                .shape(CheckBoxShape.CIRCLE)
                .onChange((value: boolean) => {
                })
            }
            .width('100%')
            .height(90)
            .backgroundColor('#262626')
            .borderRadius(12)
            .padding({ left: 30, right: 30 })
          }
          .onClick(() => {
            this.selectList.forEach(element => {
              element.isSelect = false
            })
            item.isSelect = true
          })
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .width('100%')
      .layoutWeight(1)
      .margin({top:30})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
    .padding({
      left: 52,
      right: 52,
      top: 38,
      bottom: 32
    })
    .justifyContent(FlexAlign.Center)
  }
}