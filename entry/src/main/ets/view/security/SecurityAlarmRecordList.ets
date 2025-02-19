import { SecurityAlarmRecordItemData, securityAlarmRecordList } from "../../viewmodel/SecurityData"
import { ItemSecurityAlarm } from "../../itemview/ItemSecurityAlarm"
import { UnReadRecordView } from "../../common/view/UnReadRecordView"

@Component
export struct SecurityAlarmRecordList {
  @State recordList: Array<SecurityAlarmRecordItemData> = []
  @State type: string = ''
  @State unReadNum: number = 0

  aboutToAppear(): void {
    this.recordList = securityAlarmRecordList
    this.recordList.forEach(element => {
      if(element.isRead==false){
        this.unReadNum++
      }
    });
  }

  build() {
    Column() {
      Row({ space: 30 }) {
        Text('清空')
          .width(175)
          .height(70)
          .fontColor('#ffffff')
          .fontSize(28)
          .backgroundColor('#262626')
          .borderRadius(12)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.recordList = []
          })

      }
      .width('100%')
      .margin({ top: 35 })
      .justifyContent(FlexAlign.End)
      .id('top_right_rw')
      // 未读记录数
      UnReadRecordView({num:this.unReadNum})

      Stack() {
        Column() {
          List({ space: 14 }) {
            ForEach(this.recordList, (item: SecurityAlarmRecordItemData) => {
              ListItem() {
                ItemSecurityAlarm({ itemData: item })
              }
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('100%')

        }
        .width('100%')
        .height(514)

        // 缺省页面
        if (this.recordList.length == 0) {
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