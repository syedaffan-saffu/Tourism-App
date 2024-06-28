import 'package:flutter/material.dart';
import '../../../utils/utilspack1.dart';

class Recomms extends StatefulWidget {
  const Recomms({super.key});

  @override
  State<Recomms> createState() => _RecommsState();
}

class _RecommsState extends State<Recomms> {
  final TextStyle _heading = const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: "Signika");
  final List<String> _locs = ["Hunza", "Lahore", "Islamabad"];
  final PageController _controller = PageController(viewportFraction: 5.0);
  int _currentpage = 0;

  void _onpagechange() {
    setState(() {
      _currentpage = _controller.page!.round();
    });
  }

  @override
  void initState() {
    _controller.addListener(_onpagechange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 140,
              width: contextwidth(context),
              child: Image.asset(
                'assets/images/guideprofback.jpg',
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.darken,
                color: const Color(0xAF0F283D),
              ),
            ),
            Text(
              "FIND THE BEST",
              style: _heading,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: ListTile(
                          shape: const BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xFFCCCCCC), width: 0.5)),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 5.0),
                          leading: const Icon(CustomIcons.plane_icon),
                          title: Text(
                            "Package for ${_locs[index]}",
                          ),
                          subtitle: const Text(
                              "Lorem Ipsum is simply dummy text of the printing."),
                          trailing: SizedBox(
                            height: double.infinity,
                            width: 25,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFF48B5E4),
                                  padding: EdgeInsets.zero,
                                  shape: const BeveledRectangleBorder()),
                              child: const Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: _currentpage == index
                                ? const Color(0xFF0561AB)
                                : const Color(0xFFCCCCCC),
                            radius: _currentpage == index ? 7 : 5,
                          ),
                        )),
              ),
              gapV(15),
              Row(
                children: [
                  Text(
                    "Trips",
                    style: _heading.copyWith(
                      color: const Color(0xFF000000),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See More',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 21, 119, 200)),
                      )),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
