import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar';
import { ShortCutItemType, ShortCutTypeList } from '../viewmodel/ShotCutCardData';
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct ShotCutList {

  build() {
    RelativeContainer() {
      HeaderTitleBar({ title: '添加快捷方式' })

      List({ space: 20, initialIndex: 0 }) {
        ForEach(ShortCutTypeList, (item: ShortCutItemType) => {
          ListItem() {
            RelativeContainer() {
              Image(item.imageSrc)
                .width(50)
                .height(50)
                .margin({left:26})
                .alignRules({
                  center: { anchor: "__container__", align: VerticalAlign.Center },
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                })
                .id('icon_iv')

              Text(item.name)
                .fontSize(30)
                .fontColor($r('sys.color.white'))
                .margin({ left: 60 })
                .alignRules({
                  center: { anchor: "__container__", align: VerticalAlign.Center },
                  left: { anchor: "icon_iv", align: HorizontalAlign.End },
                })

              Image($r('app.media.icon_next'))
                .width(36)
                .height(36)
                .margin({right:58})
                .alignRules({
                  center: { anchor: "__container__", align: VerticalAlign.Center },
                  right: { anchor: "__container__", align: HorizontalAlign.End },
                })
            }
            .width('100%')
            .height('100%')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ShortCutSelect',
                params: { selectType: item.type }
              })
            })

          }
          .width('90%')
          .height(100)
          .borderRadius(12)
          .margin({left:52,right:52})
          .backgroundColor('#262626')
        })
      }
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .divider({ strokeWidth: 12, color: 0x00000000}) // 每行之间的分界线
      //.edgeEffect(EdgeEffect.Fade) // 边缘效果设置为Spring
      .width('100%')
      .backgroundColor(0x00000000)
      .margin({top:40})
      .alignRules({
        top: { anchor: "header_rl", align: VerticalAlign.Bottom },
        left:{ anchor: "__container__", align: HorizontalAlign.Start },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('sys.color.black'))
  }
}