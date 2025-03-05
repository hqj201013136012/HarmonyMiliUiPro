/**
 * 弹窗选择列表的Item实体
 */
@ObservedV2
export class SelectDialogItemData {
  @Trace itemName: string
  @Trace isSelect: boolean = false
  @Trace num: number

  constructor(
    itemName: string,
    isSelect: boolean = false,
    num: number = 0,) {
    this.itemName = itemName
    this.isSelect = isSelect
    this.num = num
  }
}

export const screenOffTimeList: SelectDialogItemData[] = [
  new SelectDialogItemData('无操作5分钟后',false,300),
  new SelectDialogItemData('无操作10分钟后',false,600),
  new SelectDialogItemData('无操作30分钟后',false,1800),
  new SelectDialogItemData('无操作1小时后',false,3600),
]

export const screenProTimeList: SelectDialogItemData[] = [
  new SelectDialogItemData('30秒',false,30),
  new SelectDialogItemData('1分钟',false,60),
  new SelectDialogItemData('30分钟',false,1800),
  new SelectDialogItemData('1小时',false,3600),
]

export const securityAppList: SelectDialogItemData[] = [
  new SelectDialogItemData('在家撤防',true),
  new SelectDialogItemData('外出布防',false),
  new SelectDialogItemData('夜间布防',false),
]

export const reFreqList: SelectDialogItemData[] = [
  new SelectDialogItemData('每日',true),
  new SelectDialogItemData('每周',false),
  new SelectDialogItemData('每月',false),
]

export const reDateList: SelectDialogItemData[] = [
  new SelectDialogItemData('星期一',true),
  new SelectDialogItemData('星期二',false),
  new SelectDialogItemData('星期三',false),
  new SelectDialogItemData('星期四',false),
  new SelectDialogItemData('星期五',false),
  new SelectDialogItemData('星期六',false),
  new SelectDialogItemData('星期日',false),
]

export const probeTypeList: SelectDialogItemData[] = [
  new SelectDialogItemData('紧急报警',true),
  new SelectDialogItemData('火灾探测',false),
  new SelectDialogItemData('瓦斯探测',false),
  new SelectDialogItemData('大门入侵',true),
  new SelectDialogItemData('客厅探测',false),
]


