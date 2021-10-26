import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class PaymunBottomNavigationBar extends StatefulWidget {
    final ValueChanged<int> indexSelectedPage;
    final currentIndex;
    PaymunBottomNavigationBar({required Key key, required this.indexSelectedPage, this.currentIndex}) : super(key: key);
    _PaymunBottomNavigationBarState createState() => _PaymunBottomNavigationBarState();
}

class _PaymunBottomNavigationBarState extends State<PaymunBottomNavigationBar> {
    int _page = 0;
    late int selectedIndex;
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

    @override
    Widget build(BuildContext context) {
        selectedIndex = widget.currentIndex;
        return CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 60.0,
            items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
                Icon(Icons.call_split, size: 30),
                Icon(Icons.perm_identity, size: 30),
            ],
            color: Colors.black26,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.black12,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: _onItemTapped,
            letIndexChange: (index) => true,
        );
    }


    void _onItemTapped(int index) {
        setState(() {
            //return value to father widget
            widget.indexSelectedPage(index);
        });
    }
}






