import { songItemType, musicList } from '../model/SongModel';
import { AvPlayerManager } from '../services/AvPlayerManager';
import { LogUtils } from '../utils/LogUtils';
import { TimeUtils } from '../utils/TimeUtils';

@Entry
@Component
  // export 表示将当前页面导出
export struct MusicPage {
  private musicList = musicList;
  @State angel: number = 0; // 唱片初始角度
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
    })
  }

  /**
   * 音乐播放 Builder
   */
  @Builder MusicPlayBuilder(){
    Column() {
      Text(this.currentMusic === null?'离别开出花':this.currentMusic.name).fontWeight(FontWeight.Bold).fontColor(Color.White).margin({ top: 15 })
      Text(this.currentMusic === null?'就南方的凯':this.currentMusic.author)
        .fontWeight(FontWeight.Normal)
        .fontSize(10)
        .fontColor(Color.White)
        .margin({ top: 5 })
      Image($r('app.media.ic_cd'))
        .height('50%')
        .margin({ top: 15 })
        .rotate({ angle: this.angel }) // 添加动画顺序必须 设置角度 --> 设置事件 --> 设置动画
        .onAppear(() => {
          this.angel = 360
        }) // onAppear 当图片加载完成后自动触发
        .animation({
          duration: 5000, //表示动画时长
          curve: Curve.Linear, // 表示唱片匀速旋转
          iterations: -1 // -1：一直旋转
        })
      Row() {
        Text(TimeUtils.formatTime(this.currentTime)).fontColor(Color.White)
        Slider({
          min: 0,
          step: 10,
          max: this.totalTime,
          value: this.currentTime,
        })
          .showSteps(true)
          .onChange((time) => {
            AvPlayerManager.AvPlayer.seek(time)
          })
          .layoutWeight(1)
          .trackThickness(3) // 滑块厚度
          .blockColor('#191970')
          .trackColor('#ADD8E6')
          .selectedColor('#4169E1')
        Text(TimeUtils.formatTime(this.totalTime)).fontColor(Color.White)
      }.width('100%')
    }
    .width('100%').margin({ top: 10 }).layoutWeight(1)
    .radialGradient({
      center: ['50%', '50%'],
      radius: '60%',
      colors: [
        ['#835e13', 0.5],
        [Color.Transparent, 1]
      ],
    })
  }

  /**
   * 音乐列表 Builder
   */
  @Builder musicListBuilder(){
    Column() {
      // 先外再里 先上后下 先左后后
      Text('播放列表 (' + this.musicList.length + ')').padding(15).fontColor('#ec5c87').fontWeight(600).width('100%')
      List({ space: 10 }) {
        ForEach(this.musicList, (item: songItemType, index: number) => {
          ListItem() {
            Row() {
              Text('' + (index + 1))
                .fontSize(20)
                .fontColor(Color.White)
                .margin({ left: 5 })
                .textAlign(TextAlign.Center)
                .fontWeight(600)
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
              }.layoutWeight(1)
              if (this.isPlaying === false) {
                Image($r('app.media.ic_play')).width('100px').height('100px').margin({ right: 15 })
                  .onClick(() => {
                    // 播放歌曲
                    AvPlayerManager.playMusic(item)
                    // 将当前播放 index 赋值
                    this.currentIndex = index
                    this.currentMusic = musicList[this.currentIndex]
                    LogUtils.log('currentMusic:'+ this.currentMusic.name)
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
            }
            .width('100%') // 将 Text('' + item.id).fontSize(20).fontColor(Color.White) 置于容器左边，一般是在父容器 添加 .width('100%')
          }.swipeAction({ end: this.itemEnd(index) }) // 设置侧滑属性
        }, item => item.id)
        ListItem() {
          Text('已经到底了').fontColor(Color.Gray).width('100%').textAlign(TextAlign.Center)
        }.padding({ bottom: 20 })
      }.width('100%').height('100%')
      .divider({
        strokeWidth: 1,
        startMargin: 5,
        endMargin: 5,
        color: '#ffe9f0f0'
      }).scrollBar(BarState.Auto)
    }
    .borderRadius({ topLeft: 15, topRight: 15 })
    .width('100%')
    .backgroundColor('#ff2b2a2a')
    .layoutWeight(2) //表示你要占整个屏幕的多少
  }

  build() {
    Column() {
      this.MusicPlayBuilder()
      this.musicListBuilder()
      Row(){
        Button('<- 🐔').layoutWeight(1).onClick(()=>{
          if (this.currentIndex -1 >= 0 && this.currentIndex < musicList.length) {
            AvPlayerManager.pauseMusic()
            this.currentIndex -= 1
            this.currentMusic = this.musicList[this.currentIndex]
            AvPlayerManager.playMusic(this.currentMusic)
          }
        })
        Button('🏀 ->').layoutWeight(1).onClick(()=>{
          if (this.currentIndex + 1 <= musicList.length&& this.currentIndex > 0) {
            AvPlayerManager.pauseMusic()
            this.currentIndex += 1
            this.currentMusic = this.musicList[this.currentIndex]
            AvPlayerManager.playMusic(this.currentMusic)
          }
        })
      }.width('100%').height('10%')
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}


