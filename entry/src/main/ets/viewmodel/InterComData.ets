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