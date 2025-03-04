import { CommonSelectListDialog } from '../../common/dialog/CommonSelectListDialog'
import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { ItemSetSwitchView } from '../../itemview/ItemSetSwitchView'
import { screenOffTimeList, screenProTimeList, SelectDialogItemData } from '../../viewmodel/SelectDialogItemData'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'
import { router } from '@kit.ArkUI'

/**
 * 个性化设置
 */
@Entry
@ComponentV2
struct PersonalListPage {
  @Local recordList: Array<SetItemData> = []
  @Local screenOffTimes: Array<SelectDialogItemData> = screenOffTimeList
  @Local screenProTimes: Array<SelectDialogItemData> = screenProTimeList
  // 息屏时间选择弹窗
  screenOffTimeDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'自动息屏',
      selectList: this.screenOffTimes
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 544,
  })
  // 屏保时间选择弹窗
  screenProTimeDialogController: CustomDialogController | null = new CustomDialogController({
    builder: CommonSelectListDialog({
      title:'屏保',
      selectList: this.screenProTimes
    }),
    alignment: DialogAlignment.Center,
    width: 770,
    height: 544,
  })

  aboutToAppear(): void {
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '自动息屏', RadiusType.AllRad, true))
    this.recordList.push(new SetItemData(SetItemType.SwitchItem, '屏保', RadiusType.TopRad, false, true, true,
      '开启后，根据设置的时间会进入屏保模式',))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '设置屏保图片', RadiusType.NoneRad, false, true))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '进入屏保时间', RadiusType.BottomRad, true, true))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '设置背景图片', RadiusType.AllRad, true))
    this.recordList.push(new SetItemData(SetItemType.ProcessItem, '亮度设置', RadiusType.AllRad, true, false, false, '',
      40))
    this.recordList.push(new SetItemData(SetItemType.ProcessItem, '铃声音量', RadiusType.TopRad, false, true, false, '',
      50))
    this.recordList.push(new SetItemData(SetItemType.ProcessItem, '通话音量', RadiusType.NoneRad, false, true, false,
      '', 60))
    this.recordList.push(new SetItemData(SetItemType.ProcessItem, '触摸按键音', RadiusType.BottomRad, false, false,
      false, '', 60))
    this.recordList.push(new SetItemData(SetItemType.TitleText, '铃声设置'))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '来电铃声', RadiusType.TopRad, false, true))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '预警提示音', RadiusType.NoneRad, false, true))
    this.recordList.push(new SetItemData(SetItemType.ArrowItem, '留言提示音', RadiusType.BottomRad, true, false))
  }

  build() {
    Column() {
      HeaderTitleBar({ title: "个性化设置" })

      Column() {
        List() {
          ForEach(this.recordList, (item: SetItemData) => {
            ListItem() {
              ItemSetCommonView({ itemData: item })
                .onClick(() => {
                  switch (item.name) {
                    case '自动息屏':
                      this.screenOffTimeDialogController?.open()
                      break
                    case '设置屏保图片':
                      console.log('ScreenProPicEditPage')
                      router.pushUrl({
                        url: "view/setting/ScreenProPicEditPage",
                      })
                      break
                    case '进入屏保时间':
                      this.screenProTimeDialogController?.open()
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
