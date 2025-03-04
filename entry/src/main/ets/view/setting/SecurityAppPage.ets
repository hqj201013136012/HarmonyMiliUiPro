import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

@Entry
@ComponentV2
struct SecurityAppPage {
  @Local mList: Array<SetItemData> = []

  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '启用安防预约', RadiusType.TopRad, false,true,true,'开启后，设置预约安防模式'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '预约类型', RadiusType.BottomRad, true, false, false,'',0,'在家撤防'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '重复频率', RadiusType.TopRad, false, true, false,'',0,'每周'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '重复日期', RadiusType.NoneRad, false, true, false,'',0,'星期一，星期二，星期六'))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '重复日期', RadiusType.BottomRad, false, false, false,'',0,'05:00'))

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