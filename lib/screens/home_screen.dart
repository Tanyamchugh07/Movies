// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/classes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController backgroundController = PageController();
  PageController topController = PageController(viewportFraction: 0.75);
  int topIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: PageView.builder(
              reverse: true,
              controller: backgroundController,
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return Image.network(
                  moviesList[index].image,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: height * 0.55,
                width: width,
                child: PageView.builder(
                  controller: topController,
                  onPageChanged: (index) {
                    setState(() {
                      backgroundController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    });
                  },
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) { // Renamed topIndex to index
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                image: NetworkImage(moviesList[index].image), // Updated here
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: const EdgeInsets.only(top: 50),
                            height: height * 0.3,
                            width: width * 0.6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              moviesList[index].name, // Updated here
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var theme in moviesList[index].type) // Updated here
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.grey.shade500),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    child: Text(theme),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54
                    ),
                    child: const Text('Buy Ticket',
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
