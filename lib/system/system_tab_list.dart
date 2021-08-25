import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/system_bean.dart';
import 'package:flutter_wanandroid_app/system/system_item_list.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SystemTabListPage extends StatefulWidget {
  final SystemBean systemBean;
  final int position;

  SystemTabListPage({Key? key, required this.systemBean, this.position = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SystemTabListState();
}

class _SystemTabListState extends State<SystemTabListPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<SystemTag> _tabs = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabs.clear();
    _tabs.addAll(widget.systemBean.children ?? Iterable.empty());
    _tabController = TabController(
        initialIndex: widget.position, length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(widget.systemBean.name ?? "返回"),
          bottom: TabBar(
            tabs: _tabs.map((e) {
              return SizedBox(
                height: 30,
                child: Text(e.name ?? ""),
              );
            }).toList(),
            controller: _tabController,
            isScrollable: _tabs.length > 3,
            indicator: MaterialIndicator(
                height: 2.5,
                color: Colors.white,
                bottomLeftRadius: 5,
                bottomRightRadius: 5),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 18),
            indicatorPadding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          ),
        ),
        preferredSize: Size(double.infinity, 80),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((e) {
          return SystemListPage(
            systemTag: e,
          );
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
