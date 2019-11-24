import 'package:fast_flutter_study/ServerApi.dart';
import 'package:fast_flutter_study/common/Global.dart';
import 'package:fast_flutter_study/model/BlogPostResponseModel.dart';
import 'package:flutter/material.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<BlogPostResponseModel> posts;

  var listItems = <Widget>[];

  @override
  void initState() {
    super.initState();
    _fetchDataAndRefresh();
  }

  @override
  Widget build(BuildContext context) {
    listItems = <Widget>[];
    if (posts != null) {
      for (final info in posts) {
        listItems.add(
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildFeaturedImageContainer(info),
                Flexible(
                  child: Text(
                    info.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Global.postUrl = info.link;
              Navigator.pushNamed(context, "/blogcontent");
            },
          ),
        );
      }
    }

    if (posts != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: listItems,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Hell world"),
        ),
      );
    }
  }

  Container buildFeaturedImageContainer(BlogPostResponseModel info) {
    if (info.featuredImageUrl != "") {
      return Container(
        height: 120.0,
        margin: EdgeInsets.only(right: 20.0, top: 5, bottom: 5),
        child: Container(
          child: Image.network(
            info.featuredImageUrl,
            fit: BoxFit.cover,
          ),
          width: 120,
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 20.0, top: 5, bottom: 5),
        width: 0,
        height: 120.0,
      );
    }
  }

  Future<void> _fetchDataAndRefresh() async {
    try {
      final postList = await ServerApi.fetchBlogPostResponseModelList({});
      setState(() {
        posts = postList;
      });
    } on ServerApiException catch (e) {
      print(e.toString());
    }
  }
}
