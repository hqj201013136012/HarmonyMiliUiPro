import { router } from "@kit.ArkUI"
import {
  CardItemType,
  defaultCardTypeList,
  HOME_CARD_ADD_TYPE,
  HOME_CARD_LADDER_TYPE
} from "../../viewmodel/ShotCutCardData"
import { CardType } from "@kit.VisionKit"
import { CommonIconAlertDialog } from "../../common/dialog/CommonIconAlertDialog"
import { text } from "@kit.ArkGraphics2D"

@ComponentV2
export struct BannerCards {
  @Local defaultBannerList: Array<BannerClass> = []

  aboutToAppear(): void {
    this.defaultBannerList =
      [new BannerClass('0', Array<CardItemType>(defaultCardTypeList[0], defaultCardTypeList[1], defaultCardTypeList[2],
        defaultCardTypeList[3])),
        new BannerClass('1', Array<CardItemType>(defaultCardTypeList[4], defaultCardTypeList[5], defaultCardTypeList[6],
          defaultCardTypeList[7])),
        new BannerClass('2', Array<CardItemType>(defaultCardTypeList[8]))]
  }

  // 招梯弹窗
  alertDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonIconAlertDialog({
      icon: $r('app.media.tip_success'),
      textStr:'召梯成功！请尽快出门'
    }),
    alignment:DialogAlignment.Center,
    width:558,
    height:370,
  })

  build() {
    RelativeContainer() {
      Swiper() {
        ForEach(this.defaultBannerList, (item: BannerClass, index: number) => {
          Grid() {
            ForEach(item.types, (itemCard: CardItemType) => {
              GridItem() {
                RelativeContainer() {
                  // 添加按钮
                  if (itemCard.type == HOME_CARD_ADD_TYPE) {
                    Image(itemCard.imageSrc)
                      .width(140)
                      .height(140)
                      .alignRules({
                        center: { anchor: "__container__", align: VerticalAlign.Center },
                        middle: { anchor: "__container__", align: HorizontalAlign.Center },
                      })
                  }
                  // 快捷卡片
                  else {
                    Text(itemCard.name)
                      .fontSize(30)
                      .fontColor('#ffffff')
                      .margin({ left: 15, top: 15 })

                    Image(itemCard.imageSrc)
                      .width(140)
                      .height(140)
                      .alignRules({
                        center: { anchor: "__container__", align: VerticalAlign.Center },
                        right: { anchor: "__container__", align: HorizontalAlign.End },
                      })
                  }

                }
                .onClick(() => {
                  if (itemCard.type == HOME_CARD_LADDER_TYPE) {
                    if(this.alertDialogController!=undefined){
                      this.alertDialogController.open()
                    }

                  } else {
                    if (itemCard.urlpath != '') {
                      router.pushUrl({
                        url: itemCard.urlpath
                      })
                    }
                  }
                })
              }
              .height("100%")
              .width('100%')
              .borderRadius(20)
              .backgroundColor('#303030')

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
