import { ItemSetArrowView } from "../../itemview/ItemSetArrowView"

@Component
export struct EngineeringSetList {
  build() {
    Scroll() {
      Column() {

        ItemSetArrowView({ name: "修改工程密码" })

        Text('防区属性设置')
          .padding({ left: 45, top: 28, bottom: 15 })
          .fontColor('#ffffff')
          .fontSize(30)
          .width('100%')

        Column() {
          ItemSetArrowView({ name: "安防参数" })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "防区设置" })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)

        Text('外部设备设置')
          .padding({ left: 45, top: 28, bottom: 15 })
          .fontColor('#ffffff')
          .fontSize(30)
          .width('100%')

        Column() {
          ItemSetArrowView({ name: "网络门前机" })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "网络IPC" })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)

        Text('本机参数设置')
          .padding({ left: 45, top: 28, bottom: 15 })
          .fontColor('#ffffff')
          .fontSize(30)
          .width('100%')

        Column() {
          ItemSetArrowView({ name: "网络门前机" })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "设备编号设置" })
        }
        .backgroundColor('#1A1A1A')
        .borderRadius(12)

        ItemSetArrowView({ name: "恢复出厂设置" })
          .margin({ top: 24 })

      }
    }
    .padding({ left: 48, right: 48 })
  }
}