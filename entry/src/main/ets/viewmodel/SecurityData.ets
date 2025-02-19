// 安防模式
export const SECURITY_MODE_TYPE = "1"

// 报警记录
export const ALARM_RECORD_TYPE = "2"

// 操作记录
export const OPERATE_RECORD_TYPE = "3"

@Observed
export class SecurityHomeLeftMenuItemData {
  type: string
  isSelect: boolean = false
  name: string
  imageSrc: ResourceStr

  constructor(
    type: string,
    isSelect: boolean,
    name: string,
    imageSrc: ResourceStr) {
    this.type = type
    this.isSelect = isSelect
    this.name = name
    this.imageSrc = imageSrc
  }
}

// 安防模式轮播图实体
export class SecurityModeBannerClass {
  id: string = '';
  types: SecurityModeItemType[]

  constructor(id: string, types: SecurityModeItemType[]) {
    this.id = id;
    this.types = types;
  }
}

// 安防模式Item实体
export class SecurityModeItemType {
  type: string = ""
  name: string
  imageSrc: ResourceStr

  constructor(
    mode: string,
    type: string,
    name: string,
    imageSrc: ResourceStr) {
    this.type = type
    this.name = name
    this.imageSrc = imageSrc
  }
}

// 在家撤防
export const SECURITY_AT_HOME_TYPE = "1"

// 外出布防
export const SECURITY_GO_OUT_TYPE = "2"

// 夜间布防
export const SECURITY_AT_NIGHT_TYPE = "3"

// 有线防区列表
export const wiredDefenseAreaList: SecurityModeItemType[] = [
  new SecurityModeItemType("1", "1", "紧急报警", $r('app.media.icon_safety_alarm_mode_item')),
  new SecurityModeItemType("1", "2", "火灾探测", $r('app.media.icon_safety_fire_mode_item')),
  new SecurityModeItemType("1", "3", "瓦斯探测", $r('app.media.icon_safety_gas_mode_item')),
  new SecurityModeItemType("1", "4", "大门入侵", $r('app.media.icon_safety_door_mode_item')),
  new SecurityModeItemType("1", "5", "客厅探测", $r('app.media.icon_safety_livingroom_mode_item')),
  new SecurityModeItemType("1", "6", "窗户1入侵", $r('app.media.icon_atnight_select')),
  new SecurityModeItemType("1", "7", "窗户2入侵", $r('app.media.icon_safety_leakage_mode_item')),
  new SecurityModeItemType("1", "8", "阳台入侵", $r('app.media.icon_safety_balcony_mode_item')),
]

// 无线防区列表
export const wirelessDefenseAreaList: SecurityModeItemType[] = [
  new SecurityModeItemType("2", "1", "紧急求救", $r('app.media.icon_safety_sos_mode_item')),
  new SecurityModeItemType("2", "2", "燃气探测", $r('app.media.icon_safety_coalgas_mode_item')),
  new SecurityModeItemType("2", "3", "烟雾报警", $r('app.media.icon_safety_smoke_mode_item')),
  new SecurityModeItemType("2", "4", "人体感应(室内)", $r('app.media.icon_safety_human_mode_item')),
  new SecurityModeItemType("2", "5", "人体感应(室内)", $r('app.media.icon_safety_human_mode_item')),
  new SecurityModeItemType("2", "6", "窗户1入侵", $r('app.media.icon_safety_doorcontact_mode_item')),
  new SecurityModeItemType("2", "7", "窗户2入侵", $r('app.media.icon_safety_water_mode_item')),
  new SecurityModeItemType("2", "8", "阳台入侵", $r('app.media.icon_safety_other_mode_item')),
]

// 报警记录实体
@Observed
export class SecurityAlarmRecordItemData {
  //报警类型
  alarmType: string
  //防区号
  zoneNum: string
  //防区类型
  probeType: string
  //记录的时间
  dateTime: string
  //是否已读
  isRead: boolean
  // 图标
  imageSrc:ResourceStr

  constructor(
    alarmType: string,
    zoneNum: string,
    probeType: string,
    dateTime: string,
    isRead: boolean,
    imageSrc:ResourceStr) {
    this.alarmType = alarmType
    this.zoneNum = zoneNum
    this.probeType = probeType
    this.dateTime = dateTime
    this.isRead = isRead
    this.imageSrc = imageSrc

  }
}

//
export const securityAlarmRecordList: SecurityAlarmRecordItemData[] = [
  new SecurityAlarmRecordItemData("触发报警","防区1","紧急求救","2023.06.01 14:00:17",false,$r('app.media.icon_safety_alarm_mode_item')),
  new SecurityAlarmRecordItemData("触发报警","防区1","紧急求救","2023.06.01 14:00:17",false,$r('app.media.icon_safety_fire_mode_item')),
  new SecurityAlarmRecordItemData("触发报警","防区1","紧急求救","2023.06.01 14:00:17",true,$r('app.media.icon_safety_gas_mode_item')),
  new SecurityAlarmRecordItemData("触发报警","防区1","紧急求救","2023.06.01 14:00:17",true,$r('app.media.icon_safety_door_mode_item')),
]

// 安防操作记录
@Observed
export class SecurityOperateRecordItemData {
  //操作类型
  operationType: string
  //操作源
  operationalSource: string
  //记录的时间
  dateTime: string
  // 图标
  imageSrc:ResourceStr

  constructor(
    operationType: string,
    operationalSource: string,
    dateTime: string,
    imageSrc:ResourceStr) {
    this.operationType = operationType
    this.operationalSource = operationalSource
    this.dateTime = dateTime
    this.imageSrc = imageSrc
  }
}

export const securityOperateRecordList: SecurityOperateRecordItemData[] = [
  new SecurityOperateRecordItemData("在家撤防","本机控制", "2023.06.01 14:00:17",$r('app.media.icon_athome_btn')),
  new SecurityOperateRecordItemData("外出布防","本机控制", "2023.06.01 14:00:17",$r('app.media.icon_goout_btn')),
  new SecurityOperateRecordItemData("夜间布防","本机控制", "2023.06.01 14:00:17",$r('app.media.icon_atnight_btn')),
]
