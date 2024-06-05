import { musicList, songItemType } from '../model/SongModel';
import { AvPlayerManager } from '../services/AvPlayerManager';

@Entry
@Component
export struct FindPage {
  private musicList = musicList;
  @State isPlaying: boolean = false // 是否处于播放状态 false 为播放 true 表示播放中
  @State currentIndex: number = -1 // 当前播放歌曲 index 默认为 -1 表示没有播放
  @State currentMusic: songItemType = null // 当前播放歌曲
  @State totalTime: number = 0 // 表示歌曲总时长
  @State currentTime: number = 0 // 表示歌曲当前播放的时长

  /**
   * Music 页面创建时初始化 AvPlayer 对象
   */
  async aboutToAppear() {
    await AvPlayerManager.init()
    // 获取当前歌曲的相关信息
    await this.onTime()
  }

  /**
   * 获取当前歌曲相关信息
   */
  async onTime() {
    // durationUpdate 表示获取歌曲总时长
    AvPlayerManager.AvPlayer.on('durationUpdate', (time) => {
      this.totalTime = time
    })
    // timeUpdate 表示当前歌曲播放的时长
    AvPlayerManager.AvPlayer.on('timeUpdate', (time) => {
      this.currentTime = time
    })
  }

  @Builder maybeLikeListBuilder() {
    List({ space: 10 }) {
      ForEach(this.musicList, (item: songItemType, index: number) => {
        ListItem() {
          Row() {
            Row() {
              Image(item.img)
                .width(40)
                .height(40)
                .margin(10)
                .borderRadius(8)
              Column({ space: 5 }) {
                Text(item.name).fontSize(20).fontColor(Color.White).width('100%').fontWeight(600)
                Text(item.author).fontSize(14).fontColor(Color.White).width('100%').fontWeight(500)
              }
            }.layoutWeight(1).onClick(() => {
              // 播放歌曲
              AvPlayerManager.playMusic(item)
              // 将当前播放 index 赋值
              this.currentIndex = index
              this.currentMusic = musicList[this.currentIndex]
              this.isPlaying = true
            })
          }
          .width('100%') // 将 Text('' + item.id).fontSize(20).fontColor(Color.White) 置于容器左边，一般是在父容器 添加 .width('100%')
        }
      }, item => item.id)
      ListItem() {
        Text('已经到底了').fontColor(Color.Gray).width('100%').textAlign(TextAlign.Center)
      }.padding({ bottom: 20 })
    }.width('100%').height('100%')
    .divider({
      strokeWidth: 1,
      startMargin: 60,
      endMargin: 10,
      color: '#ffe9f0f0'
    }).scrollBar(BarState.Auto)
  }

  build() {
    Column() {
      // 先外再里 先上后下 先左后后
      Text('猜你喜欢').padding(15).fontColor('#ec5c87').fontWeight(800).width('100%').fontSize(30)
      this.maybeLikeListBuilder()
    }.width('100%').backgroundColor('#ff2b2a2a').layoutWeight(2) //表示你要占整个屏幕的多少
  }
}