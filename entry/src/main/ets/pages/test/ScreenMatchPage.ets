import { display } from '@kit.ArkUI';

@Entry
@Component
struct ScreenMatchPage {
  mDownY: number = 0

  build() {
    Column() {
      Button('获取屏幕参数')
        .margin({ top: 100 })
        .onClick(() => {
          let screenWidth = display.getDefaultDisplaySync().width;
          let screenHeight = display.getDefaultDisplaySync().height;
          console.log('getDefaultDisplaySync screenWidth = ' + screenWidth)
          console.log('getDefaultDisplaySync screenHeight = ' + screenHeight)
        })
      Text('1137vp')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
        .height(50)
        .width('1137vp')
      Text('1100vp')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Red)
        .height(50)
        .width('1100vp')


      Text('1280px')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Red)
        .margin({ top: 20 })
        .height(50)
        .width('1280px')
      Text('200vp')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
        .height(50)
        .width('200vp')
      Text('640lpx')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
        .height(50)
        .width('640lpx')
      Text('1280lpx')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
        .height(50)
        .width('1280lpx')
    }
    .alignItems(HorizontalAlign.Start)

  }
}


