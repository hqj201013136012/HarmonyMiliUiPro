import { router } from '@kit.ArkUI';

@Entry
@Component
struct TestHomePage {
  @State message: string = 'Hello World';

  build() {
    Column({space:20}){
      Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
        Button('测试页面')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/test/TestPage'
            })
          })
        Button('屏幕适配测试')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/test/ScreenMatchPage'
            })
          })

        Button('Navigation导航测试')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/test/NavigationTestPage'
            })
          })
      }
      .width('100%')
      .margin({top:40})
    }
  }
}