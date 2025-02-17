import { router } from "@kit.ArkUI"
import { CardItemType, CardTypeList } from "../viewmodel/ShotCutCardData"
import { CardType } from "@kit.VisionKit"

@Component
export struct BannerCards {
  @State defaultBannerList: Array<BannerClass> = []

  aboutToAppear(): void {
    this.defaultBannerList =
      [new BannerClass('0', Array<CardItemType>(CardTypeList[0], CardTypeList[1], CardTypeList[2], CardTypeList[3])),
        new BannerClass('1', Array<CardItemType>(CardTypeList[4], CardTypeList[5], CardTypeList[6], CardTypeList[7]))]
  }

  build() {
    RelativeContainer() {
      Swiper() {
        ForEach(this.defaultBannerList, (item: BannerClass, index: number) => {
          Grid() {
            ForEach(item.types, (type: CardItemType) => {
              if (type.name == '') {
                GridItem() {
                  RelativeContainer() {
                    Image(type.imageSrc)
                      .width(140)
                      .height(140)
                      .alignRules({
                        center: { anchor: "__container__", align: VerticalAlign.Center },
                        middle: { anchor: "__container__", align: HorizontalAlign.Center },
                      })
                      .onClick(() => {
                        router.pushUrl({
                          url: 'pages/ShotCutList'
                        })
                      })
                  }
                }
                .height("100%")
                .width('100%')
                .borderRadius(20)
                .backgroundColor('#303030')
              } else {
                GridItem() {
                  RelativeContainer() {
                    Text(type.name)
                      .fontSize(30)
                      .fontColor('#ffffff')
                      .margin({ left: 15, top: 15 })

                    Image(type.imageSrc)
                      .width(140)
                      .height(140)
                      .alignRules({
                        center: { anchor: "__container__", align: VerticalAlign.Center },
                        right: { anchor: "__container__", align: HorizontalAlign.End },
                      })
                  }
                }
                .height("100%")
                .width('100%')
                .borderRadius(20)
                .backgroundColor('#303030')
              }
            })
          }
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap(30)
          .rowsGap(30)
          .width('100%')
          .backgroundColor(0x00000000)
          .margin({ bottom: 48 })
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          })
        }, (item: BannerClass, index: number) => item.id)
      }
      .autoPlay(false)
      .loop(false)
      .indicator(
        new DotIndicator()
          .color('#262626')
          .selectedColor('#2495FF')
      )
      .onChange(e => {
        console.log("滑动了头像");
      })
    }
    .height('100%')
    .width('100%')
  }
}

// 定义数据结构
class BannerClass {
  id: string = '';
  types: CardItemType[]

  constructor(id: string, types: CardItemType[]) {
    this.id = id;
    this.types = types;
  }
}

// // 卡片数据结构
// class CardType{
//   name: string = '';
//   imageSrc: ResourceStr = '';
//   constructor(name: string, imageSrc: ResourceStr) {
//     this.name = name;
//     this.imageSrc = imageSrc;
//   }
// }