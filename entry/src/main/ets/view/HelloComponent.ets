@Preview
@Component
export struct HelloComponent {
  @State message: string = 'Hello, World!';


  build() {
    // HelloComponent自定义组件组合系统组件Row和Text
    Row() {
      Text(this.message)
        .onClick(() => {
          // 状态变量message的改变驱动UI刷新，UI从'Hello, World!'刷新为'Hello, ArkUI!'
          this.message = 'Hello, ArkUI!';
        })
      Image($r('app.media.icon_information'))
        .width(70)
        .height(70)
        .margin({ left: 28 })
    }
    .backgroundColor('#000000')
  }
}