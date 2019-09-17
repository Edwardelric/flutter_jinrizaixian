import 'package:flutter/material.dart';
import 'package:flutter_jinrizaixian/model/good_category_list.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_jinrizaixian/http/http_url.dart';

import 'package:provide/provide.dart';
import 'package:flutter_jinrizaixian/provide/counter.dart';

import 'package:flutter_jinrizaixian/provide/child_category.dart';
import 'package:flutter_jinrizaixian/provide/category_goods_list.dart';
import 'package:flutter_jinrizaixian/mock/good_category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('点击分享');
            },
            icon: Icon(Icons.share)
          )
        ],
      ),
      body: ProvideDemo()
      // body: Row(
      //   children: <Widget>[
      //     _LeftCategoryNav(),
      //     Column(
      //       children: <Widget>[
      //         _RightCategoryNav(),
      //         CategoryGoodsList()
      //       ],
      //     )
      //   ],
      // )
    );
  }
}

class _LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNav({Key key}) : super(key: key);

  __LeftCategoryNavState createState() => __LeftCategoryNavState();
}

class __LeftCategoryNavState extends State<_LeftCategoryNav> {
  List list = [];
  int listIndex = 0;
  
  @override
  void initState() { 
    this.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftCategoryInkWell(index);
        },
      ),
    );
  }

  void getCategory() {
    getCategoryListData().then((val) {
      print(val);
      GoodCategoryModel category = GoodCategoryModel.fromJson(val);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategory>(context).getChildCategory(list[0].bxMallSubDto,list[0].mallCategoryId);
    });
  }

  Widget _leftCategoryInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;

    return InkWell(
      onTap: (){
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        var categoryId= list[index].mallCategoryId;
        Provide.value<ChildCategory>(context).getChildCategory(childList, categoryId);
      },
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(100),
        decoration: BoxDecoration(
          color: isClick ? Colors.black26 : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey),
          )
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }

}

class _RightCategoryNav extends StatefulWidget {
  _RightCategoryNav({Key key}) : super(key: key);

  __RightCategoryNavState createState() => __RightCategoryNavState();
}

class __RightCategoryNavState extends State<_RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<ChildCategory>(
        builder: (context, child, childCategory) {
          return Container(
            width: ScreenUtil().setWidth(570),
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              )
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.childCategoryList.length,
              itemBuilder: (context, index) {
                return _rightInkWell(index, childCategory.childCategoryList[index]);
              },
            )
          );
        }
      )
    );
  }

  Widget _rightInkWell(int index, BxMallSubDto item) {
    bool isCheck = false;
    isCheck =(index==Provide.value<ChildCategory>(context).childIndex)?true:false;
    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: InkWell(
        onTap: () {
          Provide.value<ChildCategory>(context).changeChildIndex(index);
        },
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize:ScreenUtil().setSp(28),
            color: isCheck ? Colors.pink : Colors.black
          ),
        ),
      )
    );
  }
}

class CategoryGoodsList extends StatefulWidget {
  CategoryGoodsList({Key key}) : super(key: key);

  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List list = [];
  @override
  void initState() {
    this._getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, categoryGoodsListProvide) {
        return Expanded(
          child: Container(
            width: ScreenUtil().setWidth(570),
            child: ListView.builder(
              itemCount: categoryGoodsListProvide.goodsList.length,
              itemBuilder: (context, index) {
                return _listWidget(categoryGoodsListProvide.goodsList, index);
              },
            )
          ),
        );
      },
    );
  }

  void _getGoodList({String categoryId}) {
    Map data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': '',
      'page': 1
    };
    getCategoryList(data).then((val) {
      GoodCategoryList goodsList = GoodCategoryList.fromJson(val);
      setState(() {
        list = goodsList.data;
      });
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(list);
    });
  }

  Widget _listWidget(List newList, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index)
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _goodsImage(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28)
        )
      )
    );
  }

  Widget _goodsPrice(List newList, int index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            '价格:￥${newList[index].presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            )
          ),
          Text(
            '￥${newList[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            )
          ),
        ],
      )
    );
  }
}

class ProvideDemo extends StatelessWidget {
  const ProvideDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton(),
          ],
        ),
      )
    );
  }
}

class Number extends StatelessWidget {
  const Number({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:200),
      child: Provide<Counter>(
        builder: (context,child,counter){
          return Text(
            '${counter.value}',
          );
        },
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text('递增')
      ),
    );
  }
}