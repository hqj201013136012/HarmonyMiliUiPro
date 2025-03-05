import { CommonDateAndTimeDialog } from '../../common/dialog/CommonDateAndTimeDialog'
import { ItemSetArrowView } from '../../itemview/ItemSetArrowView'
import { ItemSetSwitchView } from '../../itemview/ItemSetSwitchView'
import { ItemSetTextView } from '../../itemview/ItemSetTextView'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

import {
  DateTimeFormat,
  DateTimePicker,
  DateTimePickerConfig,
  DateUtil,
  SuffixMode
} from '@xinyansoft/oh-date-picker'
import { ComponentContent } from '@kit.ArkUI'
import { CommonDateAndTimeView, DateAndTimeParams } from '../../common/dialog/dialogview/CommonDateAndTimeView'
import { PromptDialogHelper } from '../../common/dialog/helper/PromptDialogHelper'

/**
 * 时间设置页面
 */
@Entry
@Component
struct TimeSetPage {
  @State currentTimeStr: string = DateUtil.getTodayStr('yyyy-MM-dd HH:mm')
  @State currentDateStr: string = "2023-10-31"
  dateAndTimeDialog: CustomDialogController | null = new CustomDialogController({
    builder: CommonDateAndTimeDialog({ currentDate: this.currentTimeStr }),
    alignment: DialogAlignment.Center,
    width: 700,
    height: 500,
  })
  private ctx: UIContext = this.getUIContext();
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(CommonDateAndTimeView),
      new DateAndTimeParams(this.currentDateStr, DateTimeFormat.Ymd, (data: string) => {
        this.currentDateStr = data
      }));

  aboutToAppear(): void {
    PromptDialogHelper.setContext(this.ctx);
    PromptDialogHelper.setContentNode(this.contentNode);
    PromptDialogHelper.setOptions({ alignment: DialogAlignment.Center })
  }

  build() {
    Column() {
      HeaderTitleBar({ title: "时间设置" })
      Column() {
        ItemSetSwitchView({ name: "开启免打扰", discribeStr: '开启后，新消息将不会进行铃声提醒', swichStatus: true })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "时间设置", rightText: this.currentTimeStr })
          .onClick(() => {
            if (this.dateAndTimeDialog != undefined) {
              this.dateAndTimeDialog.open()
            }
          })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "时区设置", rightText: "北京/中国" })
        Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
        ItemSetArrowView({ name: "选择日期格式", rightText: this.currentDateStr })
          .onClick(() => {
            PromptDialogHelper.openDialog()
          })
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