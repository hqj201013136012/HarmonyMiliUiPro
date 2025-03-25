import { PersistenceV2, router } from "@kit.ArkUI"
import {
  HomeCardItemEntity,
  HOME_CARD_ADD_TYPE,
  HOME_CARD_LADDER_TYPE,
  EditHomeCardListData,
  getDefaultCardTypeList,
  BannerClass
} from "../../viewmodel/ShotCutCardData"
import { CommonIconAlertDialog } from "../../common/dialog/CommonIconAlertDialog"
import { HOME_SHORT_CUT_CARD_PT_KEY } from "../../viewmodel/PtConstants"

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`error key: ${key}, reason: ${reason}, message: ${msg}`);
});

@ComponentV2
export struct BannerCards {
  @Local homeCardBannerList: Array<BannerClass> = []
  @Local homeAddCardsData: EditHomeCardListData =
    PersistenceV2.connect(EditHomeCardListData, HOME_SHORT_CUT_CARD_PT_KEY, () => new EditHomeCardListData())!;

  @Monitor("homeAddCardsData.dataStr")
  dataStrChange(monitor: IMonitor) {
    console.log("homeAddCardsData dataStrChange= " + this.homeAddCardsData.dataStr)
    this.initData()
  }

  // onPageShow(): void {
  //   console.log("homeAddCardsData onPageShow ")
  //   this.initData()
  // }

  aboutToAppear(): void {
    console.log("homeAddCardsData aboutToAppear ")
    this.initData()
  }


  initData() {
    console.log("homeAddCardsData BannerCards datastr= " + this.homeAddCardsData.dataStr)
    // 默认的卡片
    let defaultCardTypeList = getDefaultCardTypeList()
    // 动态的快捷方式卡片
    if (this.homeAddCardsData.dataStr != '') {
      defaultCardTypeList =
        defaultCardTypeList.concat(JSON.parse(this.homeAddCardsData.dataStr) as HomeCardItemEntity[])
    }
    // 添加+卡片
    let itemAdd = new HomeCardItemEntity()
    itemAdd.setData(HOME_CARD_ADD_TYPE, "", '', $r('app.media.icon_add'), "pages/ShotCutList");
    defaultCardTypeList.push(itemAdd)

    // this.homeCardBannerList =
    //   [new BannerClass('0',
    //     Array<HomeCardItemEntity>(defaultCardTypeList[0], defaultCardTypeList[1], defaultCardTypeList[2],
    //       defaultCardTypeList[3])),
    //     new BannerClass('1',
    //       Array<HomeCardItemEntity>(defaultCardTypeList[4], defaultCardTypeList[5], defaultCardTypeList[6],
    //         defaultCardTypeList[7])),
    //     new BannerClass('2', Array<HomeCardItemEntity>(defaultCardTypeList[8]))]

    console.log('homeAddCardsData BannerCards length = ' + defaultCardTypeList.length)
    let pageNum = 4
    let nums = Math.ceil(defaultCardTypeList.length / pageNum)
    this.homeCardBannerList=[]
    for (let index = 0; index < nums; index++) {
      // 每四个卡片一个滑动页面，截取数组算法
      let tempList =
        defaultCardTypeList.slice(index * pageNum,
          index < (nums - 1) ? (index + 1) * pageNum : defaultCardTypeList.length)
      console.log('homeAddCardsData BannerCards tempList = ' + tempList.length)
      this.homeCardBannerList.push(new BannerClass(index.toString(), tempList))
    }
    console.log('homeAddCardsData BannerCards homeCardBannerList length = ' + this.homeCardBannerList.length)
  }

  // 招梯弹窗
  alertDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonIconAlertDialog({
      icon: $r('app.media.tip_success'),
      textStr: '召梯成功！请尽快出门'
    }),
    alignment: DialogAlignment.Center,
    width: 558,
    height: 370,
  })

  build() {
    RelativeContainer() {
      Swiper() {
        ForEach(this.homeCardBannerList, (item: BannerClass, index: number) => {
          Grid() {
            ForEach(item.types, (itemCard: HomeCardItemEntity) => {
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
                    if (this.alertDialogController != undefined) {
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
              .backgroundColor('#1A1A1A')

            },(itemCard: HomeCardItemEntity,index:number) => itemCard.type + itemCard.itemId + index)
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
        }, (item: BannerClass, index: number) => item.id+new Date().getTime().toString())
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

