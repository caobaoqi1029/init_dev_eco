import { momentListType } from '../model/Music';
import { momentList } from '../model/MusicConstants';
import { musicList, songItemType } from '../model/SongModel';
import { AvPlayerManager } from '../services/AvPlayerManager';
import { LogUtils } from '../utils/LogUtils';

@Entry
@Component
export struct MomentPage {
  private momentList = momentList;
  @State isPlaying: boolean = false // 是否处于播放状态 false 为播放 true 表示播放中
  @State currentIndex: number = -1 // 当前播放歌曲 index 默认为 -1 表示没有播放
  @State currentMusic: songItemType = null // 当前播放歌曲


  @Builder playerCardBuilder(item:momentListType, index: number){
    Row({space:10}){
      Image(item.song.img).width('15%').height('150px').borderRadius({ topLeft: 10, bottomLeft: 10 })
      Column({space:5}){
        Text(item.song.name).fontColor(Color.White).fontSize(12)
        Text(item.song.author).fontColor(Color.White).fontSize(6)
      }.alignItems(HorizontalAlign.Start).margin({bottom:20,top:5}).layoutWeight(1)
      if (this.isPlaying === false) {
        Image($r('app.media.ic_play')).width('100px').height('100px').margin({ right: 15 })
          .onClick(() => {
            // 播放歌曲
            AvPlayerManager.playMusic(item.song)
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
              AvPlayerManager.playMusic(item.song)
              // 将当前播放 index 赋值
              this.currentIndex = index
              this.currentMusic = musicList[this.currentIndex]
              this.isPlaying = true
            })
        }

      }    }.width('83%').backgroundColor(Color.Gray).borderRadius(10)
  }


  /**
   * 音乐列表 Builder
   */
  @Builder musicListBuilder() {
    Column() {
      // 先外再里 先上后下 先左后后
      Text('互动广场').padding(35).fontColor(Color.Gray).fontWeight(800).width('100%')
      List({ space: 10 }) {
        ForEach(this.momentList, (item: momentListType, index: number) => {
          ListItem() {
            Row() {
              Image(item.avatar).width('100px').borderRadius(40).margin({ right: 10, bottom: 70 })
              Column({space:5}) {
                Text(item.author).fontColor(Color.White)
                Text(item.content).fontColor(Color.White).fontSize(10).maxLines(1).width('80%').textOverflow({overflow:TextOverflow.Ellipsis})
                this.playerCardBuilder(item,index)
                Row({ space: 10 }) {
                  Row({space:5}) {
                    Image($r('app.media.ic_share')).width('50px').fillColor(Color.Gray)
                    Text('分享').fontColor(Color.White)
                  }

                  Row({space:5}) {
                    Image($r('app.media.ic_comment_o')).width('50px').fillColor(Color.Gray)
                    Text('' + item.comment).fontColor(Color.White)
                  }

                  Row({space:5}) {
                    Image($r('app.media.ic_like')).width('50px').fillColor(Color.Gray)
                    Text('' + item.like).fontColor(Color.White)
                  }
                }
              }.alignItems(HorizontalAlign.Start)
            }.width('100%')
          }
        })
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
    .width('100%')
    .backgroundColor('#ff2b2a2a')
    .layoutWeight(2) //表示你要占整个屏幕的多少
  }

  build() {
    Column() {
      this.musicListBuilder()
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}