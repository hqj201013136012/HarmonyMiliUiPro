import { DefaultPage } from "../../common/view/DefaultPage"
import { ItemSecurityOperate } from "../../itemview/ItemSecurityOperate"
import { SecurityOperateRecordItemData, securityOperateRecordList } from "../../viewmodel/SecurityData"


@Component
export struct SecurityOperateRecordList {
  @State recordList: Array<SecurityOperateRecordItemData> = []
  @State type: string = ''

  aboutToAppear(): void {
    this.recordList = securityOperateRecordList
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

      Stack() {
        Column() {
          List({ space: 14 }) {
            ForEach(this.recordList, (item: SecurityOperateRecordItemData) => {
              ListItem() {
                ItemSecurityOperate({ itemData: item })
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