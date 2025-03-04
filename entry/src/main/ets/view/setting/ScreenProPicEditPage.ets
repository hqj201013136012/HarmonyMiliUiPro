import { ScreenProPicItemData, screenProPicList } from '../../viewmodel/SettingData';
import { HeaderTitleBar } from '../launcher/HeaderTitleBar';
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ScreenProPicEditPage {
  @Local mList: Array<ScreenProPicItemData> = screenProPicList

  build() {
    Column() {
      HeaderTitleBar({
        title: "个性化设置",
        isShowRightText: true,
        rightText: '设为屏保',
        rightClick: () => {
          router.back()
        }
      })
      Column() {
        Grid() {
          ForEach(this.mList, (item: ScreenProPicItemData) => {
            GridItem() {
              Column() {
                Image(item.imgRes)
                  .width('100%')
                  .height('100%')
              }
              .backgroundColor(item.isCheck ? '#2495FF' : '#D9D9D9')
              .padding(2)
            }
            .height("100%")
            .width('100%')
            .onClick(() => {
              this.mList.forEach(element => {
                element.isCheck = false
              })
              item.isCheck = true
            })
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .columnsGap(36)
        .rowsGap(32)
        .width('100%')
      }
      .padding({
        left: 52,
        right: 52,
        top: 52,
        bottom: 80
      })
      .layoutWeight(1)

    }
    .backgroundColor('#000000')
  }
}