import { DateUtil } from '@xinyansoft/oh-date-picker'
import { CommonDateAndTimeDialog } from '../../common/dialog/CommonDateAndTimeDialog'
import { CommonSelectListDialog } from '../../common/dialog/CommonSelectListDialog'
import { CommonTimeDialog } from '../../common/dialog/CommonTimeDialog'
import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { reDateList, reFreqList, securityAppList, SelectDialogItemData } from '../../viewmodel/SelectDialogItemData'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

@Entry
@ComponentV2
struct SecurityAppPage {
  @Local mList: Array<SetItemData> = []
  @Local securityAppDatas: Array<SelectDialogItemData> = securityAppList
  @Local reFreqDatas: Array<SelectDialogItemData> = reFreqList
  @Local reDateDatas: Array<SelectDialogItemData> = reDateList

  // 预约类型弹窗
  securityAppController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'预约类型',
      selectList: this.securityAppDatas
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 440,
  })

  // 重复频率弹窗
  reFreqController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'预约类型',
      selectList: this.reFreqDatas
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 440,
  })

  // 重复日期弹窗
  reDateController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'重复日期',
      selectList: this.reDateDatas
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 600,
  })

  @Local currentTimeStr:string=DateUtil.getTodayStr('HH:mm')
  timeDialog: CustomDialogController | null = new CustomDialogController({
    builder: CommonTimeDialog({currentDate:this.currentTimeStr}),
    alignment:DialogAlignment.Center,
    width:700,
    height:500,
  })

  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '启用安防预约', RadiusType.TopRad, false,true,true,'开启后，设置预约安防模式'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '预约类型', RadiusType.BottomRad, true, false, false,'',0,'在家撤防'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '重复频率', RadiusType.TopRad, false, true, false,'',0,'每周'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '重复日期', RadiusType.NoneRad, false, true, false,'',0,'星期一，星期二，星期六'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '开始时间选择', RadiusType.BottomRad, false, false, false,'',0,'05:00'))

  }

  build() {
    Column() {
      HeaderTitleBar({ title: "安防预约" })
      Column() {
        List() {
          ForEach(this.mList, (item: SetItemData) => {
            ListItem() {
              ItemSetCommonView({ itemData: item })
                .onClick(() => {
                  switch (item.name) {
                    case '预约类型':
                      this.securityAppController?.open()
                      break
                    case '重复频率':
                      this.reFreqController?.open()
                      break
                    case '重复日期':
                      this.reDateController?.open()
                      break
                    case '开始时间选择':
                      this.timeDialog?.open()
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
      .padding({ left: 52, right: 52 })
      .margin({top:60})
    }
    .backgroundColor('#000000')
  }
}