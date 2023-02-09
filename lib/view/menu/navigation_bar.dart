import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/db_manager.dart';
import 'package:mytradeasia/view/menu/history_screen.dart';
import 'package:mytradeasia/view/menu/messages_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia_screen.dart';

import 'home_screen.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key, required this.manager});
  // const NavigationBarWidget({super.key});

  final DbManager manager;

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;

  // final DbManager manager = DbManager();

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOption = [
    const HomeScreen(),
    const MessageScreen(),
    const HistoryScreen(),
    const MyTradeAsiaScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/icon_home_active.png")),
            icon: ImageIcon(AssetImage("assets/images/icon_home_not_active.png")),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/icon_message_active.png")),
            icon: ImageIcon(AssetImage("assets/images/icon_message_not_active.png")),
            label: "Message",
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/icon_history_active.png")),
            icon: ImageIcon(AssetImage("assets/images/icon_history_not_active.png")),
            label: "History",
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(AssetImage("assets/images/icon_mytradeasia_active.png")),
            icon: ImageIcon(AssetImage("assets/images/icon_mytradeasia_not_active.png")),
            label: "My Tradeasia",
          ),
        ],
        selectedItemColor: const Color(0XFF123C69),
        unselectedItemColor: const Color(0XFF597796),
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
      body: _widgetOption.elementAt(_selectedIndex),
    );
  }
}
