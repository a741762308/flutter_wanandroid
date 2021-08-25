import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/system_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/system/system_tab_list.dart';
import 'package:flutter_wanandroid_app/util/flutter_util.dart';
import 'package:rxdart/rxdart.dart';

class SystemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SystemState();
}

class _SystemState extends State<SystemPage>
    with AutomaticKeepAliveClientMixin {
  final List<SystemBean> _item = [];

  @override
  void initState() {
    super.initState();
    RestClient(Dio()).getSystemClassifyList().doOnData((value) {
      print("请求到体系数据：data length=${value.data?.length}");
      setState(() {
        _item.clear();
        _item.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stackTrace) {
      print(stackTrace);
    }).listen(null);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (c, i) {
        return InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  _item[i].name ?? "",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _getWarpChildren(_item[i]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color(0x10191919),
                            style: BorderStyle.solid))),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: ((context) {
              return SystemTabListPage(
                systemBean: _item[i],
              );
            })));
          },
        );
      },
      itemCount: _item.length,
    );
  }

  List<Widget> _getWarpChildren(SystemBean bean) {
    final List<Widget> widgets = [];
    List<SystemTag>? tags = bean.children;
    if (tags != null) {
      for (int i = 0; i < tags.length; i++) {
        SystemTag tag = tags[i];
        widgets.add(InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              color: FlutterUtil.nameColor(tag.name ?? "a"),
              child: Text(
                tag.name ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: ((context) {
              return SystemTabListPage(
                systemBean: bean,
                position: i,
              );
            })));
          },
        ));
      }
    }
    return widgets;
  }

  @override
  bool get wantKeepAlive => true;
}
