class Post{
  String name;
  String link;

  Post(this.name,this.link);

  Post.fromJson(Map <String, dynamic> json) :
        name = json['name'],
        link = json['link'];

  Map <String, dynamic> toJson() =>
        {
          'name' : name,
          'link' : link,
        };
}