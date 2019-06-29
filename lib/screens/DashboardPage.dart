import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffde516a),
                  Color(0xffac3452),
                  Color(0xFFab3854)
                ],
              ),
            ),
            child: Stack(
              children: <Widget>[_getMenu(context), _getHome(context)],
            )));
  }

  Widget _getMenu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: _profileHeader(),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _getMenuItem("Home", Icons.home),
                      _getMenuItem("Account", Icons.account_box),
                      _getMenuItem("Email", Icons.mail),
                      _getMenuItem("Maps", Icons.map),
                      _getMenuItem("Settings", Icons.settings),
                    ],
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: _getBottom(),
                  flex: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
     // alignment: Alignment.center,
      margin: EdgeInsets.only(left: 50.0, top: 50.0, bottom: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExactAssetImage('images/profile.jpg'),
            minRadius: 30,
            maxRadius: 30,
          ),
          Text("Micheal Schumaker",
              style: TextStyle(fontSize: 14, color: Colors.white)),
          Text("abcd@gmail.com",
              style: TextStyle(fontSize: 12, color: Colors.white70))
        ],
      ),
    );
  }

  Widget _getBottom() {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Logout", style:TextStyle(fontSize: 15, color: Colors.white))
          ],
        ));
  }

  Widget _getMenuItem(String menuItem, IconData icon) {
    return Container(
      height: 40.0,
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white70),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              menuItem,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHome(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 6,
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          color: Colors.white,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        }),
                    Text("Home",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    Icon(Icons.settings, color: Colors.black)
                  ],
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/***


 ***/
