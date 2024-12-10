import 'Article.dart';

/// status : "ok"
/// totalResults : 400
/// message : ""
/// code : ""
/// articles : [{"source":{"id":"wired","name":"Wired"},"author":"Joel Khalili","title":"As Trump Takes a Victory Lap, the Crypto Faithful Kiss the Ring","description":"The crypto industry is celebrating the return of Donald Trump to the White House in anticipation of an easier ride under his regime.","url":"https://www.wired.com/story/trump-crypto-support/","urlToImage":"https://media.wired.com/photos/672bda0a90a94384370310f4/191:100/w_1280,c_limit/business_crypto_faithful_trump.jpg","publishedAt":"2024-11-06T21:11:39Z","content":"On the campaign trail, Trump went out of his way to court their favor. In July, speaking to thousands of bitcoiners at a conference in Nashville, Tennessee, Trump duly sang from the bitcoin hymn shee… [+2014 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Makena Kelly, Joel Khalili","title":"The Crypto Industry Is Helping Trump Pick SEC Chair","description":"The president-elect's transition team is consulting with industry leaders as it vets potential replacements for outgoing chair Gary Gensler, sources tell WIRED.","url":"https://www.wired.com/story/crypto-candidates-front-runners-sec-race/","urlToImage":"https://media.wired.com/photos/6745db10e149b18ca8e2b8d8/191:100/w_1280,c_limit/GettyImages-93181618.jpg","publishedAt":"2024-11-26T16:23:34Z","content":"In July, at a bitcoin conference in Nashville, Tennessee, Trump pledged to fire Gensler if reelected, drawing perhaps the most raucous applause of the night. I will appoint an SEC chair who will buil… [+2635 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Lauren Goode, Paresh Dave, Will Knight","title":"What Donald Trump's Win Will Mean for Big Tech","description":"Donald Trump's approach to Big Tech has oscillated between calls for stricter regulations for some players and a hands-off approach for others. Here's how he might steer tech policy in a second term.","url":"https://www.wired.com/story/trump-tech-policy/","urlToImage":"https://media.wired.com/photos/672bcd1062c380013856bb0f/191:100/w_1280,c_limit/Business_bigtech_GettyImages-697900116.jpg","publishedAt":"2024-11-07T20:00:17Z","content":"The most raucous cheers of the night were prompted by Trumps promise to fire Gary Gensler, chairman of the Securities and Exchange Commission, a regulatory agency that has brought a volley of lawsuit… [+2787 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Condé Nast","title":"Battling Big Pharma: A Conversation with Mark Cuban","description":"His time on Shark Tank may be over, but this serial investor is just getting started. The Cost Plus Drugs founder shares how he’s demolishing–and rebuilding–the prescription drug industry with WIRED’s Lauren Goode.","url":"https://www.wired.com/video/watch/battling-big-pharma-a-conversation-with-mark-cuban/","urlToImage":"https://dwgyu36up6iuz.cloudfront.net/heru80fdn/image/upload/c_fill,d_placeholder_wired.png,fl_progressive,g_face,h_1080,q_80,w_1920/v1733344820/wired_battling-big-pharma-a-conversation-with-mark-cuban.jpg","publishedAt":"2024-12-04T17:00:00Z","content":"Thank you so much for being here.\r\nI don't think our next guest needs much of an introduction,\r\nbut I've been given one, so I'm excited\r\nto welcome entrepreneur co-founder of Cost Plus Drugs,\r\nMark C… [+30920 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Lily Hay Newman, Matt Burgess, Andrew Couts","title":"Bitfinex Hacker Gets 5 Years for $10 Billion Bitcoin Heist","description":"Plus: An “AI granny” is wasting scammers’ time, a lawsuit goes after spyware-maker NSO Group’s executives, and North Korea–linked hackers take a crack at macOS malware.","url":"https://www.wired.com/story/bitfinex-hacker-gets-5-years-for-10-billion-bitcoin-heist/","urlToImage":"https://media.wired.com/photos/673771b3001830e36802c13c/191:100/w_1280,c_limit/sec-roundup-1633746142.jpg","publishedAt":"2024-11-16T11:30:00Z","content":"In perhaps the most adorable hacker story of the year, a trio of technologists in India found an innovative way to circumvent Apples location restrictions on AirPod Pro 2s so they could enable the ea… [+5950 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Andy Greenberg, Lily Hay Newman","title":"The WIRED Guide to Protecting Yourself From Government Surveillance","description":"Donald Trump has vowed to deport millions and jail his enemies. To carry out that agenda, his administration will exploit America’s digital surveillance machine. Here are some steps you can take to evade it.","url":"https://www.wired.com/story/the-wired-guide-to-protecting-yourself-from-government-surveillance/","urlToImage":"https://media.wired.com/photos/673169bb0e6c22440a072972/191:100/w_1280,c_limit/WIRED-Guide-Survailance-Deena-So-Oteh.jpg","publishedAt":"2024-11-12T11:30:00Z","content":"If youre trying to not be tracked, not having a phone is often the easiest, Sandvik says. Leave it at home.\r\nFor most people most of the time, though, this solution isnt practical. You can put your d… [+3375 chars]"}]

class ArticlesRespons {
  ArticlesRespons({
      this.status, 
      this.totalResults, 
      this.message, 
      this.code, 
      this.articles,});

  ArticlesRespons.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    message = json['message'];
    code = json['code'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  String? message;
  String? code;
  List<Article>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['message'] = message;
    map['code'] = code;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}