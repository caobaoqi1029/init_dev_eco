
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
