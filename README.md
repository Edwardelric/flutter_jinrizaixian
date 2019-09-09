# flutter_jinrizaixian

## install
  * 

## Introduce
  * Flutter 是 Google推出并开源的移动应用开发框架，主打跨平台、高保真、高性能
  * 特点
    * 跨平台自绘引擎
    * 高性能

## 环境搭建    
  * flutter doctor
  * flutter run 
  * flutter pub get  

## Tips: 
  * Container Widget
    ```
    Container(
      width: 300.0,                       // 宽度
      height: 200.0,                      // 高度
      margin: EdgeInsets.all(50.0),       // margin
      alignment: Alignment.center,        // 对齐方式
      decoration: BoxDecoration(          // 装饰
        color: Colors.blue,               // 颜色
        border: Border.all(               // 边框
          color: Colors.green,            // 边框颜色
          width: 10.0                     // 边框宽度
        ),
        borderRadius: BorderRadius.all(   // 边框圆角
          Radius.circular(5.0)
        ),
      ),
      child: Text('aa'),
    )
    ```
  * Text Widget
    ```
    Text(
      '123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789',
      textAlign: TextAlign.right,       // 对其位置,
      textDirection: TextDirection.ltr, // 换行后文字靠左还是靠右,
      overflow: TextOverflow.ellipsis,  // 超出maxLine后，超出文字处理方式,
      maxLines: 2,                      // 文字显示的最大行数,
      textScaleFactor: 1,               // 字体大小倍率,
      style: TextStyle(
        color: Colors.green,            // 字体颜色
        fontSize: 20.0,                 // 字体大小
        decoration: TextDecoration.lineThrough,   // 字体增加删除线
        decorationColor: Colors.white,            // 装饰的颜色
        decorationStyle: TextDecorationStyle.dotted,  // 装饰的样式
      ),
    )
    ```

  * Image
  ```
  Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.green
      ),
      child: Image.asset('lib/assets/imgs/xi.jpeg'),
      child: Image.network('
        https://img.alicdn.com/tps/i4/TB1e.ipe4n1gK0jSZKPSutvUXXa.jpg_q90_.webp',
        alignment: Alignment.topCenter,  // 对齐方式
        color: Colors.yellow,            // 背景颜色
        colorBlendMode: BlendMode.darken,// 滤镜
        fit: BoxFit.cover,               // 填充区域但不变形
      )
    );
  ```
  ```
  container圆角图
  Container(
      width: 300.0,
      height: 300.0,
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(150),
        image: DecorationImage(
          image: NetworkImage('https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Text('aabbcc'),
    );
  ```
  ```
  clipOval圆角图
  Container(
      alignment: Alignment.center,
      child: ClipOval(
        child: Image.network(
          'https://img.alicdn.com/simba/img/TB1yqzkdWWs3KVjSZFxSuuWUXXa.jpg',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      )
    );
  ```

  * ListView 
    scrollDirection: Axios.horizontal | Axios.vertical 水平垂直列表
    padding: 

  * GridView
    GridView 高度无法定义，是通过内部子元素计算而得
    ```
    GridView.count(
        crossAxisCount: 3,          // 定义了列数
        crossAxisSpacing: 20.0,     // 定义了纵向间距
        mainAxisSpacing: 20.0,      // 横向间距
        childAspectRatio: 0.3       // 宽度/高度比例
      )
    );
    ```  

## Appbar
  ```
  // PopupMenuButton(
    //   itemBuilder: (BuildContext context) => <PopupMenuItem<String>> [
    //     new PopupMenuItem(
    //       value:"选项一的内容",
    //       child: new Text("选项一")
    //     ),
    //     new PopupMenuItem(
    //       value: "选项二的内容",
    //         child: new Text("选项二")
    //     )
    //   ]
    // ),
  ```


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
