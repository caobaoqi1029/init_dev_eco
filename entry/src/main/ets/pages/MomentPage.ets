import { momentListType } from '../model/Music';
import { momentList } from '../model/MusicConstants';
import { musicList, songItemType } from '../model/SongModel';
import { AvPlayerManager } from '../services/AvPlayerManager';
import { LogUtils } from '../utils/LogUtils';
@Entry
@Component
export struct MomentPage {

  private momentList = momentList;


  /**
   * 音乐列表 Builder
   */
  @Builder musicListBuilder(){
    Column() {
      // 先外再里 先上后下 先左后后
      Text('互动广场').padding(35).fontColor(Color.Gray).fontWeight(800).width('100%')
      List({ space: 10 }) {
        ForEach(this.momentList, (item: momentListType) => {

        })
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
    .width('100%')
    .backgroundColor('#ff2b2a2a')
    .layoutWeight(2) //表示你要占整个屏幕的多少
  }


  build() {
    Column() {
      this.musicListBuilder()
    }.width('100%').height('100%').backgroundColor(Color.Black)  }
}