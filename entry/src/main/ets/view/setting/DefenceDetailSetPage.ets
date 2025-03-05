import { CommonSelectListDialog } from '../../common/dialog/CommonSelectListDialog'
import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { probeTypeList, screenProTimeList, SelectDialogItemData } from '../../viewmodel/SelectDialogItemData'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

@Entry
@ComponentV2
struct DefenceDetailSetPage {
  @Local mList: Array<SetItemData> = []
  @Local alarmType:string='紧急报警'
  @Local delayAlarmTime:string='30秒'
  @Local timeList: Array<SelectDialogItemData> = screenProTimeList
  @Local probeTypes: Array<SelectDialogItemData> = probeTypeList

  timesDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'时间',
      selectList: this.timeList
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 544,
  })

  probeTypeDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'探头类型',
      selectList: this.probeTypes
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 600,
  })

  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '启用', RadiusType.AllRad, true, false))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '探头类型', RadiusType.TopRad, false, true,false,'',0,this.alarmType))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '24小时防区', RadiusType.NoneRad, false, true,true))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '夜间防区', RadiusType.NoneRad, false, true,true))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '探头常开', RadiusType.NoneRad, false, true,true))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '报警延时', RadiusType.BottomRad, true, false,false,'',0,this.delayAlarmTime))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '画面', RadiusType.TopRad, false, true))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '声音', RadiusType.BottomRad, true, false))
  }

  build() {
    Column() {
      HeaderTitleBar({ title: "防区设置" })
      Column() {
        List() {
          ForEach(this.mList, (item: SetItemData) => {
            ListItem() {
              ItemSetCommonView({ itemData: item })
                .onClick(() => {
                  switch (item.name){
                    case '探头类型':
                      this.probeTypeDialogController?.open()
                      break
                    case '报警延时':
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