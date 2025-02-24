import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'
import { router } from '@kit.ArkUI';
import { SelectShortCutItemData, ShortCutAlarmTypeList, ShortCutSelectTypeList } from '../viewmodel/ShotCutCardData';
import { ShortCutSelectItem } from '../itemview/ShortCutSelectItem';

@Entry
@ComponentV2
struct ShortCutSelect {
  @Local paramsFromIndex: object = router.getParams()
  @Local type: string = ''
  @Local selectList: Array<SelectShortCutItemData> = []

  aboutToAppear(): void {
    this.type = this.paramsFromIndex['selectType'];
    console.log("type = " + this.type)
    let itemName = ''
    let imgRes:ResourceStr = ''
    for (let index = 0; index < ShortCutSelectTypeList.length; index++) {
      if(ShortCutSelectTypeList[index].type==this.type){
        itemName=ShortCutSelectTypeList[index].name
        imgRes=ShortCutSelectTypeList[index].imageSrc
      }
    }
    // 安防报警的
    if(this.type=='6'){
      this.selectList=ShortCutAlarmTypeList
    }else {
      for (let index = 0; index < 8; index++) {
        this.selectList[index]=new SelectShortCutItemData(this.type,itemName+index,imgRes)
      }
    }

  }

  build() {
    RelativeContainer() {
      // 表标题栏
      HeaderTitleBar({ title: '添加快捷方式', isShowRightText: true, rightText: '添加' })

      Column() {
        Grid() {
          ForEach(this.selectList, (item: SelectShortCutItemData) => {
            GridItem() {
              ShortCutSelectItem({itemData:item})
            }
            .height("100%")
            .width('100%')
            .borderRadius(20)
            .backgroundColor('#1A1A1A')
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
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
      }
      .margin({left:48,right:48,top:40})
      .alignRules({
        top:{anchor:"header_rl",align:VerticalAlign.Bottom},
        bottom:{anchor:"__container__",align:VerticalAlign.Bottom},
        left:{anchor:"__container__",align:HorizontalAlign.Start}
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('sys.color.black'))
  }
}