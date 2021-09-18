class HttpPath {
  static const String HOST = "https://wanandroid.com";

  /// 微信公众号
  static const String WX_CHAPTERS = "/wxarticle/chapters/json";

  ///公众号文章列表
  static const String WX_ARTICLE_LIST = "/wxarticle/list/{id}/{page}/json";

  ///banner
  static const String BANNER = "/banner/json";

  ///置顶文章
  static const String TOP_ARTICLE_LIST = "/article/top/json";

  ///文章列表
  static const String ARTICLE_LIST = "/article/list/{page}/json";

  ///项目分类
  static const String PROJECT_CLASSIFY = "/project/tree/json";

  ///最新项目
  static const String PROJECT_LIST_LAST = "/article/listproject/{page}/json";

  ///项目列表
  static const String PROJECT_LIST = "/project/list/{page}/json";

  ///导航
  static const String NAVIGATION_LIST = "/navi/json";

  ///体系分类
  static const String SYSTEM_CLASSIFY = "/tree/json";

  ///热搜
  static const String SEARCH_HOT_KEY = "/hotkey/json";
}
