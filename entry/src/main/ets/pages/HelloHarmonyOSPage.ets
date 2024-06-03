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
      /**
       * 容器组件 Column() 该容器内的内容为纵向排列,其属性有:
       *
       * space (string | number) 用于控制容器内各组件间距 <br>
       */
      Column({space:20}) {
        /**
         * 基础组件: Text() 用于显示一个文本内容,其属性有:
         *
         */
        Text(this.message)
        Text(this.info)
          .fontColor(Color.Red)
          .fontSize(20)
          .fontWeight(600)
          .backgroundColor(Color.Black)
          .margin(10)
          .padding(30)

        /**
         * 容器组件 Row() 该容器内的内容为 横向排列
         */
        Row(){
          Text('张飞')
          Text('关羽')
          Text('刘备')
        }.backgroundColor(Color.Red).width('100%')
        // Flex 流式布局
        .justifyContent(FlexAlign.SpaceBetween)

        /**
         * 容器组件 Stack() 该容器内的内容为 层叠排列
         */
        Stack({alignContent:Alignment.Bottom}){
          // 可以使用 $r('app.media.icon') 的方式引用 resource 中的资源其中 $r 为内置函数 app 为内置 resource 变量
          Image($r('app.media.icon')).width(200)
          Text('上层元素')
        }

      }.backgroundColor(Color.Pink).width('100%').height('100%')
    }
}