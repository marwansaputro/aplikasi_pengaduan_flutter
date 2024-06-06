import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/screen_beranda.dart';
import 'package:integra_mobile/screens/complaint/screen_complaint.dart';
import 'package:integra_mobile/screens/portfolio/screen_portfolio.dart';
import 'package:integra_mobile/screens/product/screen_product.dart';
import 'package:integra_mobile/screens/profile/screen_profile.dart';
import 'package:integra_mobile/value/theme.dart';

class ConvexButtomBar extends StatefulWidget {
  const ConvexButtomBar({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ConvexButtomBar());
  }

  @override
  State<ConvexButtomBar> createState() => _ConvexButtomBarState();
}

class _ConvexButtomBarState extends State<ConvexButtomBar> {
  int pageIndex = 0;

  final ScreenBeranda _screenBeranda = const ScreenBeranda();
  final ScreenPortfolio _screenPortfolio = const ScreenPortfolio();
  final ScreenComplaint _screenComplaint = const ScreenComplaint();
  final ScreenProduct _screenProduct = const ScreenProduct();
  final ScreenProfile _screenProfile = const ScreenProfile();

  Widget _showPage = const ScreenBeranda();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _screenBeranda;

      case 1:
        return _screenPortfolio;

      case 2:
        return _screenComplaint;

      case 3:
        return _screenProduct;

      case 4:
        return _screenProfile;

      default:
        return const Center(
          child: Text(
            'No Page',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: "Beranda"),
          TabItem(icon: Icons.photo, title: "Portfolio"),
          TabItem(icon: Icons.report, title: "Complaint"),
          TabItem(
              icon: Icons.production_quantity_limits_rounded, title: "Product"),
          TabItem(icon: Icons.person, title: "Profile"),
        ],
        backgroundColor: darkblue,
        style: TabStyle.fixedCircle,
        onTap: (int tappedindex) {
          setState(() {
            _showPage = _pageChooser(tappedindex);
          });
        },
      ),
      body: Center(
        child: _showPage,
      ),
    );
  }
}
