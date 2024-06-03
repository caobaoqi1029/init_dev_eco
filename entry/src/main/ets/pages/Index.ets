@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column(){
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Text('推荐的内容').fontSize(30).fontColor(Color.White)
        }
        .backgroundColor(Color.Black).tabBar('推荐')

        TabContent() {
          Text('发现的内容').fontSize(30).fontColor(Color.White)
        }
        .backgroundColor(Color.Black).tabBar('发现')
      }.backgroundColor('#ff353434')
    }.width('100%').height('100%')

  }
}