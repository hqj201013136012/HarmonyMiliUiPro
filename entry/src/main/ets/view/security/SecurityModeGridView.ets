import {
  SecurityModeBannerClass,
  SecurityModeItemType,
  wiredDefenseAreaList,
  wirelessDefenseAreaList
} from "../../viewmodel/SecurityData"

@Component
export struct SecurityModeGridView {
  @State type: string = ''
  @State securityModeBannerList: Array<SecurityModeBannerClass> = []
  @State securityModeStr: string = '有线防区'

  aboutToAppear(): void {
    this.securityModeBannerList =
      [new SecurityModeBannerClass('0', wiredDefenseAreaList),
        new SecurityModeBannerClass('1', wirelessDefenseAreaList)]
  }

  build() {
    Column() {
      Row() {
        Text('消除警报')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
          })
      }
      .width('100%')
      .margin({ top: 35 })
      .justifyContent(FlexAlign.End)
      .id('top_right_rw')

      Column() {
        Text(this.securityModeStr)
          .width('100%')
          .fontColor('#808080')
          .fontSize(20)
          .padding({ left: 20, top: 20, bottom: 6 })
          .align(Alignment.Start)

        Swiper() {
          ForEach(this.securityModeBannerList, (item: SecurityModeBannerClass, index: number) => {
            Grid() {
              ForEach(item.types, (type: SecurityModeItemType) => {
                GridItem() {
                  Column() {
                    Image(type.imageSrc)
                      .width(80)
                      .height(80)

                    Text(type.name)
                      .fontSize(24)
                      .fontColor('#ffffff')
                      .margin({ left: 15, top: 15 })
                  }
                  .justifyContent(FlexAlign.Center)
                }
                .height("100%")
                .width('100%')
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr')
            .columnsGap(20)
            .rowsGap(70)
            .width('100%')
            .margin({ bottom: 40 })
            .alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
            })
          }, (item: SecurityModeBannerClass, index: number) => item.id)
        }
        .height(360)
        .backgroundColor('#00000000')
        .autoPlay(false)
        .loop(false)
        .indicator(
          new DotIndicator()
            .color('#262626')
            .selectedColor('#2495FF')
        )
        .onChange((index: number) => {
          if (index == 0) {
            this.securityModeStr = "有线防区"
          } else {
            this.securityModeStr = "无线防区"
          }
        })

        Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
          Row() {
            Image($r('app.media.icon_athome_btn'))
              .width(25)
              .height(25)

            Text('在家撤防')
              .fontColor('#ffffff')
              .fontSize(24)
              .margin({left:17})
          }
          .width(188)
          .height(70)
          .backgroundColor('#262626')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)

          Row() {
            Image($r('app.media.icon_goout_btn'))
              .width(25)
              .height(25)

            Text('外出布防')
              .fontColor('#ffffff')
              .fontSize(24)
              .margin({left:17})
          }
          .width(188)
          .height(70)
          .backgroundColor('#262626')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)

          Row() {
            Image($r('app.media.icon_atnight_btn'))
              .width(25)
              .height(25)

            Text('夜间布防')
              .fontColor('#ffffff')
              .fontSize(24)
              .margin({left:17})
          }
          .width(188)
          .height(70)
          .backgroundColor('#262626')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }

      }
      .width('100%')
      .height(514)
      .margin({ top: 55 })
      .backgroundColor('#1A1A1A')
      .borderRadius(20)
      .padding({ left: 24, right: 24 })

    }
    .justifyContent(FlexAlign.End)
    .padding({ left: 48, right: 48 })

  }
}