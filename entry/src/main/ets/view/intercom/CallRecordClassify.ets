import {
  CallListItemData,
  callRecordCallInList,
  callRecordCallOutList,
  CallRecordItemData,
  callRecordMissList
} from "../../viewmodel/InterComData"
import { CallRecordItemView } from "../../itemview/CallRecordItemView"

@Component
export struct CallRecordClassify {
  @State callRecordList: Array<CallRecordItemData> = []
  @State type: string = ''

  aboutToAppear(): void {
    this.callRecordList = this.callRecordList.concat(callRecordMissList)
    this.callRecordList = this.callRecordList.concat(callRecordCallInList)
    this.callRecordList = this.callRecordList.concat(callRecordCallOutList)
  }

  build() {
    Column() {
      Row({ space: 30 }) {
        Text('未接记录')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.callRecordList = callRecordMissList
          })

        Text('呼入记录')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.callRecordList = callRecordCallInList
          })

        Text('呼出记录')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.callRecordList = callRecordCallOutList
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
            this.callRecordList=[]
          })

      }
      .width('100%')
      .margin({ top: 35 })
      .justifyContent(FlexAlign.End)
      .id('top_right_rw')

      Stack() {
        Column() {

          List({ space: 14 }) {
            ForEach(this.callRecordList, (item: CallRecordItemData) => {
              ListItem() {
                CallRecordItemView({ itemData: item })
              }
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('100%')

        }
        .width('100%')
        .height(514)
        .margin({ top: 55 })

        // 缺省页面
        if (this.callRecordList.length == 0) {
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
      .width('100%')
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: 48, right: 48 })

  }
}