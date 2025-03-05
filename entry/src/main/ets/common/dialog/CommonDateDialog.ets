import {
  DateTime,
  DateTimeFormat,
  DateTimePicker,
  DateTimePickerConfig,
  DateUtil,
  SuffixMode
} from '@xinyansoft/oh-date-picker'

/**
 * Icon+Text自定义弹窗
 */
@CustomDialog
export struct CommonDateDialog {
  controller?: CustomDialogController
  @Link currentDate:string
  @State config: DateTimePickerConfig = {
    format: DateTimeFormat.Ymd,
    start: '1900-01-01',
    end: '2099-12-31',
    selected: (this.currentDate=='')?DateUtil.getTodayStr('yyyy-MM-dd'):this.currentDate
  }
  @State suffixMode: SuffixMode = SuffixMode.Separated
  // @State selectedTime: DateTime = new DateTime(this.config.format, this.config.selected)


  build() {
    Column() {
      Text('时间设置')
        .fontColor('#ffffff')
        .fontSize(30)
        .margin({ top: 38 })

      DateTimePicker({
        config: this.config,
        suffixMode: this.suffixMode,
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
          //  this.selectedTime = selected
          this.currentDate=selected.format()
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
          .onClick(()=>{
            this.controller?.close()
          })

        Button('确定')
          .width(280)
          .height(75)
          .backgroundColor('#2495ff')
          .fontColor('#ffffff')
          .fontSize(28)
          .borderRadius(20)
          .margin({left:30})
          .onClick(()=>{
            this.controller?.close()
          })
      }
      .width('100%')
      .height(75)
      .margin({ bottom: 30 })
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#1A1A1A')
    .borderRadius(20)
  }
}