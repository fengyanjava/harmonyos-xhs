@Component
export default struct MyTabs {

  private texts: string[] = []
  @State private index: number = 1

  onChange = (index: number) => {}

  build() {
    Row() {
      ForEach(this.texts, (item, index) => {
        Text(item)
          .fontColor(this.index === index ? Color.Red : Color.Black)
          .padding(10)
          .onClick(() => {
            this.index = index
            this.onChange(index)
          })
      })
    }
  }
}