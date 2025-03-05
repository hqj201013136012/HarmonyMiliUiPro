import { CommonSelectListDialog } from '../../common/dialog/CommonSelectListDialog'
import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { screenProTimeList, SelectDialogItemData } from '../../viewmodel/SelectDialogItemData'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

@Entry
@ComponentV2
struct SecurityParamPage {
  @Local mList: Array<SetItemData> = []
  @Local alarmRingTime:string='3分钟'
  @Local alarmTime:string='30秒'
  @Local timeList: Array<SelectDialogItemData> = screenProTimeList

  timesDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'时间',
      selectList: this.timeList
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 544,
  })


  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '警铃时长', RadiusType.TopRad, false, true,false,'',0,this.alarmRingTime))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '预警时间', RadiusType.BottomRad, true, false,false,'',0,this.alarmTime))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '预警声', RadiusType.BottomRad, true, false,true))
  }

  build() {
    Column() {
      HeaderTitleBar({ title: "安防参数" })
      Column() {
        List() {
          ForEach(this.mList, (item: SetItemData) => {
            ListItem() {
              ItemSetCommonView({ itemData: item })
                .onClick(() => {
                  switch (item.name){
                    case '警铃时长':
                      this.timesDialogController?.open()
                      break
                    case '预警时间':
                      this.timesDialogController?.open()
                      break
                  }
                })
            }
          }, (item: SetItemData, index: number) => item.name + item.itemType + index)
        }
        .listDirection(Axis.Vertical) // 排列方向
        .scrollBar(BarState.Off)
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor('#000000')
      .padding({ left: 52, right: 52,bottom:40 })
      .margin({top:60})
    }
    .backgroundColor('#000000')
  }
}