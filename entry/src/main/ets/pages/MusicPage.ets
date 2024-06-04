import { songItemType,musicList } from '../model/SongModel';
@Entry
@Component
  // export 表示将当前页面导出
export struct MusicPage {
  private musicList = musicList;
  @State angel: number = 0; // 唱片初始角度

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

  build() {
    Column() {
      Column() {
        Text('只因你太美').fontWeight(FontWeight.Bold).fontColor(Color.White).margin({ top: 15 })
        Text('蔡徐坤').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({ top: 5 })
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
        Row(){
          Text('00:00').fontColor(Color.White)
          Slider({
            min: 0,
            max: 100,
            value:50
          }).onChange((time) => {
            console.log(time + '') // 当前选中的值
          }).layoutWeight(1)
            .trackThickness(3) // 滑块厚度
            .selectedColor(Color.White) // 已选中颜色
            .trackColor(Color.Gray) // 未选中颜色
          Text('00:00').fontColor(Color.White)
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

      Column() {
        // 先外再里 先上后下 先左后后
        Text('播放列表 (' + this.musicList.length + ')').padding(15).fontColor('#ec5c87').fontWeight(600).width('100%')
        List({ space: 10}) {
          ForEach(this.musicList, (item: songItemType,id: number) => {
            ListItem() {
              Row() {
                Text('' + (parseInt(item.id) + 1)).fontSize(20).fontColor(Color.White).margin({left:5}).textAlign(TextAlign.Center).fontWeight(600)
                Row(){
                  Image(item.img)
                    .width(40)
                    .height(40)
                    .margin(10)
                    .borderRadius(8)
                  Column({space: 5}) {
                    Text(item.name).fontSize(20).fontColor(Color.White).width('100%').fontWeight(600)
                    Text(item.author).fontSize(14).fontColor(Color.White).width('100%').fontWeight(500)
                  }
                }.layoutWeight(1)
                Image($r('app.media.ic_play')).width('100px').height('100px').margin({right:15})
              }.width('100%') // 将 Text('' + item.id).fontSize(20).fontColor(Color.White) 置于容器左边，一般是在父容器 添加 .width('100%')
            }.swipeAction({ end: this.itemEnd(id) }) // 设置侧滑属性
          }, item => item.id)
          ListItem(){
            Text('已经到底了').fontColor(Color.Gray).width('100%').textAlign(TextAlign.Center)
          }.padding({bottom:20})
        }.width('100%').height('100%')
        .divider({
          strokeWidth: 1,
          startMargin: 60,
          endMargin: 10,
          color: '#ffe9f0f0'
        }).scrollBar(BarState.Auto)
      }
      .borderRadius({ topLeft: 15, topRight: 15 })
      .width('100%')
      .backgroundColor('#ff2b2a2a')
      .layoutWeight(2) //表示你要占整个屏幕的多少
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}


