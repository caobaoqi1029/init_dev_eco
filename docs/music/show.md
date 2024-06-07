# Ikun 云音乐

| 学号     | 职责                                        |
| -------- | ------------------------------------------- |
| 🐔 曹宝琪 | 组长，负责项目管理任务分配，项目打包        |
| 🎤 曹蓓   | dev，负责推荐页面的代码实现，文档撰写等工作 |
| 💃 王文照 | dev，负责动态页面的代码实现                 |
| 🗣️ 程柄惠 | dev，负责发现页面代码实现                   |
| 🏀 宋文杰 | 音乐数据的收集以及 PPT 的制作               |

> [!TIP]
>
> 项目亮点：
>
> - 使用 RDB 操作数据库
> - 侧滑删除 music 、自定义播放控件 （可用于控制歌曲前进 | 后退）
> - 使用 git 协同开发、通过 vitePress 撰写文档更友好

# 一、整体结构

> [!TIP]
>
> 项目大致分为以下几个页面：
>
> - 推荐页面：展示分类信息
> - 发现页面：用于随机音乐推荐 （Random 待实现）
> - 音乐页面：主要用于听音乐
> - 动态页面：用于展示相关歌曲的评论以及转发点赞等信息

# 二、页面

> 🐔 鸡你太美 oh baby

## 2.1 推荐页面

```ts
import { recommendListType, recommendListTypeModel } from '../model/Music'
import { dailyRecommend, recommendList, swiperList } from '../model/MusicConstants'
// @ts-ignore
import { recommendDailyType } from '../model/MusicConstants'

@Entry
@Component
export struct RecommendPage {
  @Builder
  searchBuilder() {
    Row() {
      Image($r('app.media.ic_search'))
        .width(25)
        .fillColor(Color.Gray)
      Text('只因你太美🔥')
        .fontColor(Color.Gray)
        .layoutWeight(1)
      Image($r('app.media.ic_code'))
        .width(25)
        .fillColor(Color.Gray)
    }
    .padding({ left: 12, right: 12 })
    .width('100%')
    .height(42)
    .backgroundColor('#ff292929')
    .borderRadius(60)
  }

  @Builder
  swiperBuilder() {
    Swiper() {
      ForEach(swiperList, (item: string) => {
        Image(item)
          .width('100%')
      })
    }
    .loop(true)
    .autoPlay(true)
    .interval(3000)
    .borderRadius(10)
    .indicatorStyle({
      selectedColor: Color.White
    })
  }

  @Builder
  titleBuilder(title: string, rightText: string) {
    Row() {
      Text(title)
        .fontColor(Color.White)
      Text(rightText)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  recommendBuilder() {
    Scroll() {
      Row({ space: 10 }) {
        ForEach(dailyRecommend, (item: recommendDailyType) => {
          Column() {
            Text(item.type)
              .fontColor(Color.White)
              .fontWeight(800)
              .fontSize(16)
              .backgroundColor(item.top)
              .width('100%')
              .padding({ top: 10, bottom: 10 })

            Image(item.img)

            Text(item.title)
              .fontColor(Color.White)
              .backgroundColor(item.bottom)
              .fontSize(14)
              .padding({ top: 10, bottom: 10, left: 5, right: 5 })
              .maxLines(2) //设置最大显示行数为2行
              .textOverflow({ overflow: TextOverflow.Ellipsis }) //文字超出2行则使用...替代
          }
          .height(120)
          .width('40%')
        })
      }
      .margin({ top: -100 }) //用来修复Scroll自动将里面的内容往下留白的问题
      .height(120)
    }
    .height(240)
    .scrollable(ScrollDirection.Horizontal) //设置水平滚动
  }

  @Builder
  musicBuider() {
    Scroll() {
      Row({space:10}) {
        ForEach(recommendList, (item: recommendListType) => {
          Column({ space: 10 }) {
            Stack({ alignContent: Alignment.TopStart }) {
              Image(item.img)
                .width('100%') // 这个不能省，如果省略会导致Scroll出问题

              Text(item.count)
                .fontColor(Color.White)
                .margin(10)
                .fontSize(12)
                .fontWeight(800)
            }

            Text(item.title)
              .fontColor(Color.White)
              .fontSize(12)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .width('30%')
        })
      }
    }
    .scrollable(ScrollDirection.Horizontal)
  }

  build() {
    Column({ space: 20 }) {
      //   1. 搜索区域
      this.searchBuilder()
      //   2. 轮播图
      this.swiperBuilder()
      //   3. 每日推荐
      this.titleBuilder('每日推荐', '更多...')
      // 每日推荐内容显示
      this.recommendBuilder()
      //   4. 推荐歌单
      this.titleBuilder('推荐歌单', '更多...')
      this.musicBuider()
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor(Color.Black)
  }
}

```

`RecommendPage` 是一个用于展示音乐推荐内容的页面组件。它包含了搜索区域、轮播图、每日推荐和推荐歌单等模块。

1. **搜索区域 (`searchBuilder`)**
   - 使用 `Row` 布局，包含一个搜索图标、文本和一个二维码图标。
   - 设置背景颜色、边框半径和内边距，以美化界面。
2. **轮播图 (`swiperBuilder`)**
   - 使用 `Swiper` 组件和 `ForEach` 循环来展示多张图片。
   - 设置轮播图的自动播放、循环、间隔时间和指示器样式。
3. **每日推荐 (`titleBuilder` 和 `recommendBuilder`)**
   - 使用 `titleBuilder` 构建标题栏，显示“每日推荐”和“更多...”。
   - 使用 `recommendBuilder` 展示每日推荐的音乐列表，每项包含类型、图片和标题。
   - 使用 `Column` 和 `Row` 布局，以及 `ForEach` 循环来动态生成内容。
4. **推荐歌单 (`titleBuilder` 和 `musicBuider`)**
   - 再次使用 `titleBuilder` 构建标题栏，显示“推荐歌单”和“更多...”。
   - 使用 `musicBuider` 展示推荐歌单，每项包含图片、播放次数和标题。
   - 使用 `Stack` 布局来叠加图片和播放次数，以及 `Column` 和 `Row` 布局来组织内容。

![image-20240607112315754](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240607112315754.png)

## 2.2 发现页面

> [!CAUTION]
>
> 着重讲解 DB 的实现

```ts

import relationalStore from '@ohos.data.relationalStore';
import {SongTable} from '../model/SongTable'
export default class CommonConstants {
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };
  static readonly Song_Table:SongTable = {
    tableName: 'SongTable',
    sqlCreate: 'CREATE TABLE IF NOT EXISTS SongTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, ' +
    'author TEXT, src INTEGER,img TEXT,style TEXT)',
    columns: ['id', 'name', 'author', 'src','img','style']
  };

}

```

```ts
import relationalStore from '@ohos.data.relationalStore';
import Logger from '../utils/Logger'
import CommonConstants from './CommonConstants';


export default class Rdb{
  private rdbStore: relationalStore.RdbStore | null = null;
  private tableName: string;
  private sqlCreateTable: string;
  private columns: Array<string>;
  constructor(tableName: string, sqlCreateTable: string, columns: Array<string>) {
    this.tableName = tableName;
    this.sqlCreateTable = sqlCreateTable;
    this.columns = columns;
  }
  getRdbStore(callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(CommonConstants.RDB_TAG, 'getRdbStore() has no callback!');
      return;
    }
    if (this.rdbStore !== null) {
      Logger.info(CommonConstants.RDB_TAG, 'The rdbStore exists.');
      callback();
      return
    }
    let context: Context = getContext(this) as Context;
    relationalStore.getRdbStore(context, CommonConstants.STORE_CONFIG, (err, rdb) => {
      if (err) {
        Logger.error(CommonConstants.RDB_TAG, `gerRdbStore() failed, err: ${err}`);
        return;
      }
      this.rdbStore = rdb;
      this.rdbStore.executeSql(this.sqlCreateTable);
      Logger.info(CommonConstants.RDB_TAG, 'getRdbStore() finished.');
      callback();
    });
  }

  insertData(data: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(CommonConstants.RDB_TAG, 'insertData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket: relationalStore.ValuesBucket = data;
    if (this.rdbStore) {
      this.rdbStore.insert(this.tableName, valueBucket, (err, ret) => {
        if (err) {
          Logger.info(CommonConstants.RDB_TAG,`this is joker${JSON.stringify(valueBucket)}`)
          Logger.error(CommonConstants.RDB_TAG, `insertData() failed, err: ${err}  ${this.tableName}`);
          callback(resFlag);
          return;
        }
        Logger.info(CommonConstants.RDB_TAG, `insertData() finished: ${ret}`);
        callback(ret);
      });
    }
  }

  deleteData(predicates: relationalStore.RdbPredicates, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(CommonConstants.RDB_TAG, 'deleteData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    if (this.rdbStore) {
      this.rdbStore.delete(predicates, (err, ret) => {
        if (err) {
          Logger.error(CommonConstants.RDB_TAG, `deleteData() failed, err: ${err}`);
          callback(resFlag);
          return;
        }
        Logger.info(CommonConstants.RDB_TAG, `deleteData() finished: ${ret}`);
        callback(!resFlag);
      });
    }
  }

  updateData(predicates: relationalStore.RdbPredicates, data: relationalStore.ValuesBucket, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(CommonConstants.RDB_TAG, 'updateDate() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket: relationalStore.ValuesBucket = data;
    if (this.rdbStore) {
      this.rdbStore.update(valueBucket, predicates, (err, ret) => {
        if (err) {
          Logger.error(CommonConstants.RDB_TAG, `updateData() failed, err: ${err}`);
          callback(resFlag);
          return;
        }
        Logger.info(CommonConstants.RDB_TAG, `updateData() finished: ${ret}`);
        callback(!resFlag);
      });
    }
  }

  query(predicates: relationalStore.RdbPredicates, callback: Function = () => {
  }) {
    if (!callback || typeof callback === 'undefined' || callback === undefined) {
      Logger.info(CommonConstants.RDB_TAG, 'query() has no callback!');
      return;
    }
    if (this.rdbStore) {
      this.rdbStore.query(predicates, this.columns, (err, resultSet) => {
        if (err) {
          Logger.error(CommonConstants.RDB_TAG, `query() failed, err:  ${err}`);
          return;
        }
        Logger.info(CommonConstants.RDB_TAG, 'query() finished.');
        callback(resultSet);
        resultSet.close();
      });
    }
  }
}


```

```ts
import relationalStore from '@ohos.data.relationalStore';
import Song from '../model/Song';
import CommonConstants from './CommonConstants';
import Rdb from './Rdb';

export default class SongTable {
  private songTable = new Rdb(CommonConstants.Song_Table.tableName,
    CommonConstants.Song_Table.sqlCreate, CommonConstants.Song_Table.columns)

  constructor(callback: Function = () => {
  }) {
    this.songTable.getRdbStore(callback);
  }

  getRdbStore(callback: Function = () => {
  }) {
    this.songTable.getRdbStore(callback);
  }

  /**
   * 初始化数据
   * @param songs
   * @param callback
   */
  initData(songs: Array<Song>, callback: Function) {
    for (let i = 0; i < songs.length; i++) {
      this.insertData(songs[i], () => {
      });
    }
    callback(1);
  }

  /**
   * 插入数据
   * @param song song
   * @param callback callback
   */
  insertData(song: Song, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(song);
    this.songTable.insertData(valueBucket, callback);
  }

  /**
   * 删除数据
   * @param song
   * @param callback
   */
  deleteData(song: Song, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(CommonConstants.Song_Table.tableName);
    predicates.equalTo('id', song.id);
    this.songTable.deleteData(predicates, callback);
  }

  /**
   * 更新数据
   * @param song
   * @param callback
   */
  updateData(song: Song, callback: Function) {
    const valueBucket: relationalStore.ValuesBucket = generateBucket(song);
    let predicates = new relationalStore.RdbPredicates(CommonConstants.Song_Table.tableName);
    predicates.equalTo('id', song.id);
    this.songTable.updateData(predicates, valueBucket, callback);
  }

  /**
   * select *
   * @param op op
   * @param callback callback
   */
  queryAllData(op: number, callback: Function) {
    let predicates = new relationalStore.RdbPredicates(CommonConstants.Song_Table.tableName)
    this.songTable.query(predicates, (result: relationalStore.ResultSet) => {
      let count = result.rowCount;
      console.log('count of result:' + count);
      if (count == 0 || typeof count == 'string') {
        console.log('query no result');
      }
      else {
        let res: Array<Song> = [];
        result.goToFirstRow();
        for (let i = 0;i < count; i++) {
          let tmp: Song = {
            id: 0,
            name: '',
            author: '',
            src: '',
            img: '',
          }
          tmp.id = result.getDouble(result.getColumnIndex('id'));
          tmp.name = result.getString(result.getColumnIndex('name'));
          tmp.author = result.getString(result.getColumnIndex('author'));
          tmp.src = result.getString(result.getColumnIndex('src'));
          tmp.img = result.getString(result.getColumnIndex('img'));
          res.push(tmp);
          result.goToNextRow();
        }
        callback(res);
      }

    })
  }
}

function generateBucket(song: Song): relationalStore.ValuesBucket {
  let obj: relationalStore.ValuesBucket = {};
  obj.id = song.id;
  obj.name = song.name;
  obj.author = song.author;
  obj.src = song.src;
  obj.img = song.img;
  return obj;
}
```

在 IndexPage 加载的时候初始化 DB 数据
```ts
  aboutToAppear(){
    this.SongTable.getRdbStore(()=>{
      this.SongTable.initData(this.allList,(res:number)=>{
        console.log('init song table count is: ' + res)
      })
    })
  }
```

`FindPage` 是一个用于展示音乐列表并提供播放功能的页面组件。它通过与数据库交互获取音乐列表，并使用 `AvPlayerManager` 来控制音乐的播放和暂停。

1. **初始化 (`aboutToAppear`)**
   - 从数据库中获取音乐列表。
   - 初始化 `AvPlayerManager`，并监听音乐播放的时长和总时长。
2. **音乐列表 (`maybeLikeListBuilder`)**
   - 使用 `List` 和 `ListItem` 组件展示音乐列表。
   - 每个列表项包含音乐封面、音乐名称、作者和播放/暂停按钮。
   - 根据当前播放状态显示不同的播放按钮（播放或暂停）。
   - 支持侧滑操作，侧滑后可以删除音乐。
3. **播放控制**
   - 通过点击播放按钮触发音乐播放，并更新当前播放的音乐和索引。
   - 提供暂停功能，通过点击暂停按钮暂停当前播放的音乐。
4. **状态管理**
   - 使用 `@State` 装饰器管理播放状态 (`isPlaying`)、当前播放索引 (`currentIndex`)、当前播放音乐 (`currentMusic`)、总时长 (`totalTime`) 和当前播放时长 (`currentTime`)。

> [!NOTE]
>
> 关键特性：
>
> - **动态内容生成**：使用 `ForEach` 循环从数据库中动态生成音乐列表。
> - **交互性**：提供播放、暂停和删除音乐的功能。
> - **状态同步**：实时更新播放状态和播放时长，确保用户界面与音乐播放状态同步。

![image-20240607112420953](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240607112420953.png)

> [!CAUTION]
>
> - 使用 RDB 存储操作数据
> - 侧滑删除

## 2.3 音乐页面

`MusicPage` 是一个用于展示音乐播放列表和控制音乐播放的页面组件。它提供了音乐列表的展示、音乐播放控制、播放进度显示以及播放列表的切换功能。

1. **初始化 (`aboutToAppear`)**
   - 初始化 `AvPlayerManager`，并监听音乐播放的时长和总时长。
2. **音乐播放控制 (`MusicPlayBuilder`)**
   - 显示当前播放的音乐名称和作者。
   - 使用 `Image` 组件展示唱片封面，并添加旋转动画。
   - 使用 `Slider` 组件显示和控制播放进度，支持用户拖动滑块调整播放位置。
3. **音乐列表 (`musicListBuilder`)**
   - 使用 `List` 和 `ListItem` 组件展示音乐列表。
   - 每个列表项包含音乐封面、音乐名称、作者和播放/暂停按钮。
   - 根据当前播放状态显示不同的播放按钮（播放或暂停）。
   - 支持侧滑操作，侧滑后可以删除音乐。
4. **播放列表切换**
   - 提供左右切换按钮，允许用户切换到上一首或下一首音乐。

> [!NOTE] 
>
> 关键特性：
>
> - **动态内容生成**：使用 `ForEach` 循环从音乐列表中动态生成音乐列表项。
> - **交互性**：提供播放、暂停、切换音乐和删除音乐的功能。
> - **状态同步**：实时更新播放状态、播放时长和播放列表，确保用户界面与音乐播放状态同步。

![image-20240607112559515](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240607112559515.png)

> [!CAUTION]
>
> - 自定义播放控件
> - 实时渲染当前播放音乐信息

## 2.4 动态页面

`MomentPage` 是一个用于展示音乐互动广场的页面组件。它通过展示用户动态和相关音乐，提供了一个社交互动的平台。用户可以浏览动态、播放音乐、分享和评论。

1. **音乐播放控制 (`playerCardBuilder`)**
   - 在每个动态项中嵌入音乐播放控制卡，显示音乐封面、名称和作者。
   - 根据当前播放状态显示不同的播放按钮（播放或暂停）。
2. **动态列表 (`musicListBuilder`)**
   - 使用 `List` 和 `ListItem` 组件展示动态列表。
   - 每个动态项包含用户头像、作者、内容、音乐播放卡以及分享、评论和点赞的统计信息。
   - 使用 `ForEach` 循环从动态列表中动态生成动态项。

> [!NOTE]
>
> 关键特性：
>
> - **动态内容生成**：使用 `ForEach` 循环从动态列表中动态生成动态项。
> - **交互性**：提供播放音乐的功能，并根据当前播放状态显示不同的播放按钮。
> - **社交互动**：展示动态的分享、评论和点赞统计，增强用户之间的互动。

![image-20240607112740220](https://2024-cbq-1311841992.cos.ap-beijing.myqcloud.com/picgo/image-20240607112740220.png)
