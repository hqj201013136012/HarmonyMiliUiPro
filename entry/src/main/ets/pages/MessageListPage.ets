import { DefaultPage } from '../common/view/DefaultPage';
import { UnReadRecordView } from '../common/view/UnReadRecordView';
import {  HeaderTitleBar } from '../view/launcher/HeaderTitleBar';
import { MessageRecordItemView } from '../view/message/MessageRecordItemView';
import { MessageItemData, messageRecordList } from '../viewmodel/MessageData';

@Entry
@ComponentV2
struct MessageListPage {
  @Local recordList: Array<MessageItemData> = messageRecordList
  @Local unReadNum: number = 0

  aboutToAppear(): void {
    this.recordList.forEach(element => {
      if (element.isRead == false) {
        this.unReadNum++
      }
    });
  }

  build() {
    Column() {
      // 表标题栏
      HeaderTitleBar({
        title: '信息',
        isShowRightText: true,
        rightText: '清空',
        rightClick: () => {
          this.recordList=[]
        }
      })
      Stack() {
        RelativeContainer() {
          // 未读记录数
          UnReadRecordView({ num: this.unReadNum })
            .id('unread_view')

          List({ space: 12, initialIndex: 0 }) {
            ForEach(this.recordList, (item: MessageItemData) => {
              ListItem() {
                MessageRecordItemView({ itemData: item })
              }
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('75%')
          .alignRules({
            top: { anchor: "unread_view", align: VerticalAlign.Bottom },
            // bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          })

        }
        .width('100%')
        // 缺省页面
        if(this.recordList.length==0){
          DefaultPage()
        }
      }
      .width('100%')
      .padding({ left: 52, right: 52 })

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#000000')
  }
}