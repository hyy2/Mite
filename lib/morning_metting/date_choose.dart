import 'package:flutter/material.dart';

import 'package:mite/morning_metting/date.dart';
import 'package:mite/db/table/metting_record.dart';

class CustomeDateWidget extends StatefulWidget {

  final callback;
  CustomeDateWidget({Key key, this.callback})
    :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CustomeDateState();
  }
}

class _CustomeDateState extends State<CustomeDateWidget> {
  List<DateItem> _dateArray = new List();
  int _lastIndex;
  int _index;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _dateArray.add(new DateItem(choose: false, date: '2019-06-24'));
    _dateArray.add(new DateItem(choose: false, date: '2019-06-25'));
    _dateArray.add(new DateItem(choose: false, date: '2019-06-26'));
    _dateArray.add(new DateItem(choose: false, date: '2019-06-27'));
    _dateArray.add(new DateItem(choose: false, date: '2019-06-28'));


    _index = _dateArray.length - 1;
    _lastIndex = 0;
    _scrollController = ScrollController(initialScrollOffset: (_index - 1) * 100.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.blue,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      height: 60,
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: new Row(
          children: <Widget>[
            _getMoreDateWidget(),
            _dateChoose()
          ],
        ),
      ),
    );
  }

  Widget _getMoreDateWidget() {
    return new GestureDetector(
      child: new Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        padding: EdgeInsets.only(left: 10),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("image/arrow_back_white.png",
                  width: 15, height: 20, fit: BoxFit.fill),
            ),
            Container(
              child: Text('日历',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              padding: EdgeInsets.only(right: 10),
            )
          ],
        ),
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text("请选择日期！"),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
            action: new SnackBarAction(
              label: "了解",
              onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
            ),
          ),
        );
      },
    );
  }

  Widget _dateChoose() {
    return Expanded(
      child: ListView.separated(
          itemCount: _dateArray.length,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            if (_index == index) {
              return Container(
                  width: 100,
                  height: 60,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${_dateArray[index].date}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ));
            }
            return GestureDetector(
              child: Container(
                  width: 100,
                  height: 60,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "${_dateArray[index].date}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )),
              onTap: () {
                this.setState(() {
                  widget.callback(_dateArray[_index].date);
                  this._lastIndex = this._index;
                  this._index = index;
                });
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.white,
              )),
    );
  }

  
}
