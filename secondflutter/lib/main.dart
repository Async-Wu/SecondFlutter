import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
//void main() {
//  runApp(MyApp());
//}
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void getWeatherData() async{
    try{
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(
        Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"),
      );
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      print(result);
      httpClient.close();
    }catch(e){
      print("请求错误");
      print(e.toString());
    }finally{

    }
  }
  @override
  Widget build(BuildContext context) {
    final appName = 'httpClient请求示例';
    return MaterialApp(
      title: appName,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("获取天气数据"),
            onPressed: getWeatherData,
          ),
        ),
      ),
//      home: new Scaffold(
//        appBar:new AppBar(
//          title: new Text(appName),
//        ),
//        body: new Center(
//          child: new RaisedButton(
//              onPressed: (){
//                const url = 'https://httpbin.org';
//                http.get(url).then((response){
//                  print("状态: ${response.statusCode}");
//                  print("正文: ${response.body}");
//                });
//                launch(url);
////              },
//          ),
//        ),
//      ),
    );
  }


}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}):super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;
  void _incementCounter(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}




