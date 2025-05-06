import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(items[index]),
          ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder:
          (context, index) => Card(
            margin: EdgeInsets.all(8),
            child: Center(child: Text(items[index])),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Home'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: 'List View'), Tab(text: 'Grid View')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [buildListView(), buildGridView()],
      ),
    );
  }
}
