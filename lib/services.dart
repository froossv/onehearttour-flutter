import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:onehearttour/classes.dart';

Future<String> getPosts(int id) async {
    final response = await http.get('http://onehearttour.herokuapp.com/posts/$id');
    if (response.statusCode == 200){
        return json.decode(response.body)['link'];
    }else{
        return 'null';
    }
}

Future<EventList> getEvents() async {
    final response = await http.get('http://onehearttour.herokuapp.com/events');
    if (response.statusCode == 200){
        print(response.body);
        return EventList.fromJson(json.decode(response.body));
    }else{
        return null;
    }
}

Future<FAQList> getFAQ() async {
    final response = await http.get('https://onehearttour.herokuapp.com/faq');
    if (response.statusCode == 200){
        return FAQList.fromJson(json.decode(response.body));
    }else{
        return null;
    }
}