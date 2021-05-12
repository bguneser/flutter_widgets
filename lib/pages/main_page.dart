import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/article.dart';
import 'package:flutter_ui_widgets/widgets/article_card.dart';

import 'create_article.dart';
import 'home_page.dart';
import 'inbox_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> _pages =[
    HomePage(),
    InboxPage(),
  ];

  int _selectedIndex = 0 ;

  _onTapped(int index) {
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 180,
        ),
      ),
      /*body: GridView.count(
        crossAxisCount: 2,
          childAspectRatio: 0.95,
          children: [
            ArticleCard(
              article: articles[0],
            ),
            ArticleCard(
              article: articles[1],
            ),
            ArticleCard(
              article: articles[2],
            ),
          ],
      ),*/
      body:IndexedStack(
        index: _selectedIndex,
        children:<Widget> [..._pages],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>CreateArticle()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
          icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Inbox"),
              icon: Icon(Icons.inbox)),
        ],
      ),

    );


  }
}
