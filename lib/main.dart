import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hotel_booking/calendar.dart';

const d_green = Color(0xFF54D3C2);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Hotels Booking',
      home: HomePage(),
    );
}}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              SearchSection(),
              HotelSection(),
            ],
          ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon:Icon(
              Icons.arrow_back,
              color: Colors.grey[800],
              size:20),
          onPressed: null,
      ),
      title: Text(
            'Explore',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
      actions: [
        IconButton(
          icon:Icon(
              Icons.favorite_outline_rounded,
              color: Colors.grey[800],
              size:20),
          onPressed: null,
        ),
        IconButton(
          icon:Icon(
              Icons.place,
              color: Colors.grey[800],
              size:20),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor:Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(10,25,10,10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child:
                Container(
                  padding: EdgeInsets.only(left:5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ]
                  ),
                    child:const TextField(
                      decoration: InputDecoration(
                        hintText: 'London',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                ),
              ),
              const SizedBox(width:10),
              Container(
                height: 50,
                width:50,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Calendar();
                    },),);
                  },
                  child: const Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: d_green,
                  ),
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height:8),
                    Text('12 Dec - 22 Dec',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,
                      ),),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Rooms',
                        style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15)
                      ),
                      const SizedBox(height:8),
                      Text('1 Room - 2 Adults',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 17,
                        ),),
                    ]
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  final List hotelsList = [
    {
      'title': 'Grand Royl Hotel',
      'place': 'Webley, London',
      'distance': 2,
      'review': 36,
      'picture': 'assets/hotel_1.jpg',
      'price': '180',
    },
    {
      'title': 'Queen Hotel',
      'place': 'Webley, London',
      'distance': 3,
      'review': 13,
      'picture': 'assets/hotel_2.jpg',
      'price': '220',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'Webley, London',
      'distance': 11,
      'review': 34,
      'picture': 'assets/hotel_4.jpg',
      'price': '910',
    },
    {
      'title': 'Hilton',
      'place': 'Webley, London',
      'distance': 2,
      'review': 36,
      'picture': 'assets/hotel_1.jpg',
      'price': '180',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels founds',
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 15)
                ),
                Row (
                  children: [
                    Text(
                      'Filters',
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15)
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_list_outlined,
                        color: d_green,
                        size: 26,
                      ),
                      onPressed: (){},
                    )
                  ]
                ),
              ]
            )
          ),
          Column(
            children: hotelsList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          )
        ]
      )
    );
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  HotelCard(this.hotelData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(10),
      height:230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height:140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              image: DecorationImage(
                image: AssetImage(
                  hotelData['picture']
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              Positioned(
                top:5,
                  right:-15,
                  child: MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      onPressed: (){},
                      child:
                        Icon(
                        Icons.favorite_outline_rounded,
                        color: d_green,
                        size: 20,
                        )
                  )
              )
            ])
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18)

                ),
                Text(
                    '\$' + hotelData['price'],
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18)),
              ]
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: d_green,
                      size: 14.0
                    ),
                    Text(hotelData['distance'].toString() + ' km to city',
                      style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 14),)
                  ]
                ),
                Text(
                  '/per night',
                  style: GoogleFonts.nunito(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                )
              ]
            )
          )
        ]
      )
    );
  }

}