import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ui/MainScreens.dart';
import 'package:flutterpractice/ui/SignIn.dart';
import 'package:flutterpractice/ui/SignUp.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroSlides extends StatefulWidget {
  IntroSlides({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroSlides> {
  List<Slide> slides = new List();
  Function goToTab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkFirstSeen(context);

    slides.add(new Slide(
      title: "CAR BREAKDOWN",
      styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      marginDescription: EdgeInsets.only(top: 10,right: 30,left: 10),

      description:
      "Immediatley open the application and explore and contact cars workshops near your location directly on the map",
      styleDescription: TextStyle(
          color: Colors.black54,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontFamily: 'Raleway'),
      pathImage: "images/folder.png",
    ));

    slides.add(new Slide(
        title: "SCREEN TITLE",
        styleTitle: TextStyle(
            color: Colors.black54,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Ye indulgence unreserved connection alteration appearance PLA PLA PLA PLA ",
        styleDescription: TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/folder.png",
      ));

    slides.add(new Slide(
      title: "SCREEN TITLE",
      styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      description:
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. PLA PLA PLA PLA PLA PLA",
      styleDescription: TextStyle(
          color: Colors.black54,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      pathImage: "images/folder.png",
    ));

    slides.add(new Slide(
      title: "SCREEN TITLE",
      styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      description:
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. PLA PLA PLA PLA PLA PLA",
      styleDescription: TextStyle(
          color: Colors.black54,
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      pathImage: "images/folder.png",
    ));

  }








  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.black54,
      size: 35.0,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black54,
    );
  }


  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.blue,
    );
  }
  void onDonePress() {
    // Back to the first tab
 //   this.goToTab(0);
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();

    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 30.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                child: Container(child: Text("Skip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 20),
                ),
              onTap: onTabSkipped,
              )
              ,

              SizedBox(height: 20),
              GestureDetector(
               //   margin: EdgeInsets.only(, top: 30.0),

                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0,left: 10,right: 30),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      isShowSkipBtn: false,

      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Colors.blue,

      // Next button
      renderNextBtn: this.renderNextBtn(),
      isShowNextBtn: false,

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Colors.blue,
      isShowDoneBtn: false,

      // Dot indicator
      colorDot: Colors.blue,
      sizeDot: 13.0,
     // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }

  onTabChangeCompleted() {

  }

  onTabSkipped() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen')?? false);

    print("oooo"+_seen.toString());

    if (_seen==true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SignIn()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroSlides()));
      bool _seen = (prefs.getBool('seen'));
      print("oooo2"+_seen.toString());
    }
  }

}


