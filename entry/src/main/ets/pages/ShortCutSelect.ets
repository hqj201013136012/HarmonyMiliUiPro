import { HeaderTitleBar } from '../view/launcher/HeaderTitleBar'
import { PersistenceV2, router } from '@kit.ArkUI';
import {
  EditHomeCardListData,
  getShortCutAlarmTypeList,
  HomeCardItemEntity,
  SelectShortCutItemEntity,
  ShortCutTypeList,
  SHORT_CUT_ALARM_ADD_TYPE,
  SHORT_CUT_ALARM_ATHOME_TYPE
} from '../viewmodel/ShotCutCardData';
import { ShortCutSelectItem } from '../itemview/ShortCutSelectItem';
import { HOME_SHORT_CUT_CARD_PT_KEY } from '../viewmodel/PtConstants';

@Entry
@ComponentV2
struct ShortCutSelect {
  @Local paramsFromIndex: object = router.getParams()
  @Local type: string = ''
  @Local selectList: Array<SelectShortCutItemEntity> = []
  @Local homeAddCardsData: EditHomeCardListData =
    PersistenceV2.connect(EditHomeCardListData, HOME_SHORT_CUT_CARD_PT_KEY, () => new EditHomeCardListData())!;
  // 文件缓存获取已添加的快捷列表
  @Local addList: HomeCardItemEntity[] = []

  aboutToAppear(): void {
    if (this.homeAddCardsData.dataStr != '') {
      this.addList = JSON.parse(this.homeAddCardsData.dataStr) as HomeCardItemEntity[]
    }
    console.log("homeAddCardsData ShortCutSelect datastr= " + this.homeAddCardsData.dataStr)
    console.log("homeAddCardsData ShortCutSelect aboutToAppear= " + this.addList.length)
    this.type = this.paramsFromIndex['selectType'];
    console.log("type = " + this.type)
    let itemName = ''
    let imgRes: ResourceStr = ''
    for (let index = 0; index < ShortCutTypeList.length; index++) {
      if (ShortCutTypeList[index].type == this.type) {
        itemName = ShortCutTypeList[index].itemName
        imgRes = ShortCutTypeList[index].itemRes
      }
    }
    // 安防报警的
    if (this.type == SHORT_CUT_ALARM_ADD_TYPE) {
      let tempList = getShortCutAlarmTypeList()
      for (let index = 0; index < tempList.length; index++) {
        let isAdd = false
        this.addList.forEach(element => {
          // 已经添加过的过滤掉
          if (element.type == this.type && element.itemId == index.toString()) {
            isAdd = true
          }
        });
        // 是否添加过判断
        if (!isAdd) {
          this.selectList.push(tempList[index])
        }
      }
    }
    // 其他的快捷方式
    else {
      for (let index = 0; index < 8; index++) {
        let isAdd = false
        this.addList.forEach(element => {
          // 已经添加过的过滤掉
          if (element.type == this.type && element.itemId == index.toString()) {
            isAdd = true
          }
        });
        // 是否添加过判断
        if (!isAdd) {
          let itemData = new HomeCardItemEntity
          itemData.setData(this.type, itemName + index, index.toString(), imgRes, '')
          this.selectList.push(new SelectShortCutItemEntity(itemData))
        }
      }
    }
  }

  build() {
    RelativeContainer() {
      // 表标题栏
      HeaderTitleBar({
        title: '添加快捷方式',
        isShowRightText: true,
        rightText: '添加',
        rightClick: () => {
          this.selectList.forEach(element => {
            if (element.isSelect) {
              if (this.addList.includes(element.cardBean)) {
                console.log("homeAddCardsData ShortCutSelect is add")
              } else {
                this.addList.push(element.cardBean)
                console.log("homeAddCardsData ShortCutSelect push " + element.cardBean)

              }
            }
          });

          // 文件存储保存
          this.homeAddCardsData.dataStr = JSON.stringify(this.addList)
          PersistenceV2.save(HOME_SHORT_CUT_CARD_PT_KEY);
          console.log("homeAddCardsData ShortCutSelect = " + this.addList.length)
          console.log("homeAddCardsData ShortCutSelect = data" + this.homeAddCardsData.dataStr)
          router.back()
        }
      })

      Column() {
        Grid() {
          ForEach(this.selectList, (item: SelectShortCutItemEntity) => {
            GridItem() {
              ShortCutSelectItem({
                itemData: item, changeIsSelect: (val: boolean) => {
                  console.log("homeAddCardsData ShortCutSelect val " +val)
                  console.log("homeAddCardsData ShortCutSelect selectList1 isSelect = " +this.selectList[0].isSelect)
                  this.selectList.forEach(element=>{
                    if(element.cardBean.itemId==item.cardBean.itemId){
                      element.isSelect=val
                    }
                  })
                  console.log("homeAddCardsData ShortCutSelect selectList2 isSelect = " +this.selectList[0].isSelect)
                }
              })
            }
            .height("100%")
            .width('100%')
            .borderRadius(20)
            .backgroundColor('#1A1A1A')
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(30)
        .rowsGap(30)
        .width('100%')
        .backgroundColor(0x00000000)
        .margin({ bottom: 48 })
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        })
      }
      .margin({ left: 48, right: 48, top: 40 })
      .alignRules({
        top: { anchor: "header_rl", align: VerticalAlign.Bottom },
        bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start }
      })

    }
    .height('100%')
    .width('100%')
    .backgroundColor($r('sys.color.black'))
  }
}