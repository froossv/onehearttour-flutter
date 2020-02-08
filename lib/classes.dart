class _Event{
    String location;
    String venue;
    String date;
    String link;

    _Event({this.location,this.venue,this.date,this.link});

    factory _Event.fromJson(Map<String,dynamic> json){
        return _Event(location: json['location'], venue: json['Venue'], date: json['date'], link: json['link']);
    }
}
class EventList{
    List<_Event> events;

    EventList({this.events});

    factory EventList.fromJson(List<dynamic> json){
        List<_Event> eventMap = new List<_Event>();
        eventMap = json.map((i) => _Event.fromJson(i)).toList();
        return new EventList(events: eventMap);
    }
}

class _FAQ{
    String question;
    String answer;

    _FAQ({this.question,this.answer});

    factory _FAQ.fromJson(Map<String,dynamic> json){
        return _FAQ(question: json['question'], answer: json['answer']);
    }
}
class FAQList{
    List<_FAQ> faqs;

    FAQList({this.faqs});

    factory FAQList.fromJson(List<dynamic> json){
        List<_FAQ> faqmap = new List<_FAQ>();
        faqmap = json.map((i) => _FAQ.fromJson(i)).toList();
        return new FAQList(faqs: faqmap);
    }
}