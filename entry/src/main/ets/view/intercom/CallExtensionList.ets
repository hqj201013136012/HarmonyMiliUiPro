
import { ItemCallView } from "../../itemview/ItemCallView"
import { CallListItemData } from "../../viewmodel/InterComData"
import { router } from "@kit.ArkUI"
import { DefaultPage } from "../../common/view/DefaultPage"

@ComponentV2
export struct CallExtensionList {
  @Local selectList: Array<CallListItemData> = []
  @Param type: string = ''
  aboutToAppear(): void {
    for (let index = 0; index < 8; index++) {
      this.selectList[index]=new CallListItemData(this.type,"分机"+(index+1),$r('app.media.extension_click'))
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
                  url: 'pages/AudioCallPage',
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
          DefaultPage()
        }
      }
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: 48, right: 48 })


  }

}