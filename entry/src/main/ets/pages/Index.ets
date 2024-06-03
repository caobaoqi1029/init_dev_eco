@Entry
@Component
struct Index {

  private tabsController : TabsController = new TabsController()
  @State currentIndex:number = 0;

  @Builder TabBuilder(title: string, targetIndex: number,img: Resource) {
    Column() {
      Image(img).width(25).margin({bottom:5}).fillColor(this.currentIndex === targetIndex ? '#ec5c87' : '#1698CE')
      Text(title).fontColor(this.currentIndex === targetIndex ? '#ec5c87' : '#1698CE')
    }
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }


  build() {
    Column(){
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          Text('推荐的内容').fontSize(30).fontColor(Color.White)
        }
        .backgroundColor(Color.Black).tabBar(this.TabBuilder('推荐',0,$r('app.media.ic_recommend')))

        TabContent() {
          Text('发现的内容').fontSize(30).fontColor(Color.White)
        }
        .backgroundColor(Color.Black).tabBar(this.TabBuilder('发现',1,$r('app.media.ic_find')))
        TabContent() {
          Text('音乐的内容').fontSize(30).fontColor(Color.White)
        }
        .backgroundColor(Color.Black).tabBar(this.TabBuilder('音乐',2,$r('app.media.ic_music')))
      }.backgroundColor('#ff353434')
      .onChange((index) => {
        // index 代表当前用户所点击的页面 id
        this.currentIndex = index
        console.log(this.currentIndex.toString())
      })
    }.width('100%').height('100%')

  }
}