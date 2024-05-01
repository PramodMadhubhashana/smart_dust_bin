import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double remaininghight = MediaQuery.of(context).size.height - 500;
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/5092952.jpg',
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      width: screenWidth,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(222, 222, 222, 222),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.purple[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("pramod"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: remaininghight,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(222, 222, 222, 225)),
                child: Column(
                  children: [
                    Text("pramod"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
