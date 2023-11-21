import ContentWaterFlow from './ContentWaterFlow'
import MyTabs from './MyTabs'
@Component
export default struct Home {

  private swiperController: SwiperController = new SwiperController()

  build() {
    Column() {
      Row() {
        Image('https://img-ucdn-static.helijia.com/zmw/upload/magic/images/original_90ffef49f6911ebaf0ceb21abd30a76d.png')
          .width(30).height(30).fillColor(Color.Black)
        MyTabs({texts: ['关注', '发现', '北京'], onChange: (index) => {
          this.swiperController.showNext()
        }})
        Image('https://img-ucdn-static.helijia.com/zmw/upload/magic/images/original_02f48ca23ba33d315218d38ba7d53ca9.png')
          .width(30).height(30)
      }.justifyContent(FlexAlign.SpaceBetween).width('100%')
      Swiper(this.swiperController) {
        ContentWaterFlow()
        ContentWaterFlow()
        ContentWaterFlow()
      }
    }.width('100%').padding({top: 30, bottom: 0})
  }
}