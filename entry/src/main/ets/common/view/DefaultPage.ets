@ComponentV2
export struct DefaultPage {
  build() {
    Column() {
      Image($r('app.media.pic_nothing'))
        .width(524)
        .height(274)

      Text('暂无数据，请重试')
        .fontColor('#ffffff')
        .fontSize(24)
    }
    .align(Alignment.Center)
  }
}