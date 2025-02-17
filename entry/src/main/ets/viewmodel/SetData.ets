// 用户设置
export const SET_USER_TYPE = "1"

// 安防设置
export const SET_SECURITY_TYPE = "2"

// 工程设置
export const SET_ENGINE_TYPE = "3"

// 系统信息
export const SET_SYS_INFO_TYPE = "4"

// 首页Banner的Item数据结构
@Observed
export class SetHomeLeftMenuItemData {
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

export const SetHomeLeftMenuList: SetHomeLeftMenuItemData[] = [
  new SetHomeLeftMenuItemData(SET_USER_TYPE,
    true,
    false,
    false,
    "用户设置",
    $r('app.media.icon_s_leftmenu_usersetting')),
  new SetHomeLeftMenuItemData(SET_SECURITY_TYPE,
    false,
    false,
    false,
    "安防设置",
    $r('app.media.icon_leftmenu_safetysetting')),
  new SetHomeLeftMenuItemData(SET_ENGINE_TYPE,
    false,
    false,
    false,
    "工程设置",
    $r('app.media.icon_leftmenu_engine_set')),
  new SetHomeLeftMenuItemData(SET_SYS_INFO_TYPE,
    false,
    false,
    false,
    "系统信息",
    $r('app.media.icon_leftmenu_systeminfo')),

]