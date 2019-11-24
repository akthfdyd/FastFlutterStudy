class BlogPostResponseModel {
  String title;

  String author;
  String profileImageUrl;
  String featuredImageUrl;
  String link;
  String content;

  BlogPostResponseModel(this.title, this.author, this.profileImageUrl,
      this.featuredImageUrl, this.link, this.content);

  factory BlogPostResponseModel.fromJson(Map<String, dynamic> json) {
//    print(json['title']['rendered']);
//    print(json['link']);
//    print(json['content']['rendered']);
    var featuredImageUrl = "";
    try {
      var dataList = json['_embedded']['wp:featuredmedia'];
//      print(dataList);
      if (dataList.length > 0) {
        if (dataList[0]['media_details'] != null) {
//          print(dataList[0]['media_details']);
          featuredImageUrl =
              dataList[0]['media_details']['sizes']['thumbnail']['source_url'];
        }
      }
    } on Exception catch (e) {
      print(e.toString());
    } on Error catch (e) {
      e.stackTrace;
    }
    var authorName = "";
    var authorImage = "";
    try {
      var authorList = json['embedded']['author'];
//      print(authorList);
      if (authorList.length > 0) {
        if (authorList[0]['name'] != null) {
//          print(authorList[0]['name']);
          authorName = authorList[0]['name'];
        }
        if (authorList[0]['avatarUrls']['x96'] != null) {
//          print(authorList[0]['name']);
          authorImage = authorList[0]['avatarUrls']['x96'];
        }
      }
    } on Exception catch (e) {
      print(e.toString());
    } on Error catch (e) {
      e.stackTrace;
    }
    return BlogPostResponseModel(
      json['title']['rendered'],
      authorName,
      authorImage,
//      json['embedded']['author'][0]['name'],
//      json['embedded']['author'][0]['avatarUrls']['x96'],
      featuredImageUrl,
      json['link'],
      json['content']['rendered'],
    );
  }
}
