import { SET_ENGINE_TYPE, SET_SECURITY_TYPE, SET_SYS_INFO_TYPE, SET_USER_TYPE } from "../../viewmodel/SettingData"
import { EngineeringSetList } from "./EngineeringSetList"
import { SecuritySetList } from "./SecuritySetList"
import { SystemInfoSetList } from "./SystemInfoSetList"
import { UserSetList } from "./UserSetList"

@Component
export struct SetHomeRightContent {
  @Prop menuType: string

  build() {
    Column() {
      if (this.menuType == SET_USER_TYPE) {
        UserSetList()
      } else if (this.menuType == SET_SECURITY_TYPE) {
        SecuritySetList()

      } else if (this.menuType == SET_ENGINE_TYPE) {
        EngineeringSetList()

      } else if (this.menuType == SET_SYS_INFO_TYPE) {
        SystemInfoSetList()
      }
    }

  }
}