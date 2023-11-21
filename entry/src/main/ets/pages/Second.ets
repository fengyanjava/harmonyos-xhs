import router from '@ohos.router'
@Entry
@Component
struct Second {
  message: string = 'Hi there'
  @State count: number = 1;
  name: string = router.getParams()['productName']

  onPageShow() {

  }

  aboutToAppear() {

  }

  build() {

    Row() {
      Column() {
        Text(`${this.message}\n${this.name}\n${this.count}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Back')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 15
        })
        .backgroundColor(Color.Yellow)
        .width('40%')
        .padding({
          top: 10,
          bottom: 10
        })
        .onClick(() => {
          console.log('back click')
          this.count++;
          // this.count = this.count + 1;
          // router.back()
        })
      }
      .width('100%')
    }
    // .justifyContent(FlexAlign.Center)
    .height('100%')
  }
}