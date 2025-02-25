import { it } from "@ohos/hypium"
import { Type } from "@kit.ArkUI"

// 首页Banner的Item数据结构
@ObservedV2
export class HomeCardItemEntity {
  type: string=''
  name: string=''
  itemId: string=''
  imageSrc: ResourceStr=''
  urlpath: string=''

  // constructor(
  //   type: string,
  //   name: string,
  //   itemId: string,
  //   imageSrc: ResourceStr,
  //   urlpath: string) {
  //   this.type = type
  //   this.name = name
  //   this.itemId = itemId
  //   this.imageSrc = imageSrc
  //   this.urlpath = urlpath
  // }
  setData(
    type: string,
    name: string,
    itemId: string,
    imageSrc: ResourceStr,
    urlpath: string) {
    this.type = type
    this.name = name
    this.itemId = itemId
    this.imageSrc = imageSrc
    this.urlpath = urlpath
  }
}

// 定义数据结构
@ObservedV2
export class BannerClass {
  id: string = '';
  @Trace types: HomeCardItemEntity[]

  constructor(id: string, types: HomeCardItemEntity[]) {
    this.id = id;
    this.types = types;
  }
}

// 快捷键列表的Item数据结构
export class ShortCutItemEntity {
  type: string
  name: string
  imageSrc: ResourceStr
  itemId: string
  itemName: string
  itemRes: ResourceStr

  // constructor(
  //   type: string,
  //   name: string,
  //   imageSrc: ResourceStr) {
  //   this.type = type
  //   this.name = name
  //   this.imageSrc = imageSrc
  // }

  constructor(
    type: string,
    name: string,
    imageSrc: ResourceStr,
    itemId: string,
    itemName: string,
    itemRes: ResourceStr
  ) {
    this.type = type
    this.name = name
    this.imageSrc = imageSrc
    this.itemId = itemId
    this.itemName = itemName
    this.itemRes = itemRes
  }
}

// 添加快捷select的实体
@ObservedV2
export class SelectShortCutItemEntity {
  @Trace isSelect: boolean = false
  @Trace cardBean: HomeCardItemEntity

  constructor(cardBean: HomeCardItemEntity) {
    this.cardBean = cardBean
  }
}

// 安防
export const HOME_CARD_SAFETY_TYPE = "1"

// 对讲
export const HOME_CARD_INTERCOM_TYPE = "2"

// 预览
export const HOME_CARD_MONITOR_TYPE = "3"

// 招梯
export const HOME_CARD_LADDER_TYPE = "4"

// 留影留言
export const HOME_CARD_LYLY_MESSAGE_TYPE = "5"

// 日历
export const HOME_CARD_CALENDAR_TYPE = "6"

// 信息
export const HOME_CARD_MESSAGE_TYPE = "7"

// 设置
export const HOME_CARD_SETTING_TYPE = "8"

// 添加
export const HOME_CARD_ADD_TYPE = "10"

// 首页Banner默认的卡片列表
// export const defaultCardTypeList: HomeCardItemEntity[] = [
//   new HomeCardItemEntity(HOME_CARD_SAFETY_TYPE, "安防", '', $r('app.media.icon_safety_athome'),
//     "pages/SecurityHomePage"),
//   new HomeCardItemEntity(HOME_CARD_INTERCOM_TYPE, "对讲", '', $r('app.media.icon_intercom'), "pages/IntercomHomePage"),
//   new HomeCardItemEntity(HOME_CARD_MONITOR_TYPE, "预览", '', $r('app.media.icon_monitor'), "pages/MonitorHomePage"),
//   new HomeCardItemEntity(HOME_CARD_LADDER_TYPE, "招梯", '', $r('app.media.icon_ladder'), ""),
//   new HomeCardItemEntity(HOME_CARD_LYLY_MESSAGE_TYPE, '留影留言', "", $r('app.media.icon_message'),
//     "pages/LylyHomePage"),
//   new HomeCardItemEntity(HOME_CARD_CALENDAR_TYPE, "日历", '', $r('app.media.icon_calendar'), ""),
//   new HomeCardItemEntity(HOME_CARD_MESSAGE_TYPE, "信息", '', $r('app.media.icon_message'), "pages/MessageListPage"),
//   new HomeCardItemEntity(HOME_CARD_SETTING_TYPE, "设置", '', $r('app.media.icon_setting'), "pages/SettingHomePage"),
//   new HomeCardItemEntity(HOME_CARD_ADD_TYPE, "", '', $r('app.media.icon_add'), "pages/ShotCutList"),
// ]

export function getDefaultCardTypeList(): HomeCardItemEntity[] {
  let defaultCardTypeList: HomeCardItemEntity[] = []
  let item1 = new HomeCardItemEntity()
  let item2 = new HomeCardItemEntity()
  let item3 = new HomeCardItemEntity()
  let item4 = new HomeCardItemEntity()
  let item5 = new HomeCardItemEntity()
  let item6 = new HomeCardItemEntity()
  let item7 = new HomeCardItemEntity()
  let item8 = new HomeCardItemEntity()
  let item9 = new HomeCardItemEntity()

  item1.setData(HOME_CARD_SAFETY_TYPE, "安防", '', $r('app.media.icon_safety_athome'),
    "pages/SecurityHomePage");
  item2.setData(HOME_CARD_INTERCOM_TYPE, "对讲", '', $r('app.media.icon_intercom'), "pages/IntercomHomePage");
  item3.setData(HOME_CARD_MONITOR_TYPE, "预览", '', $r('app.media.icon_monitor'), "pages/MonitorHomePage");
  item4.setData(HOME_CARD_LADDER_TYPE, "招梯", '', $r('app.media.icon_ladder'), "");
  item5.setData(HOME_CARD_LYLY_MESSAGE_TYPE, '留影留言', "", $r('app.media.icon_message'), "pages/LylyHomePage");
  item6.setData(HOME_CARD_CALENDAR_TYPE, "日历", '', $r('app.media.icon_calendar'), "");
  item7.setData(HOME_CARD_MESSAGE_TYPE, "信息", '', $r('app.media.icon_message'), "pages/MessageListPage");
  item8.setData(HOME_CARD_SETTING_TYPE, "设置", '', $r('app.media.icon_setting'), "pages/SettingHomePage");
//  item9.setData(HOME_CARD_ADD_TYPE, "", '', $r('app.media.icon_add'), "pages/ShotCutList");
  defaultCardTypeList.push(item1)
  defaultCardTypeList.push(item2)
  defaultCardTypeList.push(item3)
  defaultCardTypeList.push(item4)
  defaultCardTypeList.push(item5)
  defaultCardTypeList.push(item6)
  defaultCardTypeList.push(item7)
  defaultCardTypeList.push(item8)
 // defaultCardTypeList.push(item9)
  return defaultCardTypeList
}

// 添加的快捷卡片
export const addCardTypeList: HomeCardItemEntity[] = []

// 管理机
export const SHORT_CUT_CALLCENTER_ADD_TYPE = "11"

// 门前机
export const SHORT_CUT_DOOR_ADD_TYPE = "12"

// 梯口
export const SHORT_CUT_LADDER_ADD_TYPE = "13"

// 区口
export const SHORT_CUT_CLASSIFY_ADD_TYPE = "14"

// IPC
export const SHORT_CUT_IPC_ADD_TYPE = "15"

// 安防报警
export const SHORT_CUT_ALARM_ADD_TYPE = "16"

// 快捷卡片选择类型列表
export const ShortCutTypeList: ShortCutItemEntity[] = [
  new ShortCutItemEntity(SHORT_CUT_CALLCENTER_ADD_TYPE, "呼叫管理员", $r('app.media.icon_callcenter_item'), '',
    '管理员机', $r('app.media.icon_callcenter_manager_select')),
  new ShortCutItemEntity(SHORT_CUT_DOOR_ADD_TYPE, "监视门前", $r('app.media.icon_monitor_door_item'), '', '门前机',
    $r('app.media.icon_front_door_select')),
  new ShortCutItemEntity(SHORT_CUT_LADDER_ADD_TYPE, "监视梯口", $r('app.media.icon_monitor_ladder_item'), '', '梯口机',
    $r('app.media.icon_stair_door_select')),
  new ShortCutItemEntity(SHORT_CUT_CLASSIFY_ADD_TYPE, "监视区口", $r('app.media.icon_monitor_classify_item'), '',
    '区口机', $r('app.media.icon_area_door_select')),
  new ShortCutItemEntity(SHORT_CUT_IPC_ADD_TYPE, "网络IPC", $r('app.media.icon_ipc_item'), '', 'IPC',
    $r('app.media.icon_ipc_select')),
  new ShortCutItemEntity(SHORT_CUT_ALARM_ADD_TYPE, "安防报警", $r('app.media.icon_s_alarm_item'), '', '安防报警', ''),

]

// 添加快捷方式类型列表
// export const ShortCutSelectTypeList: ShortCutItemEntity[] = [
//   new ShortCutItemEntity("1", "管理员机", $r('app.media.icon_callcenter_manager_select')),
//   new ShortCutItemEntity("2", "区口机", $r('app.media.icon_area_door_select')),
//   new ShortCutItemEntity("3", "梯口机", $r('app.media.icon_stair_door_select')),
//   new ShortCutItemEntity("4", "门前机", $r('app.media.icon_front_door_select')),
//   new ShortCutItemEntity("5", "IPC", $r('app.media.icon_ipc_select')),
//   new ShortCutItemEntity("6", "安防报警", ''),
//
// ]

// 在家撤防
export const SHORT_CUT_ALARM_ATHOME_TYPE = "1"

// 外出布防
export const SHORT_CUT_ALARM_GOOUT_TYPE = "2"

// 夜间布防
export const SHORT_CUT_ALARM_ATNIGHT_TYPE = "3"

// 添加快捷方式-安防类型列表
// export const ShortCutAlarmTypeList: SelectShortCutItemEntity[] = [
//   new SelectShortCutItemEntity(new HomeCardItemEntity(SHORT_CUT_ALARM_ATHOME_TYPE, '在家撤防', '',
//     $r('app.media.icon_athome_select'), '')),
//   new SelectShortCutItemEntity(new HomeCardItemEntity(SHORT_CUT_ALARM_GOOUT_TYPE, '外出布防', '',
//     $r('app.media.icon_goout_select'), '')),
//   new SelectShortCutItemEntity(new HomeCardItemEntity(SHORT_CUT_ALARM_ATNIGHT_TYPE, '夜间布防', '',
//     $r('app.media.icon_atnight_select'), '')),
// ]

export function getShortCutAlarmTypeList(): SelectShortCutItemEntity[] {
  let shortCutAlarmTypeList: SelectShortCutItemEntity[] = []
  let item1 = new HomeCardItemEntity()
  let item2 = new HomeCardItemEntity()
  let item3 = new HomeCardItemEntity()
  item1.setData(SHORT_CUT_ALARM_ADD_TYPE, '在家撤防', SHORT_CUT_ALARM_ATHOME_TYPE,
    $r('app.media.icon_athome_select'), '');
  item2.setData(SHORT_CUT_ALARM_ADD_TYPE, '外出布防', SHORT_CUT_ALARM_GOOUT_TYPE,
    $r('app.media.icon_goout_select'), '');
  item3.setData(SHORT_CUT_ALARM_ADD_TYPE, '夜间布防', SHORT_CUT_ALARM_ATNIGHT_TYPE,
    $r('app.media.icon_atnight_select'), '');

  shortCutAlarmTypeList.push( new SelectShortCutItemEntity(item1))
  shortCutAlarmTypeList.push( new SelectShortCutItemEntity(item2))
  shortCutAlarmTypeList.push( new SelectShortCutItemEntity(item3))
  return shortCutAlarmTypeList
}

// @ObservedV2
// export class HomeCardItemPtEntity {
//   type: string = ''
//   name: string = ''
//   itemId: string = ''
//   imageSrc: ResourceStr = ''
//   urlpath: string = ''
//
//   setData(
//     type: string,
//     name: string,
//     itemId: string,
//     imageSrc: ResourceStr,
//     urlpath: string) {
//     this.type = type
//     this.name = name
//     this.itemId = itemId
//     this.imageSrc = imageSrc
//     this.urlpath = urlpath
//   }
// }

// 快捷键添加保存PersistenceV2实体
@ObservedV2
export class EditHomeCardListData {
  // @Type(HomeCardItemEntity)
  // @Trace addList: HomeCardItemEntity[]=[]

  @Trace dataStr:string=''

  // constructor(
  //   addList: HomeCardItemEntity[]) {
  //   this.addList = addList
  // }
}



