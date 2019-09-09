import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_jinrizaixian/http/http_url.dart';
import 'package:flutter_jinrizaixian/model/goodsListModel.dart';


class GoodsListWt extends StatefulWidget {
  GoodsListWt({Key key}) : super(key: key);

  _GoodsListWtState createState() => _GoodsListWtState();
}

class _GoodsListWtState extends State<GoodsListWt> {
  List goodsList = [];

  @override
  void initState() { 
    this.getGoodsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: goodsList.map((item) {
          i++;
          return _GoodsSingle(item, i);
        }).toList(),
      )
    );
  }

  void getGoodsData() {
    getCategoryData({}).then((res) {
      GoodsListModel modelRes = GoodsListModel.fromJson(res);
      setState(() {
        goodsList = modelRes.data;  
      });
    });
  }

  Widget _GoodsSingle(data, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ContainerSingle(data, index),
        _ContainerSingle(data, index)
      ],
    );
  }

  Widget _ContainerSingle(data, index) {
    return Container(
      width: ScreenUtil().setWidth(330.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.green)
      ),
      child: Column(
        children: <Widget>[
          Image.network(
            data.image,
            fit: BoxFit.cover,
          ),
          Text(
            '商品名称: ${data.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                '原价${data.price}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough
                )
              ),
              Text(
                '促销价${data.mallPrice}',
                style: TextStyle(
                  color: Colors.red
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
