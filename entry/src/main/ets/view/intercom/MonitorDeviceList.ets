import { ItemCallView } from "../../itemview/ItemCallView"
import {
  MonitorDeviceItemData,
  MONITOR_CLASSIFY_TYPE,
  MONITOR_DOOR_TYPE,
  MONITOR_IPC_TYPE,
  MONITOR_LADDER_TYPE
} from "../../viewmodel/InterComData"
import { router } from "@kit.ArkUI"

@Component
export struct MonitorDeviceList {
  @State selectList: Array<MonitorDeviceItemData> = []
  @Prop @Watch('menuTypeChange') menuType: string = '';
  menuTypeChange() {
    console.log(`menuTypeChangexxxxx` + this.menuType);
    this.initData()
  }

  @State nameStr: string = ""
  @State imgSrc: ResourceStr = ''

  aboutToAppear(): void {
    console.log(`menuTypeChange` + this.menuType);
    this.initData()
  }

  initData() {
    switch (this.menuType) {
      case MONITOR_DOOR_TYPE:
        this.nameStr = "门前机"
        this.imgSrc = $r('app.media.icon_monitor_door_item')
        break
      case MONITOR_LADDER_TYPE:
        this.nameStr = "梯口机"
        this.imgSrc = $r('app.media.icon_monitor_ladder_item')
        break
      case MONITOR_CLASSIFY_TYPE:
        this.nameStr = "区口机"
        this.imgSrc = $r('app.media.icon_monitor_classify_item')
        break
      case MONITOR_IPC_TYPE:
        this.nameStr = "IPC"
        this.imgSrc = $r('app.media.icon_ipc_item')
        break
    }
    for (let index = 0; index < 8; index++) {
      this.selectList[index] = new MonitorDeviceItemData(this.menuType, this.nameStr + (index + 1), this.imgSrc)
    }
  }

  build() {
    Column() {
      Row() {
        Text('重新搜索')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .margin({ right: 30 })
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            for (let index = 0; index < 8; index++) {
              this.selectList[index] = new MonitorDeviceItemData(this.menuType, this.nameStr + (index + 1), this.imgSrc)
            }
          })
        Text('清空')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.selectList = []
          })
      }
      .width('100%')
      .margin({ top: 35 })
      .justifyContent(FlexAlign.End)
      .id('top_right_rw')

      Stack() {
        Column() {
          Grid() {
            ForEach(this.selectList, (item: MonitorDeviceItemData) => {
              GridItem() {
                ItemCallView({ itemData: item })
              }
              .height("100%")
              .width('100%')
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/CallPage',
                })
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .width('100%')
          .height('100%')

        }
        .width('100%')
        .height(514)
        .margin({ top: 55 })
        .backgroundColor('#1A1A1A')
        .borderRadius(20)
        .padding({ left: 24, right: 24 })

        // 缺省页面
        if (this.selectList.length == 0) {
          Column() {
            Image($r('app.media.pic_nothing'))
              .width(524)
              .height(274)

            Text('暂无数据，请重试')
              .fontColor('#ffffff')
              .fontSize(24)
          }
          .align(Alignment.Center)
        }
      }
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: 48, right: 48 })

  }
}