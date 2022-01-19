import 'package:flutter/material.dart';
import 'package:sepatu/src/pages/home_page.dart';
import 'package:sepatu/src/pages/keranjang.dart';
import 'package:sepatu/src/themes/light_color.dart';
import 'package:sepatu/src/themes/theme.dart';
import 'package:sepatu/src/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:sepatu/src/widgets/title_text.dart';
import 'package:sepatu/src/widgets/extentions.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            ),
          ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );

  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: isHomePageSelected ? 'Shoe' : 'About',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: isHomePageSelected ? 'Shop' : 'ShoeApp',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            !isHomePageSelected
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.delete_outline,
                      color: LightColor.orange,
                    ),
                  ).ripple(() {},
                    borderRadius: BorderRadius.all(Radius.circular(13)))
                : SizedBox()
          ],
        ));
  }

  Widget buildAbout(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
        'Kebutuhan menggunakan sneakers sudah menjadi kebutuhan yang banyak dicari orang, tidak hanya untuk cowok tapi juga cewek dan anak-anak.  Sayangnya di Indonesia ini banyak sepatu KW yang dijual dengan harga original dan fantastis, oleh karena itu kita membuat aplikasi penjualan sepatu dari luar negeri.',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Aplikasi ShoeApp ini original sudah mendapat verifikasi penjualan online terbaik dan terpercaya. Sudah ratusan testimoni yang mereka dapatkan karena menjual barang jaminan original dan juga tidak mengecewakan para pembelinya yang tersebar di dunia.',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Copyright by',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Bayu Pamungkas-19552011174',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Fitri Apriyani-19552011113',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'M. Fadhil Aulia-19552011133',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Noorman Putra K-19552011120',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Yuda Rizki-19552011025',
        style: TextStyle(
            color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      ],
    );
  }
  

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isHomePageSelected
                            ? MyHomePage()
                            : Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 100,),
                                    buildAbout()
                                  ],
                                )
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
