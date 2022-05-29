//import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nestednav/pages/about.dart';
import 'package:nestednav/pages/latin_word_list.dart';
import 'package:nestednav/pages/loading.dart';
import 'package:nestednav/pages/more.dart';
import 'package:nestednav/pages/share.dart';
import 'package:nestednav/pages/word_info.dart';
import 'package:nestednav/pages/word_list.dart';
import 'package:nestednav/pages/words.dart';

import '../home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(initial: true, path: '/', page: Loading, children: [
      RedirectRoute(path: '*', redirectTo: 'home_page'),
    ]),
    AutoRoute(path: '', name: 'HomeRouter', page: HomePage, children: [
      AutoRoute(
          path: 'words',
          name: 'WordsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: WordsPage),
            AutoRoute(path: 'word_list', page: WordListPage),
            AutoRoute(path: 'latin_word_list', page: LatinWordListPage),
            AutoRoute(path: 'word_info', page: WordInfoPage),
            RedirectRoute(path: '*', redirectTo: '')
          ]),
      AutoRoute(
          path: 'more',
          name: 'MoreRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: MorePage),
            RedirectRoute(path: '*', redirectTo: '')
          ]),
      AutoRoute(
          path: 'about',
          name: 'AboutRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: About),
            RedirectRoute(path: '*', redirectTo: '')
          ]),
      AutoRoute(
          path: 'share',
          name: 'ShareRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: Share),
            RedirectRoute(path: '*', redirectTo: '')
          ]),
    ])

    /*
      AutoRoute(
        path: '',
        page: Loading,
      ),
      AutoRoute(
          path: 'home_page',
          //name: 'HomeRouter',
          page: HomePage,
          children: [
            AutoRoute(
                path: 'words',
                name: 'WordsRouter',
                page: EmptyRouterPage,
                children: [
                  AutoRoute(path: '', page: Words),
                  AutoRoute(path: 'word_list', page: WordListPage)
                ]),
            AutoRoute(path: 'more', name: 'MoreRouter', page: MorePage),
            AutoRoute(path: 'about', name: 'AboutRouter', page: About),
            AutoRoute(path: 'share', name: 'ShareRouter', page: Share),
          ]),
    ]),
    */
  ],
)
class $AppRouter {}
