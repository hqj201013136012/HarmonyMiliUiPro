import { CommonDateAndTimeDialog } from '../../common/dialog/CommonDateAndTimeDialog'
import { ItemSetArrowView } from '../../itemview/ItemSetArrowView'
import { ItemSetSwitchView } from '../../itemview/ItemSetSwitchView'
import { ItemSetTextView } from '../../itemview/ItemSetTextView'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

import { DateTimeFormat, DateTimePicker, DateUtil, SuffixMode } from '@xinyansoft/oh-date-picker'

/**
 * 时间设置页面
 */
@Entry
@Component
struct TimeSetPage {
  @State currentTimeStr:string=DateUtil.getTodayStr('yyyy-MM-dd HH:mm')
  dateAndTimeDialog: CustomDialogController | null = new CustomDialogController({
    builder: CommonDateAndTimeDialog({currentDate:this.currentTimeStr}),
    alignment:DialogAlignment.Center,
    width:700,
    height:500,
  })

  build() {
    Column() {
      HeaderTitleBar({ title: "时间设置" })
      Column() {
        ItemSetSwitchView({ name: "开启免打扰", discribeStr: '开启后，新消息将不会进行铃声提醒', swichStatus: true })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "时间设置", rightText: this.currentTimeStr })
          .onClick(()=>{
            if(this.dateAndTimeDialog!=undefined){
              this.dateAndTimeDialog.open()
            }
          })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "时区设置", rightText: "北京/中国" })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "选择日期格式", rightText: "2023-10-31" })
      }
      .backgroundColor('#1A1A1A')
      .borderRadius(12)
      .margin({ left: 52, right: 52, top: 60 })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')
  }
}