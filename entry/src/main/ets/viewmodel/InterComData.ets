// 呼叫中心
export const CALL_CENTER_TYPE = "1"

// 呼叫住户
export const CALL_USER_TYPE = "2"

// 呼叫分机
export const CALL_EXTENSION_TYPE = "3"

// 通话记录
export const CALL_RECORD_TYPE = "4"

//
@Observed
export class IntercomHomeLeftMenuItemData {
  type: string
  isSelect: boolean = false
  isTop: boolean = false
  isBottom: boolean = false
  name: string
  imageSrc: ResourceStr

  constructor(
    type: string,
    isSelect: boolean,
    isTop: boolean,
    isBottom: boolean,
    name: string,
    imageSrc: ResourceStr) {
    this.type = type
    this.isSelect = isSelect
    this.isTop = isTop
    this.isBottom = isBottom
    this.name = name
    this.imageSrc = imageSrc
  }
}

// 呼叫列表Item实体
export class CallListItemData {
  type: string = ""
  name: string
  imageSrc: ResourceStr

  constructor(type: string,
    name: string,
    imageSrc: ResourceStr) {
    this.type = type
    this.imageSrc = imageSrc
    this.name = name
  }
}

// 未接
export const CALL_RECORD_MISS_TYPE = "1"
// 呼入
export const CALL_RECORD_CALLIN_TYPE = "2"
// 呼出
export const CALL_RECORD_CALLOUT_TYPE = "3"
// 呼叫列表Item实体
@Observed
export class CallRecordItemData {
  callType: string
  devNo: string
  devType: string
  callTime: string
  talkTime: string
  isRead: boolean
  imageSrc:ResourceStr

  constructor(
    callType: string,
    devNo: string,
    devType: string,
    callTime: string,
    talkTime: string,
    isRead: boolean,
  imageSrc:ResourceStr) {
    this.callType = callType
    this.devNo = devNo
    this.devType = devType
    this.callTime = callTime
    this.talkTime = talkTime
    this.isRead = isRead
    this.imageSrc = imageSrc
  }
}

// 未接记录
export const callRecordMissList: CallRecordItemData[] = [
  new CallRecordItemData(CALL_RECORD_MISS_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_call_missed')),
]

// 呼入记录
export const callRecordCallInList: CallRecordItemData[] = [
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_incomingcall')),
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_incomingcall')),
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_incomingcall')),

]

// 呼出记录
export const callRecordCallOutList: CallRecordItemData[] = [
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",false,$r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE,"1栋1单元梯口机1","1","2023.06.01 14:00:17","",true,$r('app.media.icon_callup')),
]
