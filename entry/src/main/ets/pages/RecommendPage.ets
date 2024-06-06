import { recommendListType, recommendListTypeModel } from '../model/Music'
import { dailyRecommend, recommendList, swiperList } from '../model/MusicConstants'
// @ts-ignore
import { recommendDailyType } from '../model/MusicConstants'

@Entry
@Component
export struct RecommendPage {
  @Builder
  searchBuilder() {
    Row() {
      Image($r('app.media.ic_search'))
        .width(25)
        .fillColor(Color.Gray)


      Text('只因你太美🔥')
        .fontColor(Color.Gray)
        .layoutWeight(1)

      Image($r('app.media.ic_code'))
        .width(25)
        .fillColor(Color.Gray)

    }
    .padding({ left: 12, right: 12 })
    .width('100%')
    .height(42)
    .backgroundColor('#ff292929')
    .borderRadius(60)
  }

  @Builder
  swiperBuilder() {
    Swiper() {
      ForEach(swiperList, (item: string) => {
        Image(item)
          .width('100%')
      })
    }
    .loop(true)
    .autoPlay(true)
    .interval(3000)
    .borderRadius(10)
    .indicatorStyle({
      selectedColor: Color.White
    })
  }

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
              .padding({ top: 10, bottom: 10, left: 5, right: 5 })
              .maxLines(2) //设置最大显示行数为2行
              .textOverflow({ overflow: TextOverflow.Ellipsis }) //文字超出2行则使用...替代
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

  @Builder
  musicBuider() {
    Scroll() {
      Row({space:10}) {
        ForEach(recommendList, (item: recommendListType) => {
          Column({ space: 10 }) {
            Stack({ alignContent: Alignment.TopStart }) {
              Image(item.img)
                .width('100%') // 这个不能省，如果省略会导致Scroll出问题

              Text(item.count)
                .fontColor(Color.White)
                .margin(10)
                .fontSize(12)
                .fontWeight(800)
            }

            Text(item.title)
              .fontColor(Color.White)
              .fontSize(12)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width('30%')
        })
      }
    }
    .scrollable(ScrollDirection.Horizontal)
  }

  build() {
    Column({ space: 20 }) {
      //   1. 搜索区域
      this.searchBuilder()

      //   2. 轮播图
      this.swiperBuilder()

      //   3. 每日推荐
      this.titleBuilder('每日推荐', '更多...')
      // 每日推荐内容显示
      this.recommendBuilder()

      //   4. 推荐歌单
      this.titleBuilder('推荐歌单', '更多...')
      this.musicBuider()

    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor(Color.Black)
  }
}
