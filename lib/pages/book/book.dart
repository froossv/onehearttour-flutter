import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:onehearttour/classes.dart';
import 'package:onehearttour/services.dart';

class MyWebView extends StatelessWidget{
    final String url;
    final Completer<WebViewController> _controller = Completer<WebViewController>();

    MyWebView({
        @required this.url,
    });

    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: SafeArea(
                child: WebView(
                    initialUrl: url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                        _controller.complete(webViewController);
                    },
                ),
            )
        );
    }
}


class BookPage extends StatefulWidget {
    @override
    BookPageState createState() => BookPageState();
}

class BookPageState extends State<BookPage> {

    EventList events,temp;

    @override
    void initState() {
        super.initState();
        fetchEvents();
    }

    void fetchEvents() async {
        temp = await getEvents();
        if(!mounted){
            return;
        }else{
            setState(() {
              events = temp;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Book Tickets",style: TextStyle(color: Color(0xffffc021),fontSize: 25.0),),
            ),
            body: Column(
                children: <Widget>[
                    Card(
                        color: Colors.black12,
                        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                        child: Image.asset('assets/rahman.jpg'),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: events.events.length,
                        itemBuilder: (BuildContext context,int index){
                            return ExpansionTile(
                                leading: Icon(Icons.location_city,color: Color(0xffffc021),),
                                title: Text(events.events[index].location, style: TextStyle(color: Color(0xffffc021)),),
                                subtitle: Text(events.events[index].venue, style: TextStyle(color: Color(0xffffc021)),),
                                trailing: Icon(Icons.keyboard_arrow_down,color: Color(0xffffc021),),
                                children: <Widget>[
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                            Column(
                                                children: <Widget>[
                                                    Icon(Icons.date_range,color: Color(0xffffc021),),
                                                    Padding(
                                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                                        child: Text(events.events[index].date, style: TextStyle(color: Color(0xffffc021)),),
                                                    )
                                                ],
                                            ),
                                            GestureDetector(
                                                child: Column(
                                                    children: <Widget>[
                                                        Icon(IconData(0xF493,fontFamily: CupertinoIcons.iconFont,fontPackage: CupertinoIcons.iconFontPackage),color: Color(0xffffc021),),
                                                        Padding(
                                                            padding: EdgeInsets.symmetric(vertical: 10.0),
                                                            child: Text('Book Tickets', style: TextStyle(color: Color(0xffffc021)),),
                                                        )
                                                    ],
                                                ),
                                                onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                       builder: (BuildContext context) =>
                                                           MyWebView(url:events.events[index].link)
                                                    ));
                                                },
                                            )
                                        ],
                                    ),
                                ],
                            );
                        },
                    ),
                ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}