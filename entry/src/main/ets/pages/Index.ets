import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import Home from './Home'
import Profile from './Profile'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  @State message: string = 'Hello World'

  @Builder TabBuilder(index: number, name: string) {
    Stack() {
      Text(name)
        .fontColor(this.currentIndex === index ? Color.Red : Color.Gray)
        .fontSize(16)
        .padding(10)
    }
  }

  @Builder CenterIconBuilder() {
    Stack() {
      Image($r('app.media.icon'))
    }.onClick(() => {
      promptAction.showToast({message: '发布。。。'})
    })
  }

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End
      }) {
        TabContent() {
          Home()
        }.tabBar(this.TabBuilder(0, '首页'))

        TabContent() {
          Row().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(this.TabBuilder(1, '购物'))

        TabContent() {
          Row().width('100%').height('100%').backgroundColor(Color.Grey)
        }.tabBar(this.CenterIconBuilder())

        TabContent() {
          Row().width('100%').height('100%').backgroundColor(Color.Yellow)
        }.tabBar(this.TabBuilder(2, '消息'))

        TabContent() {
          Profile()
        }.tabBar(this.TabBuilder(3, '我的'))
      }
      .width('100%')
      .onChange(index => {
        this.currentIndex = index
      })
    }.backgroundColor(Color.White)
  }

}