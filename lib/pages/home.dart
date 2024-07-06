import 'package:flutter/material.dart';
import 'package:msdbz/pages/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromARGB(255, 116, 40, 247),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.qr_code_scanner_rounded)),
            label: 'Scanner',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.pie_chart),
            ),
            label: 'Attendence',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          color: Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Column(
              children: [
                Container(
                  child: TableCalendar(
                    rowHeight: 35.0,
                    focusedDay: today,
                    firstDay: DateTime.utc(2020, 10, 15),
                    lastDay: DateTime.utc(2040, 10, 15),
                    headerStyle: const HeaderStyle(
                        formatButtonVisible: false, titleCentered: true),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "You are a TSDC Student",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return null;
          },
        ),
      ][currentPageIndex],
    );
  }
}
