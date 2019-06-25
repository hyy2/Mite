import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

import 'package:mite/db/table/metting_record.dart';
import 'package:mite/db/db_action_impl.dart';
import 'package:mite/db/db_action.dart';

//text: "客户第一 | 团结协作 | 重在执行 | 激情澎湃 | 积德行善",
// ignore: must_be_immutable
class PageMeetingAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PageMeetingAddState();
  }
}

class PageMeetingAddState extends State<PageMeetingAdd> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增会议记录'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          //显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MeetingType(),
            MeetingAddTime(),
            new Divider(height: 1.0),
            MeetingContentInput(),
          ],
        ),
      )),
    );
  }
}

class MeetingContentInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MeetingContentInputState();
  }
}

class MeetingContentInputState extends State<MeetingContentInput> {
  var groupName;
  var memberName;
  var projectName;
  var workConent;
  var culture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        children: <Widget>[
          _buildTeamName(),
          _buildMemberName(),
          _buildProjectName(),
          _buildWorkContent(),
          _buildCulture(),
          _buildSubmitBtn()
        ],
      ),
    );
  }

  _buildTeamName() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.card_membership),
        labelText: '请输入你所在团队)',
      ),
      onChanged: getInputGroupName,
      autofocus: false,
    );
  }

  _buildMemberName() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.nature_people),
        labelText: '请输入成员名单)',
      ),
      onChanged: getInputMember,
      autofocus: false,
    );
  }

  _buildProjectName() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.print),
        labelText: '请输入你参与的项目名称)',
      ),
      onChanged: getInputProjectName,
      autofocus: false,
    );
  }

  _buildWorkContent() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.work),
        labelText: '请输入你详细的工作内容)',
      ),
      onChanged: getInputWorkContent,
      autofocus: false,
    );
  }

  _buildCulture() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        icon: Icon(Icons.business),
        labelText: '请输入请输入企业文化)',
      ),
      onChanged: getInputWorkCulture,
      autofocus: false,
    );
  }

  _buildSubmitBtn() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              onPressed: submit,
              //通过控制 Text 的边距来控制控件的高度
              child: new Padding(
                padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                child: new Text("提交"),
              ),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    print("groupName" +
        groupName +
        "\n" +
        "projectName" +
        projectName +
        "\n" +
        "workConent" +
        workConent +
        "\n" +
        "culture" +
        culture +
        "\n" +
        "memberName" +
        memberName +
        "\n");
  }

//
  ///获取团队名称
  void getInputGroupName(String value) {
    groupName = value;
  }

  ///获取项目名称
  void getInputProjectName(String value) {
    projectName = value;
  }

  ///获取详细的工作内容
  void getInputWorkContent(String value) {
    workConent = value;
  }

  ///获取企业文化
  void getInputWorkCulture(String value) {
    culture = value;
  }

  ///获取成员组成
  void getInputMember(String value) {
    memberName = value;
  }
}

class MeetingAddTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MeetingAddTimeState();
  }
}

class MeetingAddTimeState extends State<MeetingAddTime> {
  var dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              " 时间: ",
              textScaleFactor: 1.2,
            ),
            Text(
              dateTime.toString(),
              textScaleFactor: 1.2,
            ),
          ]),
    );
  }
}

class MeetingType extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MeetingTypeState();
  }
}

class MeetingTypeState extends State<MeetingType> {
  String meetingType = "TYPE_MORING";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RadioListTile<String>(
            value: 'TYPE_MORING',
            title: Text('晨会'),
            groupValue: meetingType,
            onChanged: (value) {
              setState(() {
                meetingType = value;
              });
            },
          ),
        ),
        Flexible(
          child: RadioListTile<String>(
            value: 'TYPE_EVENING',
            title: Text('夕会'),
            groupValue: meetingType,
            onChanged: (value) {
              setState(() {
                meetingType = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

//  DateTime _dateTime;
//  var result;
//  DbAction dbAction = new DbActionImpl();
//  var groupName;
//  var memberName;
//  var projectName;
//  var workConent;
//  var culture;
//  String meetingType = 'TYPE_MORING';
//  _dateTime = new DateTime.now();

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('新增会议记录'),
//        ),
//        body: Column(
//          //测试Row对齐方式，排除Column默认居中对齐的干扰
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Flexible(
//                  child: RadioListTile<String>(
//                    value: 'TYPE_MORING',
//                    title: Text('晨会'),
//                    groupValue: meetingType,
//                    onChanged: (value) {
//                      setState(() {
//                        meetingType = value;
//                      });
//                    },
//                  ),
//                ),
//                Flexible(
//                  child: RadioListTile<String>(
//                    value: 'TYPE_EVENING',
//                    title: Text('夕会'),
//                    groupValue: meetingType,
//                    onChanged: (value) {
//                      setState(() {
//                        meetingType = value;
//                      });
//                    },
//                  ),
//                ),
//              ],
//            ),
//            Row(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  " 时间: ",
//                  textScaleFactor: 1.2,
//                ),
//                Text(
//                  _dateTime.toString(),
//                  textScaleFactor: 1.2,
//                ),
//              ],
//            ),
//            TextField(
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.all(10.0),
//                icon: Icon(Icons.text_fields),
//                labelText: '请输入你所在团队)',
//                helperText: '请输入你的团队名称',
//              ),
//              onChanged: getInputGroupName,
//              autofocus: false,
//            ),
//            TextField(
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.all(10.0),
//                icon: Icon(Icons.text_fields),
//                labelText: '请输入成员名单)',
//                helperText: '请输入你的成员',
//              ),
//              onChanged: getInputMember,
//              autofocus: false,
//            ),
//            TextField(
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.all(10.0),
//                icon: Icon(Icons.text_fields),
//                labelText: '请输入项目)',
//                helperText: '请输入你参与的项目名称',
//              ),
//              onChanged: getInputProjectName,
//              autofocus: false,
//            ),
//            TextField(
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.all(10.0),
//                icon: Icon(Icons.text_fields),
//                labelText: '请输入你的工作内容)',
//                helperText: '请输入你详细的工作内容',
//              ),
//              onChanged: getInputWorkContent,
//              autofocus: false,
//            ),
//            TextField(
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.all(10.0),
//                icon: Icon(Icons.text_fields),
//                labelText: '请输入企业文化)',
//                helperText: '请输入请输入企业文化',
//              ),
//              onChanged: getInputWorkCulture,
//              autofocus: false,
//            ),
//            new Padding(
//              padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
//              child: new Row(
//                children: <Widget>[
//                  new Expanded(
//                    child: new RaisedButton(
//                      onPressed: submit,
//                      //通过控制 Text 的边距来控制控件的高度
//                      child: new Padding(
//                        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
//                        child: new Text("提交"),
//                      ),
//                      color: Colors.blue,
//                      textColor: Colors.white,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ));
//  }
//
//  void _textFieldChanged(String str) {
//    print(str);
//  }
