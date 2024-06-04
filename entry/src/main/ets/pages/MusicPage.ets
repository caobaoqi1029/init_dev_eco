@Entry
@Component
// export 表示将当前页面导出
export struct MusicPage {

  build() {
    Column(){
      Column(){
        Text('只因你太美').fontWeight(FontWeight.Bold).fontColor(Color.White).margin({top:15})
        Text('蔡徐坤').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({top:5})
        Image($r('app.media.ic_cd')).height('50%').margin({top:30})
        Text('进度条').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({top:15})
      }.width('100%').layoutWeight(1).margin({top:10})
      Column(){

      }.width('100%').layoutWeight(2).backgroundColor('#ff626060').borderRadius({topLeft:15,topRight:15})
    }.width('100%').height('100%')
  }
}
