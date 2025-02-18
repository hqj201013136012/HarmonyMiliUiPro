import { ALARM_RECORD_TYPE, OPERATE_RECORD_TYPE, SECURITY_MODE_TYPE } from "../../viewmodel/SecurityData"
import { SecurityModeGridView } from "./SecurityModeGridView"

@Component
export struct SecurityHomeRightContent {
  @Prop menuType: string

  build() {
    Column() {
      if (this.menuType == SECURITY_MODE_TYPE) {
        SecurityModeGridView({type:this.menuType})
      } else if (this.menuType == ALARM_RECORD_TYPE) {


      } else if (this.menuType == OPERATE_RECORD_TYPE) {

      }
    }
  }
}