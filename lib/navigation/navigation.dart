import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/navigation_dart.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/util/route_util.dart';
import 'package:rxdart/rxdart.dart';

///导航
class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationPage>
    with AutomaticKeepAliveClientMixin {
  final List<NavigationBean> _items = [];
  int _selectPosition = 0;

  @override
  void initState() {
    super.initState();
    RestClient(Dio()).getNavigation().doOnData((value) {
      print("请求到导航数据：data length=${value.data?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stacktrace) {
      print(stacktrace);
    }).listen(null);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemBuilder: ((c, i) {
              return InkWell(
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _selectPosition == i
                            ? Colors.white
                            : Colors.black12,
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0x0D191919),
                                width: 1,
                                style: BorderStyle.solid))),
                    child: Text(
                      _items[i].name ?? "",
                      style:
                          TextStyle(fontSize: _selectPosition == i ? 18 : 16),
                    )),
                onTap: () {
                  setState(() {
                    _selectPosition = i;
                  });
                },
              );
            }),
            itemCount: _items.length,
            itemExtent: 50,
          ),
        ),
        Expanded(
          flex: 7,
          child: Offstage(
            offstage: _items.length == 0 ||
                _items[_selectPosition].articles?.length == 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _items.length == 0 ||
                          _items[_selectPosition].articles == null
                      ? []
                      : _items[_selectPosition].articles!.map((e) {
                          return InkWell(
                              onTap: () {
                                RouteUtil.pushWebView(context, e.title, e.link);
                              },
                              child: GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    color: Colors.blue,
                                    child: Text(
                                      e.title ?? "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ));
                        }).toList()),
            ),
          ),
        ),
      ],
    );
  }
}
