import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, promptAction } from '@kit.ArkUI';
import { UIContext } from '@ohos.arkui.UIContext';

export class PromptDialogHelper {
  static ctx: UIContext;
  static contentNode: ComponentContent<Object>;
  static options: promptAction.BaseDialogOptions={ alignment: DialogAlignment.Center};

  static setContext(context: UIContext) {
    PromptDialogHelper.ctx = context;
  }

  static setContentNode(node: ComponentContent<Object>) {
    PromptDialogHelper.contentNode = node;
  }

  static setOptions(options: promptAction.BaseDialogOptions) {
    PromptDialogHelper.options = options;
  }

  static init(context: UIContext,node: ComponentContent<Object>,options: promptAction.BaseDialogOptions){
    PromptDialogHelper.ctx = context;
    PromptDialogHelper.contentNode = node;
    PromptDialogHelper.options = options;
  }

  static openDialog() {
    if (PromptDialogHelper.contentNode !== null) {
      PromptDialogHelper.ctx.getPromptAction().openCustomDialog(PromptDialogHelper.contentNode, PromptDialogHelper.options)
        .then(() => {
          console.info('OpenCustomDialog complete.')
        })
        .catch((error: BusinessError) => {
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  static closeDialog() {
    if (PromptDialogHelper.contentNode !== null) {
      PromptDialogHelper.ctx.getPromptAction().closeCustomDialog(PromptDialogHelper.contentNode)
        .then(() => {
          console.info('CloseCustomDialog complete.')
        })
        .catch((error: BusinessError) => {
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          console.error(`CloseCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  static updateDialog(options: promptAction.BaseDialogOptions) {
    if (PromptDialogHelper.contentNode !== null) {
      PromptDialogHelper.ctx.getPromptAction().updateCustomDialog(PromptDialogHelper.contentNode, options)
        .then(() => {
          console.info('UpdateCustomDialog complete.')
        })
        .catch((error: BusinessError) => {
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          console.error(`UpdateCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }
}