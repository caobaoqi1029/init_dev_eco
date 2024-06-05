
/**
 * 时间处理工具类
 * @author cbq
 * @since 1.0
 */
export class TimeUtils{
  /**
   * 格式化时间为 mm:ss 格式
   * @param time
   */
  static formatTime(time: number) {
    let s = Math.ceil(time / 1000) // 向上取整
    let min = Math.floor(s / 60) // 向下取整
    let ss = s % 60
    return min.toString().padStart(2,'0') + ':' + ss.toString().padStart(2,'0')
  }
}