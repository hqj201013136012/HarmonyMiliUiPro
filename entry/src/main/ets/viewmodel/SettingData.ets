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

// 设置列表Item类型枚举
export enum SetItemType { TitleText, SwitchItem, ArrowItem, ProcessItem }

export enum RadiusType { AllRad, NoneRad, TopRad, BottomRad }

// 设置Item数据实体
@ObservedV2
export class SetItemData {
  @Trace itemType: SetItemType
  @Trace name: string
  @Trace radType: RadiusType
  @Trace discribeStr: string
  @Trace swichStatus: boolean
  @Trace rightText: string
  @Trace isPaddingBot: boolean
  @Trace isShowDiv: boolean
  @Trace processValue: number

  constructor(
    itemType: SetItemType,
    name: string,
    radType: RadiusType = RadiusType.AllRad,
    isPaddingBot: boolean = false,
    isShowDiv: boolean = false,
    swichStatus: boolean = false,
    discribeStr: string = '',
    processValue: number = 0,
    rightText: string = '',) {
    this.itemType = itemType
    this.name = name
    this.radType = radType
    this.discribeStr = discribeStr
    this.swichStatus = swichStatus
    this.rightText = rightText
    this.isPaddingBot = isPaddingBot
    this.isShowDiv = isShowDiv
    this.processValue = processValue
  }
}

/**
 * 编辑屏保图片实体
 */
@ObservedV2
export class ScreenProPicItemData {
  picId: number
  @Trace imgRes: ResourceStr
  @Trace isCheck: boolean

  constructor(picId: number,
    isCheck: boolean,
    imgRes: ResourceStr
  ) {
    this.picId = picId
    this.isCheck = isCheck
    this.imgRes = imgRes
  }
}

// 编辑屏保图片列表
export const screenProPicList: ScreenProPicItemData[] = [
  new ScreenProPicItemData(1, false, $r('app.media.screen_pro_pic1')),
  new ScreenProPicItemData(2, false, $r('app.media.screen_pro_pic2')),
  new ScreenProPicItemData(3, false, $r('app.media.screen_pro_pic3')),
  new ScreenProPicItemData(4, false, $r('app.media.screen_pro_pic4')),
  new ScreenProPicItemData(5, false, $r('app.media.screen_pro_pic5')),
  new ScreenProPicItemData(6, false, $r('app.media.screen_pro_pic6')),
  new ScreenProPicItemData(7, false, $r('app.media.screen_pro_pic7')),
  new ScreenProPicItemData(8, false, $r('app.media.screen_pro_pic8')),
  new ScreenProPicItemData(9, false, $r('app.media.screen_pro_pic9')),
]
