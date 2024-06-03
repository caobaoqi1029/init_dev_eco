/**
 * @Entry 和 @Component 都是固定代码，其中 <br>
 *
 * @Entry 表示当前文件是一个页面 <br>
 * @Component 表示当前文件是一个组件 <br>
 *
 */
@Entry
@Component
// struct 关键字用于定义一个结构体其名称必须为唯一值
struct HelloHarmonyOSPage {
  @State message: string = 'Hello Harmony OS'
  /*
   * 预览页面的两种方式：
   *
   * 1. 通过 Preview 预览器  <br>
   *    该方式不需要指定特定的 Page （默认为当前 Page）  <br>
   * 2. 通过 虚拟机 方式进行构建显示  <br>
   *    需要将当前页面渲染到虚拟机中  <br>
   * */
  @State info: string = '计专 2301 班 2309312102 曹宝琪'

  // build() 方法用于控制页面布局等
  build() {
    Row() {
      Column() {
        Text(this.message + this.info)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}