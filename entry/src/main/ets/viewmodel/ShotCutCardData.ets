// 首页Banner的Item数据结构
export class CardItemType {
  "type": string = ""
  "name": string
  "imageSrc": ResourceStr
  "urlpath": string
}

// 快捷键列表的Item数据结构
export class ShortCutItemType {
  "type": string = ""
  "name": string
  "imageSrc": ResourceStr
}

// 添加快捷select的实体
export class SelectShortCutItemData {
  "type": string = ""
  "name": string
  "isSelect": boolean
  "imageSrc": ResourceStr

  constructor(type: string,
    name: string,
    imageSrc: ResourceStr) {
    this.type = type
    this.imageSrc = imageSrc
    this.name = name
  }
}

// 安防
export const HOME_CARD_SAFETY_TYPE="1"
// 对讲
export const HOME_CARD_INTERCOM_TYPE="2"
// 预览
export const HOME_CARD_MONITOR_TYPE="3"
// 招梯
export const HOME_CARD_LADDER_TYPE="4"
// 留影留言
export const HOME_CARD_LYLY_MESSAGE_TYPE="5"
// 日历
export const HOME_CARD_CALENDAR_TYPE="6"
// 设置
export const HOME_CARD_SETTING_TYPE="7"
// 添加
export const HOME_CARD_ADD_TYPE="10"

// 首页Banner默认的卡片列表
export const CardTypeList: CardItemType[] = [
  {
    "type": HOME_CARD_SAFETY_TYPE,
    "name": "安防",
    "imageSrc": $r('app.media.icon_safety_athome'),
    "urlpath":"pages/SecurityHomePage"
  },
  {
    "type": HOME_CARD_INTERCOM_TYPE,
    "name": "对讲",
    "imageSrc": $r('app.media.icon_intercom'),
    "urlpath":"pages/IntercomHomePage"
  },
  {
    "type": HOME_CARD_MONITOR_TYPE,
    "name": "预览",
    "imageSrc": $r('app.media.icon_monitor'),
    "urlpath":""
  },
  {
    "type": HOME_CARD_LADDER_TYPE,
    "name": "招梯",
    "imageSrc": $r('app.media.icon_ladder'),
    "urlpath":""
  },
  {
    "type": HOME_CARD_LYLY_MESSAGE_TYPE,
    "name": "留影留言",
    "imageSrc": $r('app.media.icon_message'),
    "urlpath":""
  },
  {
    "type": HOME_CARD_CALENDAR_TYPE,
    "name": "日历",
    "imageSrc": $r('app.media.icon_calendar'),
    "urlpath":""
  },
  {
    "type": HOME_CARD_SETTING_TYPE,
    "name": "设置",
    "imageSrc": $r('app.media.icon_setting'),
    "urlpath":"pages/SettingHomePage"
  },
  {
    "type": HOME_CARD_ADD_TYPE,
    "name": "",
    "imageSrc": $r('app.media.icon_add'),
    "urlpath":""
  },

]

// 快捷卡片选择类型列表
export const ShortCutTypeList: ShortCutItemType[] = [

  {
    "type": "1",
    "name": "呼叫管理员",
    "imageSrc": $r('app.media.icon_callcenter_item')
  },
  {
    "type": "2",
    "name": "监视门前",
    "imageSrc": $r('app.media.icon_monitor_door_item')
  },
  {
    "type": "3",
    "name": "监视梯口",
    "imageSrc": $r('app.media.icon_monitor_ladder_item')
  },
  {
    "type": "4",
    "name": "监视区口",
    "imageSrc": $r('app.media.icon_monitor_classify_item')
  },
  {
    "type": "5",
    "name": "网络IPC",
    "imageSrc": $r('app.media.icon_ipc_item')
  },
  {
    "type": "6",
    "name": "安防报警",
    "imageSrc": $r('app.media.icon_s_alarm_item')
  },

]

// 添加快捷方式类型列表
export const ShortCutSelectTypeList: ShortCutItemType[] = [
  {
    "type": "1",
    "name": "管理员机",
    "imageSrc": $r('app.media.icon_callcenter_manager_select')
  },
  {
    "type": "2",
    "name": "区口机",
    "imageSrc": $r('app.media.icon_area_door_select')
  },
  {
    "type": "3",
    "name": "梯口机",
    "imageSrc": $r('app.media.icon_stair_door_select')
  },
  {
    "type": "4",
    "name": "门前机",
    "imageSrc": $r('app.media.icon_front_door_select')
  },
  {
    "type": "5",
    "name": "IPC",
    "imageSrc": $r('app.media.icon_ipc_select')
  },
  {
    "type": "6",
    "name": "安防报警",
    "imageSrc": ''
  },
]

// 添加快捷方式-安防类型列表
export const ShortCutAlarmTypeList: SelectShortCutItemData[] = [
  new SelectShortCutItemData("61","在家撤防",$r('app.media.icon_athome_select')),
  new SelectShortCutItemData("62","外出布防",$r('app.media.icon_goout_select')),
  new SelectShortCutItemData("63","在家撤防",$r('app.media.icon_atnight_select')),
]