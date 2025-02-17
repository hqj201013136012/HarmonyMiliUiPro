import { SET_ENGINE_TYPE, SET_SECURITY_TYPE, SET_SYS_INFO_TYPE, SET_USER_TYPE } from "../viewmodel/SetData"
import { UserSetList } from "./UserSetList"

@Component
export struct SetHomeRightContent {
  @Prop menuType: string

  build() {
    Column() {
      if (this.menuType == SET_USER_TYPE) {
        UserSetList()
      } else if (this.menuType == SET_SECURITY_TYPE) {

      } else if (this.menuType == SET_ENGINE_TYPE) {

      } else if (this.menuType == SET_SYS_INFO_TYPE) {

      }
    }

  }
}