@Entry
@Component
// export 表示将当前页面导出
export struct MusicPage {

  build() {
    Column(){
      Column(){
        Text('只因你太美').fontWeight(FontWeight.Bold).fontColor(Color.White).margin({top:15})
        Text('蔡徐坤').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({top:5})
        Image($r('app.media.ic_cd')).height('50%').margin({top:15})
        Text('进度条').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({top:15})
      }
      .width('100%').margin({top:10}).layoutWeight(1)
      .radialGradient({
        center: ['50%','50%'],
        radius: '60%',
        colors: [
          ['#835e13',0.5],
          [Color.Transparent,1]
        ],
      })
      Column(){

      }
      .borderRadius({ topLeft: 15, topRight: 15 }).width('100%').backgroundColor('#ff2b2a2a').layoutWeight(2) //表示你要占整个屏幕的多少
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
}
