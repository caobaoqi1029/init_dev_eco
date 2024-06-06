import { recommendDailyType } from '../model/Music';
import { dailyRecommend, swiperList } from '../model/MusicConstants';
@Entry
@Component
export struct RecommendPage {
  private swiperController: SwiperController = new SwiperController()
  private swiperList = swiperList;

  /**
   * 搜索框
   */
  @Builder searchBuilder(){
   Row(){
      Image($r('app.media.ic_search')).width(25).fillColor(Color.Gray)
      Text('只因你太美 🔥').layoutWeight(1)
     Image($r('app.media.ic_code')).width(25).fillColor(Color.Gray)

   }.width('100%').height('42').padding({left:12,right:12})
   .backgroundColor('#ff4f4d4d').borderRadius(60)
  }

  /**
   * 轮播图
   */
  @Builder swiperBuilder(){
      Row(){
        Swiper(this.swiperController) {
            ForEach(this.swiperList, (item: string, index: number) => {
                Image(item)
            })
          }.width('100%').height('25%')
        .borderRadius(20)
        .autoPlay(true)
        .interval(1000)
        .indicatorStyle({
          selectedColor: Color.White
        })
      }
  }

  /**
   * 标题 Builder
   * @param title 标题
   * @param rightText 标题文本
   */
  @Builder
  titleBuilder(title: string, rightText: string) {
    Row() {
      Text(title)
        .fontColor(Color.White)
      Text(rightText)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  /**
   * 每日推荐 Builder
   */
  @Builder
  recommendBuilder() {
    Scroll() {
      Row({ space: 10 }) {
        ForEach(dailyRecommend, (item: recommendDailyType) => {
          Column() {
            Text(item.type)
              .fontColor(Color.White)
              .fontWeight(800)
              .fontSize(16)
              .backgroundColor(item.top)
              .width('100%')
              .padding({ top: 10, bottom: 10 })

            Image(item.img)

            Text(item.title)
              .fontColor(Color.White)
              .backgroundColor(item.bottom)
              .fontSize(14)
              .padding({ top: 10, bottom: 10,left:5,right:5 })
          }
          .height(120)
          .width('40%')
        })
      }
      .margin({ top: -100 }) //用来修复Scroll自动将里面的内容往下留白的问题
      .height(120)
    }
    .height(240)
    .scrollable(ScrollDirection.Horizontal) //设置水平滚动
  }



  build() {
    Column({space:10}){
      // 1. 搜索区域
      this.searchBuilder()
      // 2. 轮播图
      this.swiperBuilder()
      // 3. 每日推荐
      this.titleBuilder('每日推荐', '更多...')
      this.recommendBuilder()
      // 4. 推荐歌单

    }.width('100%').height('100%').padding(10).backgroundColor(Color.Black)
  }

}