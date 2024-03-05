import 'package:flutter/material.dart';
import 'colors.dart';
import 'reusableprofile.dart';
import 'screenutil.dart';
import 'taplist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Filter { All, Favorites, Completed }

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> Maps = [
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'Thomas Abraham',
      'Lastname': 'can you please connect me..',
      'imagepath': 'assets/h2.png',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'Jane willaim',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'Bob watson',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/pr.png',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'wattson martn',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/h2.png',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'kane williamson',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'virat kohli',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/pr.png',
    },
    {
      'Friends': true,
      'Work': false,
      'study': false,
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/h2.png',
    },
    {
      'Friends': false,
      'Work': true,
      'study': false,
      'Firstname': 'IT Friends',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w1.jpeg',
    },
    {
      'Friends': false,
      'Work': true,
      'study': false,
      'Firstname': 'Office Group',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w2.jpeg',
    },
    {
      'Friends': false,
      'Work': true,
      'study': false,
      'Firstname': 'Company Jobs',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w3.jpeg',
    },
    {
      'Friends': false,
      'Work': true,
      'study': false,
      'Firstname': 'IT Jobs',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w3.jpeg',
    },
    {
      'Friends': false,
      'Work': true,
      'study': false,
      'Firstname': 'jOBS',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w4.jpeg',
    },
    {
      'Friends': false,
      'Work': false,
      'study': true,
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w4.jpeg',
    },
    {
      'Friends': false,
      'Work': false,
      'study': true,
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w4.jpeg',
    },
    {
      'Friends': false,
      'Work': false,
      'study': true,
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'can you please connect...',
      'imagepath': 'assets/w4.jpeg',
    },
  ];
  List<Map<String, dynamic>> filteredMaps = [];
  Filter activeFilter = Filter.All;

  @override
  void initState() {
    super.initState();
    filteredMaps = List.from(Maps);
  }

  void updateFilter(Filter filter) {
    setState(() {
      activeFilter = filter;
      if (filter == Filter.All) {
        filteredMaps = Maps.where((Maps) => Maps['Friends'] == true).toList();
      } else if (filter == Filter.Favorites) {
        filteredMaps = Maps.where((Maps) => Maps['Work'] == true).toList();
      } else if (filter == Filter.Completed) {
        filteredMaps = Maps.where((Maps) => Maps['study'] == true).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
              top: 40.0,
              left: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlueButton('Connections'),
                SizedBox(width: 10),
                BlueButton('Groups'),
                SizedBox(width: 10),
                BlueButton('Housing'),
                SizedBox(width: 10),
                BlueButton('rent'),
                SizedBox(width: 10),
                BlueButton('boarding'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
            child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: BgColor,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 35),
              child: Row(
                children: [
                  FilterButton(
                    filter: Filter.All,
                    activeFilter: activeFilter,
                    text: 'Friends',
                    onPressed: updateFilter,
                  ),
                  SizedBox(width: 20),
                  FilterButton(
                    filter: Filter.Favorites,
                    activeFilter: activeFilter,
                    text: '   Work   ',
                    onPressed: updateFilter,
                  ),
                  SizedBox(width: 20),
                  FilterButton(
                    filter: Filter.Completed,
                    activeFilter: activeFilter,
                    text: '   Study  ',
                    onPressed: updateFilter,
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0,
                top: screenWidth * .21,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: filteredMaps.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.grey.shade200,
                    ),
                    itemBuilder: (context, int index) {
                      final item = filteredMaps[index];

                      return Container(
                        width: double.infinity,
                        height: screenHeight * .13,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomProfile(
                              image: (item['imagepath']),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 14),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (item['Firstname']),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    (item['Lastname']),
                                    style:
                                        TextStyle(color: Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text('13:25'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ))
          ],
        ))
      ],
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
            color: filter == activeFilter ? BgColor : Colors.white,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          primary: filter == activeFilter ? Colors.white : BgColor,
          side: BorderSide(color: bordercolor)),
      onPressed: () {
        onPressed(filter);
      },
    );
  }
}
