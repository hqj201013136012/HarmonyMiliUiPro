// Index.ets
import { ComponentContent } from '@kit.ArkUI';
import { ControlCenterView } from '../common/dialog/dialogview/ControlCenterView';
import { kvManagerHelper, kvValueType } from '../common/helper/kvManagerHelper';
import { PromptDialogHelper } from '../common/helper/PromptDialogHelper';

class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text;
  }
}


@Entry
@Component
struct TestPage {
  @State message: string = "hello"
  private ctx: UIContext = this.getUIContext();
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(ControlCenterView));

  aboutToAppear(): void {
    PromptDialogHelper.setContext(this.ctx);
    PromptDialogHelper.setContentNode(this.contentNode);
    PromptDialogHelper.setOptions({ alignment: DialogAlignment.Top, })
  }

  build() {
    Row() {
      Column() {
        Button("open dialog and update options")
          .margin({ top: 50 })
          .onClick(() => {
            // PromptDialogHelper.openDialog()

            // setTimeout(() => {
            //   PromptDialogHelper.updateDialog({
            //     alignment: DialogAlignment.Bottom,
            //     offset: { dx: 0, dy: -50 }
            //   })
            // }, 1500)
             kvManagerHelper.getValue("testKey1",(dataValue:kvValueType)=>{
              console.log(`TestPage in getting data. Data:${dataValue}`);
            })

          })
        Button("open dialog and update content")
          .margin({ top: 50 })
          .onClick(() => {
            // PromptDialogHelper.openDialog()
            //
            // setTimeout(() => {
            //   this.contentNode.update(new Params('update'))
            // }, 1500)
            kvManagerHelper.putValue("testKey1","testValue1")
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}