@ComponentV2
export struct ItemSetSwitchView {
  @Require @Param name: string
  @Param discribeStr: string = ''
  @Require @Param swichStatus: boolean

  build() {
    Column() {
      RelativeContainer() {

        Column() {
          Text(this.name)
            .fontColor('#ffffff')
            .fontSize(28)

          Text(this.discribeStr)
            .fontColor('#808080')
            .fontSize(22)
            .margin({ top: 4 })
        }
        .margin({ left: 56 })
        .height('100%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)


        Toggle({ type: ToggleType.Switch, isOn: this.swichStatus })
          .size({ width: 96, height: 52 })
          .selectedColor('#2495ff')
          .switchPointColor('#FFFFFF')
          .onChange((isOn: boolean) => {
            console.info('Component status:' + isOn)
          })
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            right: { anchor: "__container__", align: HorizontalAlign.End },
          })
          .margin({ right: 58 })


      }
      .backgroundColor('#1A1A1A')
      .borderRadius(12)
      .height(100)

    }
  }
}