import router from '@ohos.router';
import { LogUtils } from '../utils/LogUtils';
@Entry
@Component
struct ADPage {
  // 默认倒计时为 5 s
  @State adTime:number = 5
  time:number = -1;

  // 页面创建 hook 函数
  aboutToAppear(){
    // 创建定时器 该函数接受一个 Function 和 Number(每隔多少时间执行前面的函数)
     this.time = setInterval(() => {
       this.adTime --
       LogUtils.log(this.adTime.toString())
       if (this.adTime <= 0) {
         clearInterval(this.time)
         // 跳转到首页 replaceUrl() 代表将当前页面替换，无法返回
         router.replaceUrl({url:'pages/Index'})
       }
    },1000)
  }

  @Builder AdBuilder(){
    // 广告页面
    Stack({alignContent:Alignment.TopEnd}){
      // 底部图片
      Image($r('app.media.ad'))

      // 跳过按钮
      Button('跳过  ' + this.adTime + ' s').backgroundColor('#ff918e8e').fontSize(15)
        .height(30).margin({top:10,right:10})
        .onClick(()=>{
          // 点击跳过
          router.replaceUrl({url:'pages/Index'})
        })
    }
  }

  build() {
    Row(){
      this.AdBuilder()
    }
  }
}