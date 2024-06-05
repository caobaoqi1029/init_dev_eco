import { swiperList } from '../model/MusicConstants';
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



  build() {
    Column({space:10}){
      // 1. 搜索区域
      this.searchBuilder()
      // 2. 轮播图
      this.swiperBuilder()
      // 3. 每日推荐

      // 4. 推荐歌单

    }.width('100%').height('100%').padding(10).backgroundColor(Color.Black)
  }

}