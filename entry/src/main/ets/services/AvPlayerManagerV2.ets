import media from '@ohos.multimedia.media'
import Song from '../model/Song'
import { songItemType } from '../model/SongModel'
/**
 * 音频播放管理器
 * @author cbq
 * @since 1.0
 */
export class AvPlayerManager {
  static AvPlayer: media.AVPlayer = Object()
  /**
   * 1.初始化 AvPlayer 对象
   */
  static async init() {
    this.AvPlayer = await media.createAVPlayer()
    this.AvPlayer.on('stateChange', (state) => {
      if (state === 'initialized') {
        // 3. 获取到播放源后通过 prepare() 将状态转换为 prepared 准备播放状态
        this.AvPlayer.prepare()
      }
      if (state === 'prepared') {
        // 4. 处于准备播放状态后通过 play() 进行播放
        this.AvPlayer.play()
      }
    })
  }

  /**
   * 2. 定义播放歌曲
   */
  static async playMusic(song: Song) {
    // 将 song.url 赋值到 AvPlayer.url
    await this.AvPlayer.reset()
    this.AvPlayer.url = song.src
  }

  /**
   * 暂停播放
   */
  static async pauseMusic() {
    await this.AvPlayer.pause()
  }

  /**
   * 指定时间戳播放
   */
  static seekMusic(time: number) {
    this.AvPlayer.seek(time)
  }

}