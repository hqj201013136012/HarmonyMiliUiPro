// 首页Banner的Item数据结构
export class CardItemType {
  "type": string = ""
  "name": string
  "imageSrc": ResourceStr
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

// 首页Banner默认的卡片列表
export const CardTypeList: CardItemType[] = [
  {
    "type": "1",
    "name": "安防",
    "imageSrc": $r('app.media.icon_safety_athome')
  },
  {
    "type": "2",
    "name": "对讲",
    "imageSrc": $r('app.media.icon_intercom')
  },
  {
    "type": "3",
    "name": "预览",
    "imageSrc": $r('app.media.icon_monitor')
  },
  {
    "type": "4",
    "name": "招梯",
    "imageSrc": $r('app.media.icon_ladder')
  },
  {
    "type": "5",
    "name": "留影留言",
    "imageSrc": $r('app.media.icon_message')
  },
  {
    "type": "6",
    "name": "日历",
    "imageSrc": $r('app.media.icon_calendar')
  },
  {
    "type": "7",
    "name": "设置",
    "imageSrc": $r('app.media.icon_setting')
  },
  {
    "type": "10",
    "name": "",
    "imageSrc": $r('app.media.icon_add')
  },

]

// 快捷卡片选择类型列表
export const ShortCutTypeList: ShortCutItemType[] = [
  {
    "type": "6",
    "name": "安防报警",
    "imageSrc": $r('app.media.icon_s_alarm_item')
  },
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
  // {
  //   "type": "61",
  //   "name": "在家撤防",
  //   "isSelect":false,
  //   "imageSrc": $r('app.media.icon_athome_select')
  // },
  // {
  //   "type": "62",
  //   "name": "外出布防",
  //   "isSelect":false,
  //   "imageSrc": $r('app.media.icon_goout_select')
  // },
  // {
  //   "type": "63",
  //   "name": "夜间布防",
  //   "isSelect":false,
  //   "imageSrc": $r('app.media.icon_atnight_select')
  // },

]