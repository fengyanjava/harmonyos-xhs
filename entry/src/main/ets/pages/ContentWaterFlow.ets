import getDataList from './ViewModel'
@Component
export default struct ContentWaterFlow {

  scroller?: Scroller = null

  onScrollFrameBegin?: (offset: number, state: ScrollState) => {
    offsetRemain: number;
  } = null

  build() {
    List({scroller: this.scroller, space: 10}) {
      ForEach(getDataList(), (item) => {
        ListItem() {
          Column() {
            Image(item.image)
              .width('100%')
              .aspectRatio(1)
            Text(item.text)
          }
        }
      })
    }
    .lanes(2)
    .edgeEffect(EdgeEffect.None)
    // .columnsTemplate('1fr 1fr')
    // .itemConstraintSize({
    //   minWidth: 0,
    //   maxWidth: '100%',
    //   minHeight: 0,
    //   maxHeight: '100%'
    // })
    // .columnsGap(10)
    // .rowsGap(10)
    .onScrollFrameBegin((offset, state) => {
      // console.log('feng scroll ----')
      return this.onScrollFrameBegin != null ? this.onScrollFrameBegin(offset, state) : {offsetRemain: offset}
    })
  }

  onFlowTouch(event: (TouchEvent) => void) {
    return this
  }
}