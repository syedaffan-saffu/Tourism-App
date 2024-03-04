import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 420,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(230, 255, 255, 255),
                    child: InkWell(
                      hoverColor: Colors.white70,
                      onTap: () {},
                      child: SizedBox(
                        height: 300,
                        width: 250,
                        child: Column(

                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              height: 160,
                                              width: double.infinity,
                                              child: Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/330px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
                                                fit: BoxFit.fill,
                                              )),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          SizedBox(
                                              height: 25,
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                      height: 25,
                                                      width: 25,
                                                      child: SvgPicture.network(
                                                          'https://dev.trekkers.pk/images/car-icon.svg')),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                      height: 25,
                                                      width: 25,
                                                      child: SvgPicture.network(
                                                          'https://dev.trekkers.pk/images/plane-icon.svg')),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                      height: 25,
                                                      width: 25,
                                                      child: SvgPicture.network(
                                                          'https://dev.trekkers.pk/images/sign-icon.svg')),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                      height: 25,
                                                      width: 25,
                                                      child: SvgPicture.network(
                                                          'https://dev.trekkers.pk/images/pump-icon.svg')),
                                                ],
                                              )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 15,
                                                    ),
                                                    Text(
                                                      '4.5',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 100,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.blue),
                                                height: 50,
                                                width: 30,
                                                child: const Column(
                                                  children: [
                                                    Text(
                                                      '10',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      'Day',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Biafo Glacier Ice Climbing',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            color: Colors.blue),
                                        Text(' Hindu Kush Range')
                                      ],
                                    ),
                                    const Text(
                                      "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout.",
                                      style: TextStyle(
                                          color: Color.fromARGB(132, 0, 0, 0)),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Text(
                                          "\$250",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "/Person",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromARGB(132, 0, 0, 0)),
                                        ),
                                        const SizedBox(
                                          width: 28,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                elevation: 0.0,
                                                shape:
                                                    const RoundedRectangleBorder()),
                                            onPressed: () {},
                                            child: const Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
    );
  }
}
