/**
 * 歌曲对象
 * @author cbq
 * @since 1.0
 */
export interface songItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
}

// 歌曲列表
export const musicList: songItemType[] = [
  {
    img: 'https://img4.kuwo.cn/star/starheads/240/35/10/30088435.jpg',
    name: '天外来物(Live)',
    author: '薛之谦',
    url: 'https://www.shiyinren.com/server/1/160897073.mp3',
    id: '0000'
  },
  {
    img: 'https://star.kuwo.cn/star/starheads/180/24/82/2446217373.jpg',
    name: '诺言',
    author: '王爱华',
    url: 'https://www.shiyinren.com/server/1/377718701.mp3',
    id: '0001'
  },
  {
    img: 'https://img1.kuwo.cn/star/albumcover/240/s3s42/65/2784609704.jpg',
    name: '将军',
    author: '沧海一舟',
    url: 'https://www.shiyinren.com/server/1/377436389.mp3',
    id: '0002'
  },
  {
    img: 'https://img3.kuwo.cn/star/starheads/240/1/0/3016067007.jpg',
    name: '执迷不悔',
    author: '王菲',
    url: 'https://www.shiyinren.com/server/1/376922025.mp3',
    id: '0003'
  },
  {
    img: 'https://img2.kuwo.cn/star/starheads/240/64/17/3370271515.jpg',
    name: '因为爱情（粤语版）',
    author: '阿梨粤',
    url: 'https://www.shiyinren.com/server/1/376711570.mp3',
    id: '0004'
  },
  {
    img: 'https://star.kuwo.cn/star/starheads/180/79/78/2507339289.jpg',
    name: '陪你穿行岁月',
    author: '水木年华&D-BAND',
    url: 'https://www.shiyinren.com/server/1/377068578.mp3',
    id: '0005'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
    name: '奢香夫人',
    author: '凤凰传奇',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
    id: '0006'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
    name: '空心',
    author: '光泽',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
    id: '0007'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
    name: '苦笑',
    author: '汪苏泷',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
    id: '008'
  },
  {
    img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
    name: '一生所爱',
    author: '卢冠廷 / 莫文蔚',
    url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
    id: '009'
  }
]
// export const muiscList: songItemType[] = [
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
//     name: '直到世界的尽头',
//     author: 'WANDS',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
//     id: '0000'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
//     name: '画',
//     author: '赵磊',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
//     id: '0001'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
//     name: 'Sweet Dreams',
//     author: 'TPaul Sax / Eurythmics',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
//     id: '0002'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
//     name: '奢香夫人',
//     author: '凤凰传奇',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
//     id: '0003'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
//     name: '空心',
//     author: '光泽',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
//     id: '0004'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
//     name: '反转地球',
//     author: '潘玮柏',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
//     id: '0005'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
//     name: 'No.9',
//     author: 'T-ara',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
//     id: '0006'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
//     name: '孤独',
//     author: 'G.E.M.邓紫棋',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
//     id: '0007'
//   },
//
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
//     name: 'Lose Control',
//     author: 'Hedley',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
//     id: '0008'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
//     name: '倩女幽魂',
//     author: '张国荣',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
//     id: '0009'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
//     name: '北京北京',
//     author: '汪峰',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
//     id: '0010'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
//     name: '苦笑',
//     author: '汪苏泷',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
//     id: '0011'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
//     name: '一生所爱',
//     author: '卢冠廷 / 莫文蔚',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
//     id: '0012'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
//     name: '月半小夜曲',
//     author: '李克勤',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
//     id: '0013'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
//     name: 'Rolling in the Deep',
//     author: 'Adele',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
//     id: '0014'
//   },
//   {
//     img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
//     name: '海阔天空',
//     author: 'Beyond',
//     url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
//     id: '0015'
//   }
// ]