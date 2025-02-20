import { LylyAudioList } from '../view/intercom/LylyAudioList'
import { LylyHomeLeftMenu } from '../view/intercom/LylyHomeLeftMenu'
import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'

@Entry
@Component
struct LylyHomePage {

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: "留影留言" })
      LylyHomeLeftMenu()
        .alignRules({
          top: { anchor: "header_rl", align: VerticalAlign.Bottom },
          left:{ anchor: "__container__", align: HorizontalAlign.Start },
        })
        .id('left_menu')

      LylyAudioList()
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left:{ anchor: "left_menu", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}