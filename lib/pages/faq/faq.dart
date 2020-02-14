import 'package:flutter/material.dart';
import 'package:onehearttour/classes.dart';
import 'package:onehearttour/services.dart';

class FaqPage extends StatefulWidget {
    @override
    FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {

    FAQList faq,temp;

    @override
    void initState() {
        super.initState();
        fetchEvents();
    }

    void fetchEvents() async {
        temp = await getFAQ();
        if(!mounted){
            return;
        }else{
            setState(() {
                faq = temp;
            });
        }
    }

    Widget _buildWidget(){
        if(faq != null){
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: faq.faqs.length,
                itemBuilder: (BuildContext context,int index){
                    return Card(
                        color: Color(0xff333333),
                        child: ListTile(
                            title: Text(faq.faqs[index].question,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffc021)),),
                            subtitle: Text(faq.faqs[index].answer,style: TextStyle(color: Color(0xfffff2d2))),
                        ),
                    );
                },
            );
        }else{
            return Container(
                child: Center(
                    child: CircularProgressIndicator(),
                )
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("FAQ",style: TextStyle(color: Color(0xffffc021),fontSize: 25.0))
            ),
            body: _buildWidget() // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}