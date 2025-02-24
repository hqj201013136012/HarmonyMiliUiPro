import { ALARM_RECORD_TYPE, OPERATE_RECORD_TYPE, SECURITY_MODE_TYPE } from "../../viewmodel/SecurityData"
import { SecurityAlarmRecordList } from "./SecurityAlarmRecordList"
import { SecurityModeGridView } from "./SecurityModeGridView"
import { SecurityOperateRecordList } from "./SecurityOperateRecordList"

@ComponentV2
export struct SecurityHomeRightContent {
  @Require @Param menuType: string

  build() {
    Column() {
      if (this.menuType == SECURITY_MODE_TYPE) {
        SecurityModeGridView({type:this.menuType})
      } else if (this.menuType == ALARM_RECORD_TYPE) {
        SecurityAlarmRecordList({type:this.menuType})
      } else if (this.menuType == OPERATE_RECORD_TYPE) {
        SecurityOperateRecordList({type:this.menuType})
      }
    }
  }
}