// Index.ets
import { ComponentContent } from '@kit.ArkUI';
import { ControlCenterView } from '../common/dialog/ControlCenterView';
import { PromptDialogHelper } from '../common/dialog/helper/PromptDialogHelper';

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
    PromptDialogHelper.setOptions({ alignment: DialogAlignment.Top,})
  }

  build() {
    Row() {
      Column() {
        Button("open dialog and update options")
          .margin({ top: 50 })
          .onClick(() => {
            PromptDialogHelper.openDialog()

            // setTimeout(() => {
            //   PromptDialogHelper.updateDialog({
            //     alignment: DialogAlignment.Bottom,
            //     offset: { dx: 0, dy: -50 }
            //   })
            // }, 1500)
          })
        Button("open dialog and update content")
          .margin({ top: 50 })
          .onClick(() => {
            PromptDialogHelper.openDialog()

            setTimeout(() => {
              this.contentNode.update(new Params('update'))
            }, 1500)
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}