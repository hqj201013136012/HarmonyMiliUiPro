import { ItemSetArrowView } from "../../itemview/ItemSetArrowView"
import { ComponentContent, router } from "@kit.ArkUI"
import { IPKeyboardBuilder } from "../../common/dialog/dialogview/IPKeyboardDialog";
import { PromptDialogHelper } from "../../common/helper/PromptDialogHelper";

@ComponentV2
export struct EngineeringSetList {
  private ctx: UIContext = this.getUIContext();
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(IPKeyboardBuilder));

  aboutToAppear(): void {
    PromptDialogHelper.setContext(this.ctx);
    PromptDialogHelper.setContentNode(this.contentNode);
    PromptDialogHelper.setOptions({ alignment: DialogAlignment.Center,onDidDisappear:()=>{
    }})
  }

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
            .onClick(()=>{
              router.pushUrl({
                url: "view/setting/SecurityParamPage",
              })
            })
          Divider().height(1).color('#262626').margin({ left: 48, right: 48 })
          ItemSetArrowView({ name: "防区设置" })
            .onClick(()=>{
              router.pushUrl({
                url: "view/setting/DefenceDetailSetPage",
              })
            })
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
          ItemSetArrowView({ name: "网络参数设置" })
            .onClick(()=>{
              PromptDialogHelper.openDialog()
            })
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