import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            backgroundColor: Colors.red,
            leading: PopupMenuButton<int>(
              onSelected: (value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text('Item 1'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Item 2'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('Item 3'),
                ),
              ],
              icon: Icon(Icons.menu),
            ),
            title: Text('Large App Bar'),
            actions: [
              PopupMenuButton<int>(
                color: Colors.black, // Different background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: (value) {
                  // Handle menu item selection
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Settings', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.help, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Help', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Logout', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.blueAccent,
              child: Home(pageIndex: _page),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

class Home extends StatelessWidget {
  final int pageIndex;

  const Home({Key? key, required this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Page Index: $pageIndex',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          if (pageIndex == 0)
            LikeButtonWidget()
          else if (pageIndex == 1)
            TextFieldWidget()
          else
            CounterWidget(),
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Număr de apăsări: $_counter',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: const Text('Apasă-mă'),
        ),
      ],
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String _inputText = "";

  void _updateText(String text) {
    setState(() {
      _inputText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onChanged: _updateText,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Introdu text',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Text introdus: $_inputText',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LikeButton(
        size: 80,
      ),
    );
  }
}
