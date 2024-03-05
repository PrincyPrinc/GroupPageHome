import 'package:flutter/material.dart';

import 'colors.dart';
import 'reusableprofile.dart';
import 'screenutil.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Filter { All, Favorites, Completed }

class _MyAppState extends State<MyApp> {
  List<String> itemList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
  ];

  List<Map<String, dynamic>> Maps = [
    {
      'Firstname': 'Thomas Abraham',
      'Lastname': 'Thomas',
      'imagepath': 'assets/h2.png',
    },
    {
      'Firstname': 'Jane willaim',
      'Lastname': 'willaimwillaim',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Firstname': 'Bob watson',
      'Lastname': 'watson',
      'imagepath': 'assets/pr.png',
    },
    {
      'Firstname': 'wattson martn',
      'Lastname': 'martn',
      'imagepath': 'assets/h2.png',
    },
    {
      'Firstname': 'kane williamson',
      'Lastname': 'williamson',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Firstname': 'virat kohli',
      'Lastname': 'willaim',
      'imagepath': 'assets/pr.png',
    },
    {
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'mahendrasing',
      'imagepath': 'assets/h2.png',
    },
  ];

  Filter activeFilter = Filter.All;
  List<String> filteredItemList = [];

  @override
  void initState() {
    super.initState();
    filteredItemList = itemList;
  }

  void updateFilter(Filter filter) {
    setState(() {
      activeFilter = filter;
      if (filter == Filter.All) {
        filteredItemList = itemList;
      } else if (filter == Filter.Favorites) {
        // Apply favorites filter logic here
        filteredItemList = itemList.where((item) {
          // Example: only display items that contain the letter 'i'
          return item.contains('i');
        }).toList();
      } else if (filter == Filter.Completed) {
        // Apply completed filter logic here
        filteredItemList = itemList.where((item) {
          // Example: only display items that end with 'm'
          return item.endsWith('m');
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter Button Example',
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilterButton(
                  filter: Filter.All,
                  activeFilter: activeFilter,
                  text: 'Friends',
                  onPressed: updateFilter,
                ),
                SizedBox(width: 16),
                FilterButton(
                  filter: Filter.Favorites,
                  activeFilter: activeFilter,
                  text: 'Work',
                  onPressed: updateFilter,
                ),
                SizedBox(width: 16),
                FilterButton(
                  filter: Filter.Completed,
                  activeFilter: activeFilter,
                  text: 'Housingn',
                  onPressed: updateFilter,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Maps.length,
                itemBuilder: (context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomProfile(
                          image: Maps[index]['imagepath'],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(Maps[index]['Firstname']),
                                  Text('355:05'),
                                ],
                              ),
                              Text(Maps[index]['Lastname'])
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final Filter filter;
  final Filter activeFilter;
  final String text;
  final Function(Filter) onPressed;

  FilterButton({
    required this.filter,
    required this.activeFilter,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: filter == activeFilter ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: filter == activeFilter ? Colors.blue : Colors.grey[300],
      ),
      onPressed: () {
        onPressed(filter);
      },
    );
  }
}
