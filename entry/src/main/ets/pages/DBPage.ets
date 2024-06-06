import SongTable from '../db/SongTable'
import Song from '../model/Song'

@Entry
@Component
export struct DBPage {
  @State songList: Array<Song> = []
  private songTable: SongTable = new SongTable(() => {
  })

  aboutToAppear() {
    this.songTable.getRdbStore(() => {
      this.songTable.queryAllData(1, (result: Array<Song>) => {
        this.songList = result;
      })
    })
  }

  build() {
    Row() {
      List({space:10}) {
        ForEach(this.songList, (item: Song) => {
          ListItem() {
            Text('' + item.name).fontSize(30).fontColor(Color.White)
          }
        })
      }

    }
  }
}