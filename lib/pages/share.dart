import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Share extends StatefulWidget {
  const Share({Key? key}) : super(key: key);

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  //set background
  String bgImage = 'app_background.png';

  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithDomStorage(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableDomStorage: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }


  @override
  Widget build(BuildContext context) {
    const String toLaunchFacebook = 'https://www.facebook.com/';
    const String toLaunchTwitter = 'https://www.twitter.com/';
    const String toLaunchGoogle = 'https://www.facebook.com/';
    const String toLaunchInstagram = 'https://www.instagram.com/';


    return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/$bgImage'),
                    fit: BoxFit.fill,
                  )
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Do You Like This App?',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff8b0000),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                        'Share It!',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () => setState(() {
                        _launched = _launchInWebViewOrVC(toLaunchFacebook);
                      }),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/linkbackgrnd.png'),
                          fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: SizedBox(
                                  height: 40,
                                  child: Image.asset('assets/images/fbicon.png', )),
                            ),
                            const SizedBox(width: 10,),
                            SizedBox(
                                height: 30,
                                child: Image.asset('assets/images/Facebook.png', )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () => setState(() {
                        _launched = _launchInWebViewWithJavaScript(toLaunchTwitter);
                      }),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/linkbackgrnd.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: SizedBox(
                                  height: 40,
                                  child: Image.asset('assets/images/twicon.png', )),
                            ),
                            const SizedBox(width: 10,),
                            SizedBox(
                                height: 25,
                                child: Image.asset('assets/images/Twitter.png', )),
                          ],
                        ),
                      ),
                    ),
/*                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: () => setState(() {
                        _launched = _launchInWebViewWithJavaScript(toLaunchGoogle);
                      }),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/linkbackgrnd.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: SizedBox(
                                  height: 40,
                                  child: Image.asset('assets/images/gooicon.png', )),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                                height: 30,
                                child: Image.asset('assets/images/Google+.png', )),
                          ],
                        ),
                      ),
                    ),
*/
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () => setState(() {
                        _launched = _launchInWebViewWithJavaScript(toLaunchInstagram);
                      }),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/linkbackgrnd.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: SizedBox(
                                  height: 40,
                                  child: Image.asset('assets/images/instaicon.png', )),
                            ),
                            const SizedBox(width: 10,),
                            SizedBox(
                                height: 30,
                                child: Image.asset('assets/images/Instagram.png', )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      'Rate It!',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        print('Rate It!!');
                      }),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/linkbackgrnd.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            SizedBox(
                              child: Image.asset('assets/images/ratinglarge.png', )
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(16.0)),
                    FutureBuilder<void>(future: _launched, builder: _launchStatus),
                  ],
                ),
              ),
            )
        );
  }
}