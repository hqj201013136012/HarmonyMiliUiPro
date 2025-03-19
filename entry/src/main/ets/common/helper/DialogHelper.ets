/*
 * Copyright (C) 2024 桃花镇童长老 @pura/harmony-dialog
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BaseSheetOptions } from "../dialog/base/BaseSheetOptions";
import { ComponentContent } from "@kit.ArkUI";


/**
 * TODO Dialog帮助工具类（全局自定义弹框，不依赖UI组件）
 * author: 桃花镇童长老ᥫ᭡
 * since: 2024/08/01
 * 仓库主页：https://ohpm.openharmony.cn/#/cn/detail/@pura%2Fharmony-dialog
 * github: https://github.com/787107497
 * gitee: https://gitee.com/tongyuyan/harmony-utils
 * QQ交流群: 1029219059
 */
export class DialogHelper {

  /**
   * 显示自定义半模态
   * @param wrappedBuilder 自定义半模态中显示的组件内容
   * @param options
   * @returns
   */
  static showBindSheet<T extends BaseSheetOptions>(wrappedBuilder: WrappedBuilder<[T]>, options: T) {
    DialogHelper.initBindSheetDefault(options);
    if(options.uiContext){
      const componentContent = new ComponentContent(options.uiContext, wrappedBuilder, options);
      options.uiContext.openBindSheet(componentContent, options);
    }
  }

  /**
   * 初始化BaseSheetOptions参数
   * @param options
   */
  private static initBindSheetDefault(options: BaseSheetOptions) {
    options.uiContext = options.uiContext ;
    if (options.title) { //有标题，默认显示关闭图标
      options.showClose = options.showClose ?? true; //是否显示关闭图标，默认显示。
    } else { //有标题，默认不显示关闭图标
      options.showClose = options.showClose ?? false; //是否显示关闭图标，默认显示。
    }
    //半模态高度，默认是FIT_CONTENT。MEDIUM-指定半模态高度为屏幕高度一半。LARGE-指定半模态高度几乎为屏幕高度。FIT_CONTENT-指定半模态高度为适应内容的高度。
    options.height = options.height ?? SheetSize.FIT_CONTENT;
    //设置半模态页面的宽度。百分比参数方式：以父元素宽的百分比来设置半模态页面的宽度。
    options.width = options.width ?? '100%';
    //设置半模态页面的显示层级。默认值：SheetMode.OVERLAY。
    options.mode = options.mode ?? SheetMode.OVERLAY;
    //半模态页面的样式。BOTTOM-底部弹窗。CENTER-居中弹窗。POPUP-跟手弹窗。跟手弹窗面板不支持跟手滑动，下滑面板不关闭。
    options.preferType = options.preferType ?? SheetType.BOTTOM;
    //是否显示控制条。半模态面板的detents属性设置多个不同高度并且设置生效时，默认显示控制条。否则不显示控制条。
    options.dragBar = options.dragBar ?? true;
    //半模态所在页面是否允许交互。设置为true时允许交互，不显示蒙层；设置为false时不允许交互，显示蒙层；若不进行设置，默认底部弹窗与居中弹窗不允许交互，跟手弹窗允许交互。当设置为true时，maskColor设置无效。
    options.enableOutsideInteractive = options.enableOutsideInteractive ?? false;
    //设置半模态面板滑动时，内容区域刷新时机。默认值：ScrollSizeMode.FOLLOW_DETENT。
    options.scrollSizeMode = options.scrollSizeMode ?? ScrollSizeMode.FOLLOW_DETENT;
    //半模态面板的模糊背景。默认无模糊背景。
    options.blurStyle = options.blurStyle ?? BlurStyle.COMPONENT_ULTRA_THICK;
    //半模态页面的背景蒙层颜色。
    options.maskColor = options.maskColor ?? 0x33000000;
    //设置半模态页面的边框宽度。可分别设置4个边框宽度。默认值：0。百分比参数方式：以父元素半模态页面宽的百分比来设置半模态页面的边框宽度。当半模态页面左边框和右边框大于半模态页面宽度，半模态页面上边框和下边框大于半模态页面高度，显示可能不符合预期。
    options.borderWidth = options.borderWidth ?? 0;
    //设置半模态页面的边框颜色。默认值：Color.Black。如果使用borderColor属性，需要和borderWidth属性一起使用。说明：底部弹窗时，底部边框颜色设置无效。
    options.borderColor = options.borderColor ?? Color.Black;
    //设置半模态页面的边框样式。默认值：BorderStyle.Solid。如果使用borderStyle属性，需要和borderWidth属性一起使用。说明：底部弹窗时，底部边框样式设置无效。
    options.borderStyle = options.borderStyle ?? BorderStyle.Solid;
  }
}