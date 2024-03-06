import "package:flutter/material.dart";

class CardView extends StatefulWidget {
  final String img;
  final String title;
  final Row? locorating;
  final String description;
  final String? price;
  final String? stay;
  final String rating;
  final Widget? tags;
  final Row? iconsrow;
  final Widget? locs;
  final Row? btnrow;

  const CardView({
    super.key,
    required this.img,
    required this.title,
    this.locorating,
    required this.description,
    this.price,
    required this.rating,
    this.stay,
    this.tags,
    this.iconsrow,
    this.locs,
    this.btnrow,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: InkWell(
        hoverColor: Colors.white70,
        onTap: () {},
        child: SizedBox(
          width: 340,
          child: Column(

              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Stack(alignment: Alignment.topRight, children: [
                    Column(
                      children: [
                        SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              widget.img,
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: widget.iconsrow,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, right: 12),
                      child: SizedBox(
                        child: widget.tags,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sbh(7),
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      sbh(7),
                      SizedBox(
                        child: widget.locorating,
                      ),
                      sbh(7),
                      SizedBox(child: widget.locs),
                      sbh(7),
                      Text(
                        widget.description,
                        style: const TextStyle(
                            color: Color.fromARGB(132, 0, 0, 0)),
                      ),
                      sbh(15),
                      SizedBox(
                        child: widget.btnrow,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

///////////////////////////////

Widget sbh(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sbw(double width) {
  return SizedBox(
    height: width,
  );
}
