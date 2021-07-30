import 'package:flutter/cupertino.dart';

class ProjectListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectList();
  }
}

class _ProjectList extends State<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text("项目List"),
    );
  }
}
