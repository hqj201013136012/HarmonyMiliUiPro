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

