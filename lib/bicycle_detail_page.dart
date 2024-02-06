import 'package:flutter/material.dart';

class BicycleDetailPage extends StatefulWidget {
  final String img;

  const BicycleDetailPage({Key? key, required this.img}) : super(key: key);

  @override
  _BicycleDetailPageState createState() => _BicycleDetailPageState();
}

class _BicycleDetailPageState extends State<BicycleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 16,
              top: 16,
              child: SizedBox(
                height: 48,
                width: 48,
                child: Card(
                  elevation: 8,
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: CircleAvatar(
                radius: 124,
                backgroundColor: Colors.orange[50],
              ),
            ),
            Positioned(
              left: 64,
              right: 64,
              top: 64,
              child: SizedBox(
                  height: 240,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.img,
                          ),
                        )),
                  )),
            ),
            const Positioned(
              top: 340,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GoCycle",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              "Electric Bike",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        "13\$",
                        style: TextStyle(fontSize: 24, color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      Text(" /hour")
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Range",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "50mil",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Speed",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "75kmh",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Power",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "387wh",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(border: Border.all(color: Colors.orange), shape: BoxShape.circle),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    child: Text(
                      "Go",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}