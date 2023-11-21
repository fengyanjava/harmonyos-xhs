import promptAction from '@ohos.promptAction'
import ContentWaterFlow from './ContentWaterFlow'
@Component
export default struct Profile {

  private scroller = new Scroller()
  private listScroller = new Scroller()

  private topViewArea?: Area = null

  aboutToAppear() {
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Column() {
          Row() {
            Image('https://sns-avatar-qc.xhscdn.com/avatar/5ef7746d0ab1b1000166a01c.jpg?imageView2/2/w/120/format/webp|imageMogr2/strip')
              .width(80).height(80).borderRadius(40)

            Column() {
              Text('momo').fontSize('18fp').fontColor(Color.White).fontWeight(FontWeight.Bold)
              Text('小红书号：fengyan').fontSize('12fp').fontColor(Color.White).margin({top: 10})
              Text('IP属地：北京').fontSize('12fp').fontColor(Color.White).margin({top: 3})
            }
            .alignItems(HorizontalAlign.Start)
            .margin({left: 15})
          }.width('100%')

          Text('我这个备注啥也没有啊。。。。').fontSize('14fp').fontColor(Color.White).margin({top: 10}).height(300)

        }
        .alignItems(HorizontalAlign.Start)
        .padding({top: 50, left: 15, right: 15, bottom: 15})
        .backgroundImage('https://img.36krcdn.com/hsossms/20231121/v2_01dc3e0423dd450790046b5c7b08787b@5091053_oswg166221oswg1053oswg495_img_jpg?x-oss-process=image/resize,m_mfit,w_600,h_400,limit_0/crop,w_600,h_400,g_center')
        .backgroundImageSize(ImageSize.Cover)
        .backdropBlur(10)
        .width('100%')
        .onAreaChange((_, newValue) => {
          this.topViewArea = newValue
        })

        Tabs() {
          TabContent() {
            ContentWaterFlow({
              scroller: this.listScroller,
              onScrollFrameBegin: (offset, _) => {
                const text = `${JSON.stringify(this.scroller.currentOffset())} --- ${this.topViewArea.height} --- ${offset}`
                console.log('feng currentOffset: ' + text)
                if (this.topViewArea != null) {
                  const { yOffset } = this.scroller.currentOffset()
                  if (yOffset < this.topViewArea.height) {
                    this.scroller.scrollBy(0, offset)
                    return {offsetRemain: 0}
                  }
                  const { yOffset: listYOffset } = this.listScroller.currentOffset()
                  console.log('feng listOffset: ' + listYOffset)
                  if (yOffset === this.topViewArea.height && offset < 0 && listYOffset <= 0) {
                    this.scroller.scrollBy(0, offset)
                    return {offsetRemain: 0}
                  }
                }
                return {
                  offsetRemain: offset
                }
              }
            })
          }.tabBar("笔记").height('100%')

          TabContent() {
            ContentWaterFlow()
          }.tabBar("收藏").height('100%')

          TabContent() {
            ContentWaterFlow()
          }.tabBar("点赞").height('100%')

        }.height('100%')
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
    // .onTouch(event => {
    //   // console.log('feng out touch: ' + event)
    // })
    // .onScrollFrameBegin((offset: number, state: ScrollState) => {
    //   console.log('feng out scroll:' + offset)
    //   return {offsetRemain: offset}
    // })
  }
}