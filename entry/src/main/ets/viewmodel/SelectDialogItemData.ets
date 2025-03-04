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
