import { ItemCallView } from "../../itemview/ItemCallView"
import { CallListItemData } from "../../viewmodel/InterComData"
import { router } from "@kit.ArkUI"

@Component
export struct CallCenterList {
  @State selectList: Array<CallListItemData> = []
  @State type: string = ''
  aboutToAppear(): void {
    for (let index = 0; index < 8; index++) {
      this.selectList[index]=new CallListItemData(this.type,"管理中心"+(index+1),$r('app.media.icon_callcenter_list_item'))
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
            .margin({right:30})
            .backgroundColor('#262626')
            .borderRadius(12)
            .textAlign(TextAlign.Center)
            .onClick(()=>{
              for (let index = 0; index < 8; index++) {
                this.selectList[index]=new CallListItemData(this.type,"管理中心"+(index+1),$r('app.media.icon_callcenter_list_item'))
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
            .onClick(()=>{
              this.selectList=[]
            })
        }
        .width('100%')
        .margin({ top: 35 })
        .justifyContent(FlexAlign.End)
        .id('top_right_rw')
        Stack() {
          Column() {
            Grid() {
              ForEach(this.selectList, (item: CallListItemData) => {
                GridItem() {
                  ItemCallView({ itemData: item })
                }
                .height("100%")
                .width('100%')
                .onClick(()=>{
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
          if(this.selectList.length==0){
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