@Component
export struct UnReadRecordView {
  @State num: number = 0
  build() {
    Row(){
      Text("共有")
        .fontColor('#ffffff')
        .fontSize(22)

      Text(this.num+"")
        .fontColor('#ffffff')
        .fontSize(36)
        .padding({bottom:4,left:2,right:2})

      Text("未读记录")
        .fontColor('#ffffff')
        .fontSize(22)
    }
    .width('100%')
    .height(55)
    .justifyContent(FlexAlign.Start)
  }
}