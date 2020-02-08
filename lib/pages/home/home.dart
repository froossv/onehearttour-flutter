import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:onehearttour/services.dart';

class HomePage extends StatefulWidget {
    @override
    HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

    List<String> postUrls = new List();
    int _globalIndex = 1;
    ScrollController _scrollController = new ScrollController();

    @override
    void initState(){
        super.initState();
        fetchPosts();

        _scrollController.addListener((){
            if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
                fetchPosts();
            }
        });
    }

    @override
    void dispose(){
        _scrollController.dispose();
        super.dispose();
    }

    void fetchPosts() async{
        for(int i=0;i<2;i++){
            String url = await getPosts(_globalIndex);
            if(!mounted){
                return;
            }
            setState(() {
                postUrls.add(url);
                _globalIndex++;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("One Heart Tour",style: TextStyle(color: Color(0xffffc021),fontSize: 25.0),),
            ),
            body: ListView.builder(
                controller: _scrollController,
                itemCount: postUrls.length,
                itemBuilder: (BuildContext context, int index){
                    if(postUrls[index] != ''){
                        return Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Card(
                                color: Color(0xff333333),
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                        ListTile(
                                            leading: Icon(Icons.music_note,color: Color(0xffffc021)),
                                            title: Text('One Heart Tour',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffc021)),),
                                            subtitle: Text('Pune',style: TextStyle(color: Color(0xfffff2d2))),
                                            trailing: GestureDetector(
                                                child: Icon(Icons.share,color: Color(0xffffc021)),
                                                onTap: (){
                                                    Share.share("Checkout One Heart Tour 2020 by A.R.Rahman! : https://insider.in/ar-rahman-live-in-pune-one-heart-tour-feb22-2020/event");
                                                },
                                            ),
                                        ),
                                        Image.network(postUrls[index], fit: BoxFit.fitWidth)
                                    ],
                                ),
                            )
                        );
                    }else{
                        return Container();
                    }
                },
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}
