// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i11;

import '../home_page.dart' as _i2;
import '../pages/about.dart' as _i9;
import '../pages/latin_word_list.dart' as _i6;
import '../pages/loading.dart' as _i1;
import '../pages/more.dart' as _i8;
import '../pages/share.dart' as _i10;
import '../pages/word_info.dart' as _i7;
import '../pages/word_list.dart' as _i5;
import '../pages/words.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Loading.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Loading());
    },
    HomeRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HomeRouterArgs>(
          orElse: () => HomeRouterArgs(
              wordItems: pathParams.get('wordItems'),
              latinwordItems: pathParams.get('latinwordItems')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.HomePage(
              key: args.key,
              wordItems: args.wordItems,
              latinwordItems: args.latinwordItems));
    },
    WordsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    MoreRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    AboutRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ShareRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    WordsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.WordsPage());
    },
    WordListRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WordListRouteArgs>(
          orElse: () => WordListRouteArgs(
              words: pathParams.get('words'),
              letter: pathParams.getString('letter')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.WordListPage(
              key: args.key, words: args.words, letter: args.letter));
    },
    LatinWordListRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<LatinWordListRouteArgs>(
          orElse: () =>
              LatinWordListRouteArgs(latinwords: pathParams.get('latinwords')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.LatinWordListPage(
              key: args.key, latinwords: args.latinwords));
    },
    WordInfoRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WordInfoRouteArgs>(
          orElse: () =>
              WordInfoRouteArgs(wordItem: pathParams.get('wordItem')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.WordInfoPage(key: args.key, wordItem: args.wordItem));
    },
    MoreRoute.name: (routeData) {
      final args =
          routeData.argsAs<MoreRouteArgs>(orElse: () => const MoreRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.MorePage(key: args.key));
    },
    About.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.About());
    },
    Share.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.Share());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Loading.name, path: '/', children: [
          _i3.RouteConfig('*#redirect',
              path: '*',
              parent: Loading.name,
              redirectTo: 'home_page',
              fullMatch: true)
        ]),
        _i3.RouteConfig(HomeRouter.name, path: '', children: [
          _i3.RouteConfig(WordsRouter.name,
              path: 'words',
              parent: HomeRouter.name,
              children: [
                _i3.RouteConfig(WordsRoute.name,
                    path: '', parent: WordsRouter.name),
                _i3.RouteConfig(WordListRoute.name,
                    path: 'word_list', parent: WordsRouter.name),
                _i3.RouteConfig(LatinWordListRoute.name,
                    path: 'latin_word_list', parent: WordsRouter.name),
                _i3.RouteConfig(WordInfoRoute.name,
                    path: 'word_info', parent: WordsRouter.name),
                _i3.RouteConfig('*#redirect',
                    path: '*',
                    parent: WordsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i3.RouteConfig(MoreRouter.name,
              path: 'more',
              parent: HomeRouter.name,
              children: [
                _i3.RouteConfig(MoreRoute.name,
                    path: '', parent: MoreRouter.name),
                _i3.RouteConfig('*#redirect',
                    path: '*',
                    parent: MoreRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i3.RouteConfig(AboutRouter.name,
              path: 'about',
              parent: HomeRouter.name,
              children: [
                _i3.RouteConfig(About.name, path: '', parent: AboutRouter.name),
                _i3.RouteConfig('*#redirect',
                    path: '*',
                    parent: AboutRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i3.RouteConfig(ShareRouter.name,
              path: 'share',
              parent: HomeRouter.name,
              children: [
                _i3.RouteConfig(Share.name, path: '', parent: ShareRouter.name),
                _i3.RouteConfig('*#redirect',
                    path: '*',
                    parent: ShareRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.Loading]
class Loading extends _i3.PageRouteInfo<void> {
  const Loading({List<_i3.PageRouteInfo>? children})
      : super(Loading.name, path: '/', initialChildren: children);

  static const String name = 'Loading';
}

/// generated route for
/// [_i2.HomePage]
class HomeRouter extends _i3.PageRouteInfo<HomeRouterArgs> {
  HomeRouter(
      {_i11.Key? key,
      required dynamic wordItems,
      required dynamic latinwordItems,
      List<_i3.PageRouteInfo>? children})
      : super(HomeRouter.name,
            path: '',
            args: HomeRouterArgs(
                key: key, wordItems: wordItems, latinwordItems: latinwordItems),
            rawPathParams: {
              'wordItems': wordItems,
              'latinwordItems': latinwordItems
            },
            initialChildren: children);

  static const String name = 'HomeRouter';
}

class HomeRouterArgs {
  const HomeRouterArgs(
      {this.key, required this.wordItems, required this.latinwordItems});

  final _i11.Key? key;

  final dynamic wordItems;

  final dynamic latinwordItems;

  @override
  String toString() {
    return 'HomeRouterArgs{key: $key, wordItems: $wordItems, latinwordItems: $latinwordItems}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class WordsRouter extends _i3.PageRouteInfo<void> {
  const WordsRouter({List<_i3.PageRouteInfo>? children})
      : super(WordsRouter.name, path: 'words', initialChildren: children);

  static const String name = 'WordsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class MoreRouter extends _i3.PageRouteInfo<void> {
  const MoreRouter({List<_i3.PageRouteInfo>? children})
      : super(MoreRouter.name, path: 'more', initialChildren: children);

  static const String name = 'MoreRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class AboutRouter extends _i3.PageRouteInfo<void> {
  const AboutRouter({List<_i3.PageRouteInfo>? children})
      : super(AboutRouter.name, path: 'about', initialChildren: children);

  static const String name = 'AboutRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ShareRouter extends _i3.PageRouteInfo<void> {
  const ShareRouter({List<_i3.PageRouteInfo>? children})
      : super(ShareRouter.name, path: 'share', initialChildren: children);

  static const String name = 'ShareRouter';
}

/// generated route for
/// [_i4.WordsPage]
class WordsRoute extends _i3.PageRouteInfo<void> {
  const WordsRoute() : super(WordsRoute.name, path: '');

  static const String name = 'WordsRoute';
}

/// generated route for
/// [_i5.WordListPage]
class WordListRoute extends _i3.PageRouteInfo<WordListRouteArgs> {
  WordListRoute({_i11.Key? key, required dynamic words, required String letter})
      : super(WordListRoute.name,
            path: 'word_list',
            args: WordListRouteArgs(key: key, words: words, letter: letter),
            rawPathParams: {'words': words, 'letter': letter});

  static const String name = 'WordListRoute';
}

class WordListRouteArgs {
  const WordListRouteArgs(
      {this.key, required this.words, required this.letter});

  final _i11.Key? key;

  final dynamic words;

  final String letter;

  @override
  String toString() {
    return 'WordListRouteArgs{key: $key, words: $words, letter: $letter}';
  }
}

/// generated route for
/// [_i6.LatinWordListPage]
class LatinWordListRoute extends _i3.PageRouteInfo<LatinWordListRouteArgs> {
  LatinWordListRoute({_i11.Key? key, required dynamic latinwords})
      : super(LatinWordListRoute.name,
            path: 'latin_word_list',
            args: LatinWordListRouteArgs(key: key, latinwords: latinwords),
            rawPathParams: {'latinwords': latinwords});

  static const String name = 'LatinWordListRoute';
}

class LatinWordListRouteArgs {
  const LatinWordListRouteArgs({this.key, required this.latinwords});

  final _i11.Key? key;

  final dynamic latinwords;

  @override
  String toString() {
    return 'LatinWordListRouteArgs{key: $key, latinwords: $latinwords}';
  }
}

/// generated route for
/// [_i7.WordInfoPage]
class WordInfoRoute extends _i3.PageRouteInfo<WordInfoRouteArgs> {
  WordInfoRoute({_i11.Key? key, required dynamic wordItem})
      : super(WordInfoRoute.name,
            path: 'word_info',
            args: WordInfoRouteArgs(key: key, wordItem: wordItem),
            rawPathParams: {'wordItem': wordItem});

  static const String name = 'WordInfoRoute';
}

class WordInfoRouteArgs {
  const WordInfoRouteArgs({this.key, required this.wordItem});

  final _i11.Key? key;

  final dynamic wordItem;

  @override
  String toString() {
    return 'WordInfoRouteArgs{key: $key, wordItem: $wordItem}';
  }
}

/// generated route for
/// [_i8.MorePage]
class MoreRoute extends _i3.PageRouteInfo<MoreRouteArgs> {
  MoreRoute({_i11.Key? key})
      : super(MoreRoute.name, path: '', args: MoreRouteArgs(key: key));

  static const String name = 'MoreRoute';
}

class MoreRouteArgs {
  const MoreRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'MoreRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.About]
class About extends _i3.PageRouteInfo<void> {
  const About() : super(About.name, path: '');

  static const String name = 'About';
}

/// generated route for
/// [_i10.Share]
class Share extends _i3.PageRouteInfo<void> {
  const Share() : super(Share.name, path: '');

  static const String name = 'Share';
}
