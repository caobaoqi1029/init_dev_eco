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
      let song: Song = songs[i];
      this.insertData(song, () => {
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