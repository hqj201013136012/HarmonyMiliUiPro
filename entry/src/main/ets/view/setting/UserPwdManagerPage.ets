import { ItemSetCommonView } from '../../itemview/ItemSetCommonView';
import { RadiusType, SetItemData, SetItemType } from '../../viewmodel/SettingData';
import { HeaderTitleBar } from '../launcher/HeaderTitleBar';

@Entry
@ComponentV2
struct UserPwdManagerPage {
  @Local mList: Array<SetItemData> = []

  aboutToAppear(): void {
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '修改用户密码', RadiusType.AllRad, true))
    this.mList.push(new SetItemData(SetItemType.SwitchItem, '启用家政密码', RadiusType.TopRad, false, true, true))
    this.mList.push(new SetItemData(SetItemType.ArrowItem, '家政密码设置', RadiusType.BottomRad))

  }

  build() {
    Column() {
      HeaderTitleBar({ title: "用户密码管理" })
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