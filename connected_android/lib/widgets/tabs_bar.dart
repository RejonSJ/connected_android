import 'package:flutter/material.dart';

class TabsBar extends StatefulWidget {
  const TabsBar({super.key});

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Connected'),
          actions: [
            IconButton(onPressed: () {
              
            },
            icon: const Icon(Icons.account_circle_outlined))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.bento_outlined), text: 'Productos',),
              Tab(icon: Icon(Icons.store_outlined), text: 'Tiendas',)
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            
          ],
        ),
      ),
    );
  }
}