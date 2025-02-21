@Entry
@Component
struct TestPage {
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State rotateAngle: number = 270
  @State flag: boolean = true
  @State processValue: number = 40

  build() {
    Column() {
      Slider({
        value: this.processValue,
        style: SliderStyle.OutSet,
        direction: Axis.Vertical,
        reverse: true // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
      })
        .trackThickness(26)
        .blockSize({width:38,height:38})
        .height(280)
        .blockColor('#ffffff')
        .trackColor('#262626')
        .selectedColor('#2495ff')
        .margin({ left: 90 })

        .onChange((value: number, mode: SliderChangeMode) => {
          this.processValue = value
        })
        .id('slider_view')
    }
  }
}