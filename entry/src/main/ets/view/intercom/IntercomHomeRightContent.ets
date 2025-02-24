import { CALL_CENTER_TYPE, CALL_EXTENSION_TYPE, CALL_RECORD_TYPE, CALL_USER_TYPE } from "../../viewmodel/InterComData"
import { CallCenterList } from "./CallCenterList"
import { CallExtensionList } from "./CallExtensionList"
import { CallRecordClassify } from "./CallRecordClassify"


@ComponentV2
export struct IntercomHomeRightContent {
  @Require @Param menuType: string

  build() {
    Column() {
      if (this.menuType == CALL_CENTER_TYPE) {
        CallCenterList({type:this.menuType})

      } else if (this.menuType == CALL_USER_TYPE) {


      } else if (this.menuType == CALL_EXTENSION_TYPE) {
        CallExtensionList({type :this.menuType})

      } else if (this.menuType == CALL_RECORD_TYPE) {
        CallRecordClassify({type :this.menuType})
      }
    }

  }
}