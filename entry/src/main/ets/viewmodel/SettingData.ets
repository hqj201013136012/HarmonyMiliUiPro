// 用户设置
export const SET_USER_TYPE = "1"

// 安防设置
export const SET_SECURITY_TYPE = "2"

// 工程设置
export const SET_ENGINE_TYPE = "3"

// 系统信息
export const SET_SYS_INFO_TYPE = "4"

// 首页Banner的Item数据结构
@ObservedV2
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
