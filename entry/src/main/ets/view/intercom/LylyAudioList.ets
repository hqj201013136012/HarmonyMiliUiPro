import { ItemSecurityAlarm } from "../../itemview/ItemSecurityAlarm"
import { UnReadRecordView } from "../../common/view/UnReadRecordView"
import { lylyAudioDataList, LylyAudioItemData } from "../../viewmodel/InterComData"
import { ItemLylyAudio } from "../../itemview/ItemLylyAudio"
import { DefaultPage } from "../../common/view/DefaultPage"

@Component
export struct LylyAudioList {
  @State recordList: Array<LylyAudioItemData> = []
  @State unReadNum: number = 0

  aboutToAppear(): void {
    this.recordList = lylyAudioDataList
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
            ForEach(this.recordList, (item: LylyAudioItemData) => {
              ListItem() {
                ItemLylyAudio({ itemData: item })
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
          DefaultPage()
        }
      }
      .width('100%')
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: 48, right: 48 })

  }
}