@Entry
@Component
// export 表示将当前页面导出
export struct MusicPage {

  build() {
    Column(){
      Column(){
        Text('只因你太美').fontWeight(FontWeight.Bold).fontColor(Color.White).margin({top:15})
        Text('蔡徐坤').fontWeight(FontWeight.Normal).fontSize(10).fontColor(Color.White).margin({top:5})
        Video({
          src: $rawfile('cxk.mp4'),
          previewUri: $r('app.media.cxk'),
          currentProgressRate: PlaybackSpeed.Speed_Forward_1_00_X
        }).height('35%').width('100%').objectFit(ImageFit.Cover)
      }.width('100%').margin({top:10})
      Column(){

      }.width('100%').backgroundColor('#ff626060').borderRadius({topLeft:15,topRight:15})
    }.width('100%').height('100%')
  }
}

@Component
export struct VideoPlayer{
  private controller:VideoController;
  private previewUris: Resource = $r('app.media.cxk');
  private innerResource: Resource = $rawfile('cxk.mp4');
  build(){
    Column() {
      Video({
        src: this.innerResource,
        previewUri: this.previewUris,
        controller: this.controller
      })
        .muted(false) //设置是否静音
        .controls(true) //设置是否显示默认控制条
        .autoPlay(false) //设置是否自动播放
        .loop(false) //设置是否循环播放
        .objectFit(ImageFit.Contain) //设置视频适配模式
    }
  }
}