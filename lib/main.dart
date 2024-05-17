import 'package:flutter/material.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffc500),
        title: const Text(
          'Sabritas Barrios0438',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/images/Sabritas.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/Ruffles.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/RecetaCruj.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const <Widget>[
          Tab(
            icon: Icon(
              Icons.food_bank_outlined,
              color: Color(0xffa60707),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.fastfood_outlined,
              color: Color(0xffa60707),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Color(0xffa60707),
            ),
          ),
        ],
      ),
    );
  }
}
