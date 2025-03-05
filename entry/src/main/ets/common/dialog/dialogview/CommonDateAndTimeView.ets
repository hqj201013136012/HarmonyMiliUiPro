import {
  DateTime,
  DateTimeFormat,
  DateTimePicker,
  DateTimePickerConfig,
  DateUtil,
  SuffixMode
} from '@xinyansoft/oh-date-picker'
import { PromptDialogHelper } from '../../helper/PromptDialogHelper'

export class DateAndTimeParams {
  currentDate: string = ""
  formatType: DateTimeFormat = DateTimeFormat.YmdHm
  config: DateTimePickerConfig = {
    format: this.formatType,
    start: '1900-01-01 00:00',
    end: '2099-12-31 23:59',
    selected: (this.currentDate == '') ? DateUtil.getTodayStr('yyyy-MM-dd HH:mm') : this.currentDate
  }
  dataCallBack: (data: string) => void;

  constructor(currentDate: string, formatType: DateTimeFormat = DateTimeFormat.YmdHm,
    dataCallBack: (data: string) => void) {
    this.currentDate = currentDate;
    this.formatType = formatType;
    this.config.format = formatType
    this.dataCallBack = dataCallBack
  }
}

@Builder
export function CommonDateAndTimeView(param: DateAndTimeParams) {
  Column() {
    Text('时间设置')
      .fontColor('#ffffff')
      .fontSize(30)
      .margin({ top: 38 })

    DateTimePicker({
      config: param.config,
      suffixMode: SuffixMode.Separated,
      suffixes: {
        // 后缀文字
        year: '年',
        month: '月',
        day: '日',
        hour: '时',
        minute: '',
        second: ''
      },
      selectedTextStyle: {
        font: {
          size: 34
        },
        color: '#2495ff'
      },
      textStyle: {
        font: {
          size: 22
        },
        color: '#ffffff'
      },
      disappearTextStyle: {
        font: {
          size: 18
        },
        color: '#ffffff'
      },
      suffixTextStyle: {
        font: {
          size: 24
        },
        color: '#484848'
      },
      onSelectedCallback: (selected) => {
        // currentDate = selected.format()
        // dataCallBack(currentDate)
        param.dataCallBack(selected.format())
      }
    })
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.Center)
      .padding({ left: 40, right: 40 })

    Row() {
      Button('取消')
        .width(280)
        .height(75)
        .backgroundColor('#262626')
        .fontColor('#ffffff')
        .fontSize(28)
        .borderRadius(20)
        .onClick(() => {
          PromptDialogHelper.closeDialog()
        })

      Button('确定')
        .width(280)
        .height(75)
        .backgroundColor('#2495ff')
        .fontColor('#ffffff')
        .fontSize(28)
        .borderRadius(20)
        .margin({ left: 30 })
        .onClick(() => {
          PromptDialogHelper.closeDialog()
        })
    }
    .width('100%')
    .height(75)
    .margin({ bottom: 30 })
    .justifyContent(FlexAlign.Center)

  }
  .width(700)
  .height(500)
  .justifyContent(FlexAlign.Center)
  .backgroundColor('#1A1A1A')
  .borderRadius(20)
}