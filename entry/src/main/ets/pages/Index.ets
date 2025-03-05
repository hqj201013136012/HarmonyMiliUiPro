import { ControlCenterDialog } from '../common/dialog/ControlCenterDialog';
import { BannerCards } from '../view/launcher/BannerCards'
import { HomeMenu } from '../view/launcher/HomeMenu';
import { HomeStatus } from '../view/launcher/HomeStatus';
import { HomeTimeContent } from '../view/launcher/HomeTimeContent';
import { ComponentContent } from '@kit.ArkUI';
import { ControlCenterView } from '../common/dialog/ControlCenterView';
import { PromptDialogHelper } from '../common/dialog/helper/PromptDialogHelper';

@Entry
@ComponentV2
struct Index {

  @Local mDownY: number = 0
  @Local mMoveY: number = 0
  isShowWindow: boolean = false
  private ctx: UIContext = this.getUIContext();
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.ctx, wrapBuilder(ControlCenterView));
  // alertDialogController: CustomDialogController | null = new CustomDialogController({
  //   builder: ControlCenterDialog(),
  //   alignment:DialogAlignment.Top,
  //   width:'100%',
  //   height:288,
  //   cornerRadius:0,
  //   backgroundColor:'#00000000',
  //   // openAnimation: {
  //   //   duration: 500,
  //   //   delay: 500,
  //   //   playMode: PlayMode.Alternate,
  //   //   onFinish: () => {
  //   //     console.info('play end')
  //   //   }
  //   // },
  //   onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
  //     dismissDialogAction.dismiss()
  //     this.isShowWindow=false
  //   }
  // })

  aboutToAppear(): void {
    PromptDialogHelper.setContext(this.ctx);
    PromptDialogHelper.setContentNode(this.contentNode);
    PromptDialogHelper.setOptions({ alignment: DialogAlignment.Top,onDidDisappear:()=>{
      this.isShowWindow=false
    }})
  }

  build() {

    RelativeContainer() {
      // 状态栏左侧
      HomeStatus()

      // 首页时间组件
      HomeTimeContent()

      // 免打扰，紧急救援，呼叫中心
      HomeMenu()

      // 滑动卡片
      Column() {
        BannerCards()
          .width('100%')
          .height('100%')
      }
      .width('43%')
      .margin({ top: 20, right: 48 })
      .alignRules({
        top: { anchor: "status_bar", align: VerticalAlign.Bottom },
        right: { anchor: "__container__", align: HorizontalAlign.End },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0x000000)
    .onTouch((event?: TouchEvent) => {
      if (event) {
        if (event.type === TouchType.Down) {
          this.mDownY = event.touches[0].windowY

        }
        if (event.type === TouchType.Move) {
          this.mMoveY = event.touches[0].windowY
          if (this.mMoveY < 100 && (this.mMoveY - this.mDownY) > 30 && (!this.isShowWindow)) {
              this.isShowWindow = true
              console.log('showdialog')
              PromptDialogHelper.openDialog()
             // this.alertDialogController.open()


          }
        }
        if (event.type === TouchType.Up) {
          this.isShowWindow=false
        }

      }
    })
  }
}

