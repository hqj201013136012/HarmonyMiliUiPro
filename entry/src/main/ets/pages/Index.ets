import { BannerCards } from '../view/BannerCards'
import { HomeMenu } from '../view/HomeMenu';
import { HomeStatus } from '../view/HomeStatus';
import { HomeTimeContent } from '../view/HomeTimeContent';

@Entry
@Component
struct Index {
  @StorageProp('time') timeData: string = ''
  @StorageProp('date') dateData: string = ''
  @StorageProp('time_stage') timeStageData: string = ''
  @State @Watch('change1') num: number = 10;

  change1() {
    console.log(`xxx`);
  }

  build() {

    RelativeContainer() {
      // 状态栏左侧
      HomeStatus()

      // 首页时间组件
      HomeTimeContent({ timeStr: this.timeData, dateStr: this.dateData, timeStage: this.timeStageData })

      // 免打扰，紧急救援，呼叫中心
      HomeMenu()

      // 滑动卡片
      Column() {
        BannerCards()
          .width('100%')
          .height('100%')
      }
      .width('43%')
      .margin({ top: 20, right: 48 })
      .alignRules({
        top: { anchor: "status_bar", align: VerticalAlign.Bottom },
        right: { anchor: "__container__", align: HorizontalAlign.End },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0x000000)
  }
}

