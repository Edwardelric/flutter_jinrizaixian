import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

import 'dart:convert';
import 'dart:io' as H;
import 'package:fluwx/fluwx.dart' as fluwx;

class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  String _url = "https://wxpay.wxutil.com/pub_v2/app/app_pay.php";

  String _result = "无";

  @override
  void initState() {
    super.initState();


    fluwx.responseFromPayment.listen((data) {
      setState(() {
        _result = "${data.errCode}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pay"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () async {
              var h = H.HttpClient();
              h.badCertificateCallback = (cert, String host, int port) {
                return true;
              };
              var request = await h.getUrl(Uri.parse(_url));
              var response = await request.close();
              var data = await Utf8Decoder().bind(response).join();
              // print(data);
              Map<String, dynamic> result = json.decode(data);
              print(result['appid']);
              print(result["timestamp"]);
              fluwx
                  .pay(
                appId: result['appid'].toString(),
                partnerId: result['partnerid'].toString(),
                prepayId: result['prepayid'].toString(),
                packageValue: result['package'].toString(),
                nonceStr: result['noncestr'].toString(),
                timeStamp: result['timestamp'],
                sign: result['sign'].toString(),
              )
                  .then((data) {
                print("---》$data");
              });
            },
            child: const Text("pay"),
          ),
          const Text("响应结果;"),
          Text(_result)
        ],
      ),
    );
  }
}

// class MemberPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         child: Provide<Counter>(
//         builder: (context,child,counter){
//           return Text(
//             '${counter.value}',
//              style: Theme.of(context).textTheme.display1,
//           );
//         },
//       ),
//       )
//     );
//   }
// }