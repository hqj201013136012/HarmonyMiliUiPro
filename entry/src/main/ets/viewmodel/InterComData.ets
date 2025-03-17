// 呼叫中心
export const CALL_CENTER_TYPE = "1"

// 呼叫住户
export const CALL_USER_TYPE = "2"

// 呼叫分机
export const CALL_EXTENSION_TYPE = "3"

// 通话记录
export const CALL_RECORD_TYPE = "4"

//
@ObservedV2
export class IntercomHomeLeftMenuItemData {
  type: string
  @Trace isSelect: boolean = false
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

// 全部
export const CALL_RECORD_ALL_TYPE = "0"

// 未接
export const CALL_RECORD_MISS_TYPE = "1"

// 呼入
export const CALL_RECORD_CALLIN_TYPE = "2"

// 呼出
export const CALL_RECORD_CALLOUT_TYPE = "3"

// 呼叫列表Item实体
@ObservedV2
export class CallRecordItemData {
  callType: string
  devNo: string
  devType: string
  callTime: string
  talkTime: string
  isRead: boolean
  imageSrc: ResourceStr

  constructor(
    callType: string,
    devNo: string,
    devType: string,
    callTime: string,
    talkTime: string,
    isRead: boolean,
    imageSrc: ResourceStr) {
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
  new CallRecordItemData(CALL_RECORD_MISS_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_call_missed')),
  new CallRecordItemData(CALL_RECORD_MISS_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_call_missed')),
]

// 呼入记录
export const callRecordCallInList: CallRecordItemData[] = [
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_incomingcall')),
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_incomingcall')),
  new CallRecordItemData(CALL_RECORD_CALLIN_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_incomingcall')),

]

// 呼出记录
export const callRecordCallOutList: CallRecordItemData[] = [
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", false,
    $r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_callup')),
  new CallRecordItemData(CALL_RECORD_CALLOUT_TYPE, "1栋1单元梯口机1", "1", "2023.06.01 14:00:17", "", true,
    $r('app.media.icon_callup')),
]

// 预览门前
export const MONITOR_DOOR_TYPE = "1"

// 预览梯口
export const MONITOR_LADDER_TYPE = "2"

// 预览区口
export const MONITOR_CLASSIFY_TYPE = "3"

// 预览IPC
export const MONITOR_IPC_TYPE = "4"

// 监视列表Item实体
@ObservedV2
export class MonitorDeviceItemData {
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

// 视频
export const LYLY_SNAP_VEDIO_TYPE = "1"

// 音频
export const LYLY_SNAP_AUDIO_TYPE = "2"

// 留影留言影音Item实体
@ObservedV2
export class LylyAudioItemData {
  // 默认为图片0，1为视频，2为音频
  snapType: string
  // 设备编号
  snapDevno: string
  //留影留言持续时长，最长30s
  snapDuration: string
  //通话时刻
  snapTime: string
  // 已读标记
  isRead: boolean
  imageSrc: ResourceStr

  constructor(
    snapType: string,
    snapDevno: string,
    snapDuration: string,
    snapTime: string,
    isRead: boolean,
    imageSrc: ResourceStr) {
    this.snapType = snapType
    this.snapDevno = snapDevno
    this.snapDuration = snapDuration
    this.snapTime = snapTime
    this.isRead = isRead
    this.imageSrc = imageSrc
  }
}

// 留影留言影音列表数据
export const lylyAudioDataList: LylyAudioItemData[] = [
  new LylyAudioItemData(LYLY_SNAP_VEDIO_TYPE, "区口机1", "01:00", "2023.06.01 14:00:17", false,
    $r('app.media.icon_lyly_play')),
  new LylyAudioItemData(LYLY_SNAP_AUDIO_TYPE, "区口机2", "01:00", "2023.06.01 14:00:17", false,
    $r('app.media.icon_lyly_voice')),
  new LylyAudioItemData(LYLY_SNAP_VEDIO_TYPE, "区口机1", "01:00", "2023.06.01 14:00:17", false,
    $r('app.media.icon_lyly_play')),
  new LylyAudioItemData(LYLY_SNAP_AUDIO_TYPE, "区口机2", "01:00", "2023.06.01 14:00:17", true,
    $r('app.media.icon_lyly_voice')),
  new LylyAudioItemData(LYLY_SNAP_VEDIO_TYPE, "区口机1", "01:00", "2023.06.01 14:00:17", true,
    $r('app.media.icon_lyly_play')),
  new LylyAudioItemData(LYLY_SNAP_AUDIO_TYPE, "区口机2", "01:00", "2023.06.01 14:00:17", true,
    $r('app.media.icon_lyly_voice')),
]

// 普通数字按键
export const CALL_KEY_BOARD_COMMON = 1
// 重播
export const CALL_KEY_BOARD_RE_DIAL = 2
// 拨号
export const CALL_KEY_BOARD_DIAL = 3
// 呼叫住户键盘种类实体
export class callRdBoardItemData {
  type: number = 0 // 1:普通数字按键，2：重播，3：拨号
  valueName: string

  constructor(type: number,
    valueName: string) {
    this.type = type
    this.valueName = valueName
  }
}


export const boardList: callRdBoardItemData[] = [
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "1"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "2"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "3"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "4"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "5"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "6"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "7"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "8"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "9"),
  new callRdBoardItemData(CALL_KEY_BOARD_RE_DIAL, "重播"),
  new callRdBoardItemData(CALL_KEY_BOARD_COMMON, "0"),
  new callRdBoardItemData(CALL_KEY_BOARD_DIAL, "拨号"),
]
