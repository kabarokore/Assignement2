import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  void toggleDarkMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
        brightness: darkMode ? Brightness.dark : Brightness.light,
      ),
      home: HomeScreen(toggleDarkMode: toggleDarkMode),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleDarkMode;

  HomeScreen({required this.toggleDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    SignInScreen(),
    SignUpScreen(),
    CalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBILE APPLICATION'),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              widget.toggleDarkMode();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('lib/images/Ronlad.png'),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'mugaboronald12@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.app_registration),
                title: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text(
                  'Calculator',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(2);
                },
              ),
              Divider(),
              ListTile(
                leading: Stack(
                  children: [
                    Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  // Handle notifications tap
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation or functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.history, color: Colors.blue),
                title: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  // Handle history tap
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation or functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.download, color: Colors.green),
                title: Text(
                  'Downloads',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  // Handle downloads tap
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation or functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text(
                  'Favorites',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  // Handle favorites tap
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation or functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  // Handle settings tap
                  Navigator.pop(context); // Close the drawer
                  // Add your navigation or functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
