@Entry
@Component
struct ADPage {



  build() {
    // 广告页面
    Stack({alignContent:Alignment.TopEnd}){
      // 底部图片
      Image($r('app.media.ad'))

      // 跳过按钮
      Button('跳过 0 s').backgroundColor('#ff918e8e').fontSize(15)
        .height(30).margin({top:10,right:10})
    }
  }
}