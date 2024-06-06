import SongTable from '../db/SongTable';
import Song from '../model/Song';
import { musicList, songItemType } from '../model/SongModel';
import { AvPlayerManager } from '../services/AvPlayerManagerV2';
import { LogUtils } from '../utils/LogUtils';

@Entry
@Component
export struct FindPage {
  @State musicList: Array<Song> = []
  private songTable: SongTable = new SongTable(() => {
  })
  @State isPlaying: boolean = false // 是否处于播放状态 false 为播放 true 表示播放中
  @State currentIndex: number = -1 // 当前播放歌曲 index 默认为 -1 表示没有播放
  @State currentMusic: songItemType = null // 当前播放歌曲
  @State totalTime: number = 0 // 表示歌曲总时长
  @State currentTime: number = 0 // 表示歌曲当前播放的时长

  /**
   * Music 页面创建时初始化 AvPlayer 对象
   */
  async aboutToAppear() {
    this.songTable.getRdbStore(() => {
      this.songTable.queryAllData(1, (result: Array<Song>) => {
        this.musicList = result;
      })
    })
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

  @Builder itemEnd(index: number) {
    // 侧滑后尾端出现的组件
    Button({ type: ButtonType.Circle }) {
      Image($r('app.media.ic_like'))
        .width(20)
        .height(20)
        .fillColor(Color.Red)
        .colorBlend(Color.Red)
        .colorFilter(Color.Red)
        .borderColor(Color.Red)
    }
    .onClick(() => {
      this.musicList.splice(index, 1);
      LogUtils.log('index: ' + index)
    })
  }

  @Builder maybeLikeListBuilder() {
    List({ space: 10 }) {
      ForEach(this.musicList, (item: Song, index: number) => {
        ListItem() {
          Row() {
            Image(item.img)
              .width(65)
              .height(65)
              .margin(10)
              .borderRadius(8)
            Row() {
              Column({ space: 5 }) {
                Text(item.name).fontSize(20).fontColor(Color.White).width('100%').fontWeight(600)
                Row({ space: 5 }) {
                  Stack() {
                    Shape() {
                      Rect()
                        .width(35)
                        .height(20)
                        .radius(50)
                        .fill('#ff2b2a2a')
                        .stroke('#ffcfad2d')

                    }

                    Text(' VIP ').fontColor('#ffcfad2d').fontSize(12)
                  }

                  Text(item.author).fontSize(14).fontColor(Color.White).width('100%').fontWeight(400)
                }
              }
            }.layoutWeight(1)

            if (this.isPlaying === false) {
              Image($r('app.media.ic_play')).width('100px').height('100px').margin({ right: 15 })
                .onClick(() => {
                  // 播放歌曲
                  AvPlayerManager.playMusic(item)
                  // 将当前播放 index 赋值
                  this.currentIndex = index
                  this.currentMusic = musicList[this.currentIndex]
                  LogUtils.log('currentMusic:' + this.currentMusic.name)
                  this.isPlaying = true
                })
            }
            if (this.isPlaying === true) {
              if (index === this.currentIndex) {
                // 播放动画
                Image($r('app.media.ic_playing')).width(50)
                Image($r('app.media.ic_paused'))
                  .width('100px')
                  .height('100px')
                  .margin({ right: 15 })
                  .fillColor(Color.White)
                  .onClick(() => {
                    // 暂停当前播放的歌曲
                    AvPlayerManager.pauseMusic()
                    this.isPlaying = false
                  })
              } else {
                Image($r('app.media.ic_play')).width('100px').height('100px').margin({ right: 15 })
                  .onClick(() => {
                    // 播放歌曲
                    AvPlayerManager.playMusic(item)
                    // 将当前播放 index 赋值
                    this.currentIndex = index
                    this.currentMusic = musicList[this.currentIndex]
                    this.isPlaying = true
                  })
              }

            }
          }.width('100%') // 将 Text('' + item.id).fontSize(20).fontColor(Color.White) 置于容器左边，一般是在父容器 添加 .width('100%')
        }.onClick(() => {
          // 播放歌曲
          AvPlayerManager.playMusic(item)
          // 将当前播放 index 赋值
          this.currentIndex = index
          this.currentMusic = musicList[this.currentIndex]
          this.isPlaying = true
        }).swipeAction({ end: this.itemEnd(index) }) // 设置侧滑属性
      }, item => item.id)
      ListItem() {
        Text('已经到底了').fontColor(Color.Gray).width('100%').textAlign(TextAlign.Center)
      }.padding({ bottom: 20 })
    }.width('100%').height('100%').scrollBar(BarState.Auto)
  }

  /**
   * 暂弃
   */
  @Builder musicPlayerBuilder() {
    Row() {
      Text('图片').fontColor(Color.White).width('90')
      Text('音乐信息').fontColor(Color.White).layoutWeight(1)
      Text('播放|暂停按钮').fontColor(Color.White)
    }.width('100%').height('5%')
  }

  build() {
    Column() {
      // 先外再里 先上后下 先左后后
      Text('猜你喜欢')
        .padding(15)
        .fontColor('#ffc6bec0')
        .fontWeight(800)
        .width('100%')
        .fontSize(15)
      this.maybeLikeListBuilder()
    }.width('100%').backgroundColor('#ff2b2a2a').layoutWeight(2) //表示你要占整个屏幕的多少
  }
}