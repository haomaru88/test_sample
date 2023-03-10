import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BoxConstraintEx extends StatelessWidget {
  static const String routeName = '/box_constraint/dismissible';

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Box Constraint TEST'),
      ),
//        body: getContainer(),
      body: getColumn(),
//        body: getRow(),
//        body: getContainerWithSizeBox(),
//        body: getListView(),
//        body: getListViewInnerListView(),
//        body: getButtons(context),
    );
  }

  Widget getContainerWithSizeBox() {
    return Container(
      color: Colors.green,
      child: SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }

  Widget getContainer() {
    return Container(
        constraints:
            BoxConstraints(maxHeight: 400, maxWidth: 400, minWidth: 300, minHeight: 300),
        color: Colors.yellow,
        child: Center(
            child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        )));
  }

  Widget getColumn() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getTextList(),
      ),
    );
  }

  Widget getRow() {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getTextList(),
      ),
    );
  }

  Widget getListView() {
    return Container(
        constraints: BoxConstraints(
          maxWidth: 200,
        ),
        color: Colors.yellow,
        child: ListView(
          children: <Widget>[
            Card(child: Text('Hello everyone~')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
            ListTile(title: Text('Nice to see you')),
          ],
        ));
  }

  Widget getListViewInnerListView() {
    return Container(
        constraints:
            BoxConstraints(maxHeight: double.infinity, maxWidth: double.infinity),
        color: Colors.yellow,
        child: ListView(
          // ????????? ?????? ??????. ??????????????? ?????????????????? ??????
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              //Container?????? ListView??? ?????? ???????????? ?????? ?????? ???.
              width: 160.0,
              color: Colors.blue,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: getListList(),
              ),
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            )
          ],
        ));
  }

  List<Widget> getTextList() {
    return <Widget>[
      Container(
        child: getTestText('1???'),
        color: Colors.lightBlue,
      ),
      Container(
        child: getTestText('2???'),
        color: Colors.lightBlue,
      ),
      Container(
        child: getTestText('3???'),
        color: Colors.lightBlue,
      ),
      Container(
        child: getTestText('4???'),
        color: Colors.lightBlue,
      ),
      Container(
        child: getTestText('5???'),
        color: Colors.lightBlue,
      ),
    ];
  }

  List<Widget> getListList() {
    return <Widget>[
      getContainerText('1???'),
      getContainerText('2???'),
      getContainerText('3???'),
      getContainerText('4???'),
      getContainerText('5???'),
      getContainerText('6???'),
      getContainerText('7???'),
      getContainerText('8???'),
      getContainerText('9???'),
      getContainerText('10???'),
      getContainerText('11???'),
      getContainerText('12???'),
      getContainerText('13???'),
      getContainerText('14???'),
      getContainerText('15???'),
      getContainerText('16???'),
      getContainerText('17???'),
      getContainerText('18???'),
      getContainerText('19???'),
      getContainerText('20???'),
      getContainerText('21???'),
      getContainerText('22???'),
      getContainerText('23???'),
      getContainerText('24???'),
      getContainerText('25???'),
      getContainerText('26???'),
    ];
  }

  Widget getContainerText(String data) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: getTestText(data),
      color: Colors.lightBlue,
    );
  }

  Widget getTestText(String showData) {
    return Text(
      showData,
      style: TextStyle(fontSize: 26),
    );
  }

  Widget getButtons(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: double.infinity,
      constraints: BoxConstraints(
        maxWidth: double.infinity,
      ),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text('????????????'),
              onPressed: () => showAlertDialog(context),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              child: Text('????????????2'),
              onPressed: () => showAlertDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Demo'),
          content: Text("Select button you want"),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
