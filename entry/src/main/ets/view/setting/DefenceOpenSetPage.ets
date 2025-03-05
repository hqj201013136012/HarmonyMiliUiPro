import { ItemSetCommonView } from '../../itemview/ItemSetCommonView'
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData'
import { HeaderTitleBar } from '../launcher/HeaderTitleBar'

@Entry
@ComponentV2
struct DefenceOpenSetPage {
  @Local mList: Array<SetItemData> = []

  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '防区1——紧急报警', RadiusType.AllRad, true, false))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '防区2——火灾探测', RadiusType.AllRad, true, false))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '防区3——瓦斯探测', RadiusType.AllRad, true, false))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '防区4——大门入侵', RadiusType.AllRad, true, false))


  }

  build() {
    Column() {
      HeaderTitleBar({ title: "防区启用设置" })
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