import 'package:flutter/material.dart';
import 'package:momo_menu_ui/select_photo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/momo1.jpg',
    'assets/momo2.jpg',
    'assets/momo3.jpg',
    'assets/momo4.jpg',
  ];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 26),
                    height: 210.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(130),
                        // bottomRight: Radius.circular(30),
                        topRight: Radius.circular(130),
                      ),
                      image: DecorationImage(
                        image: AssetImage(photos[photoIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu_book,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 210.0,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                    onTap: _nextImage,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 210.0,
                      width: MediaQuery.of(context).size.width / 2,
                      color: Colors.transparent,
                    ),
                    onTap: _previousImage,
                  ),
                  Positioned(
                    top: 183.0,
                    left: 150.0,
                    child: Container(
                      width: 300,
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          _icon(),
                          _icon(),
                          _icon(),
                          _icon(),
                          _iconnon(),
                          Text(
                            '4.7',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 2.0),
                          SelectedPhoto(
                            numberOfDots: photos.length,
                            photoIndex: photoIndex,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OPEN NOW UNTIL 7PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'The Cinnamon Snail',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '7th st & Union Sq East',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[700],
                          ),
                          Text(
                            '400ft away',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.follow_the_signs,
                            color: Colors.green[900],
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Location confirmed by 3 users today',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: Colors.grey[300],
                        indent: 2.0,
                        endIndent: 250.0,
                        thickness: 3,
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'FEATURED ITEMS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildListItemNew(photos[photoIndex]),
                      SizedBox(height: 5),
                      _buildListItemNew(photos[photoIndex]),
                      SizedBox(height: 5),
                      _buildListItemNew(photos[photoIndex]),
                      SizedBox(height: 5),
                      _buildListItemNew(photos[photoIndex]),
                      SizedBox(height: 5),
                      _buildListItemNew(photos[photoIndex]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Icon(
      Icons.star,
      color: Colors.green[800],
      size: 18.0,
    );
  }

  Widget _iconnon() {
    return Icon(
      Icons.star,
      color: Colors.white,
      size: 18.0,
    );
  }
}

Widget _buildListItem(String picture) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(picture),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildListItemNew(String picture) {
  return ListTile(
    leading: Container(
      // height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(picture),
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Text(
      'Chicken Momo',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      'Momo with chicken and meny more things',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    trailing: Text(
      '180/_',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
