
@Observed
export class MessageItemData {
  //信息类型
  infoType: string
  //信息标题
  infoTitle: string
  //文字内容
  infoTextContent: string
  //信息发送时间
  infoTime: string
  //是否已读
  isRead: boolean
  // 图标
  imageSrc:ResourceStr
  constructor(
    infoType: string,
    infoTitle: string,
    infoTextContent: string,
    infoTime: string,
    isRead: boolean,
    imageSrc:ResourceStr) {
    this.infoType = infoType
    this.infoTitle = infoTitle
    this.infoTextContent = infoTextContent
    this.infoTime = infoTime
    this.isRead = isRead
    this.imageSrc = imageSrc
  }
}

export const messageRecordList: MessageItemData[] = [
  new MessageItemData("","下发设备111","这是一个文本内容说明","2023.06.01 14:00:17",false,$r('app.media.icon_message_pic')),
  new MessageItemData("","下发设备222","这是一个文本内容说明","2023.06.01 14:00:17",false,$r('app.media.icon_message_voice')),
  new MessageItemData("","下发设备333","这是一个文本内容说明","2023.06.01 14:00:17",false,$r('app.media.icon_message_information')),
  new MessageItemData("","下发设备111","这是一个文本内容说明","2023.06.01 14:00:17",false,$r('app.media.icon_message_pic')),
  new MessageItemData("","下发设备222","这是一个文本内容说明","2023.06.01 14:00:17",true,$r('app.media.icon_message_voice')),
  new MessageItemData("","下发设备333","这是一个文本内容说明","2023.06.01 14:00:17",true,$r('app.media.icon_message_information')),
  new MessageItemData("","下发设备111","这是一个文本内容说明","2023.06.01 14:00:17",true,$r('app.media.icon_message_pic')),
  new MessageItemData("","下发设备222","这是一个文本内容说明","2023.06.01 14:00:17",true,$r('app.media.icon_message_voice')),
  new MessageItemData("","下发设备333","这是一个文本内容说明","2023.06.01 14:00:17",true,$r('app.media.icon_message_information')),

]