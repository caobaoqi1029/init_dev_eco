export default class Song{
  id:number=-1;
  name:string='';
  author:string='';
  src:string='';
  img:string='';
  constructor(id:number, name:string,author:string,src:string,img:string){
    this.id=id;
    this.name=name;
    this.author=author;
    this.src=src;
    this.img=img;
  }
}

