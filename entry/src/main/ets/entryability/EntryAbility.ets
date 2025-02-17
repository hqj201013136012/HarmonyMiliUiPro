import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');

      let windowClass: window.Window = windowStage.getMainWindowSync(); // 获取应用主窗口
      // 1. 设置窗口全屏
      let isLayoutFullScreen = true;
      windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
        console.info('Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the window layout to full-screen mode. Code is ${err.code}, message is ${err.message}`);
      });

     // 2. 设置状态栏隐藏
      windowClass.setSpecificSystemBarEnabled('status', false).then(() => {
        console.info('Succeeded in setting the status bar to be invisible.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the status bar to be invisible. Code is ${err.code}, message is ${err.message}`);
      });
     // 2. 设置导航条隐藏
      windowClass.setSpecificSystemBarEnabled('navigationIndicator', false).then(() => {
        console.info('Succeeded in setting the navigation indicator to be invisible.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the navigation indicator to be invisible. Code is ${err.code}, message is ${err.message}`);
      });

      AppStorage.setOrCreate('date', getCurrentDateAndWeekday());

      setInterval(()=>{
        let time: string = new Date().toLocaleTimeString();
        const currentDate = new Date();
        const hour = currentDate.getHours();
        const mins = currentDate.getMinutes();

        if (hour <= 12) {
          AppStorage.setOrCreate('time_stage', '上午');
        } else {
          AppStorage.setOrCreate('time_stage', '下午');
        }
        AppStorage.setOrCreate('time', hour+":"+mins);

      },1000)

    });

  }


  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

function getCurrentDateAndWeekday():string {
  // 获取当前日期和时间
  const now = new Date();

  // 获取星期几，Date.getDay()返回的是0（周日）到6（周六）之间的数字
  const weekday = now.getDay();
  let weekdayName:string='';

  // 转换为星期的中文名称
  switch (weekday) {
    case 0: weekdayName = "星期日"; break;
    case 1: weekdayName = "星期一"; break;
    case 2: weekdayName = "星期二"; break;
    case 3: weekdayName = "星期三"; break;
    case 4: weekdayName = "星期四"; break;
    case 5: weekdayName = "星期五"; break;
    case 6: weekdayName = "星期六"; break;
  }

  // 获取日期的其他部分，如年、月、日
  const year = now.getFullYear();
  const month = now.getMonth() + 1; // 月份是从0开始的，所以要加1
  const date = now.getDate();

  // 返回当前日期和星期几的字符串表示
  return `${month}月${date}日 ${weekdayName}`;
}

