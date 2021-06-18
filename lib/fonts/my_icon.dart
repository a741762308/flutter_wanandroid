import 'package:flutter/widgets.dart';

class MyIcon {
  static const IconData project = const _MyIconData(0xe64c);
  static const IconData wechat_public = const _MyIconData(0xe64f);
}

class _MyIconData extends IconData {
  const _MyIconData(int codePoint)
      : super(codePoint, fontFamily: 'MyIcons');
}

