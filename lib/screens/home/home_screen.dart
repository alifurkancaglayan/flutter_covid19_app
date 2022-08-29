import 'package:flutter/material.dart';
import 'package:flutter_covid19_app/constanst.dart';
import 'package:flutter_covid19_app/screens/details/details_screen.dart';
import 'package:flutter_covid19_app/screens/home/components/info_card.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    InfoCard(
                      title: "Confirmed Cases",
                      iconColor: Color(0xFFFF8C00),
                      effectedNum: 1062,
                      press: () {},
                    ),
                    InfoCard(
                      title: "Total Deaths",
                      iconColor: Color(0xFFFF2D55),
                      effectedNum: 75,
                      press: () {},
                    ),
                    InfoCard(
                      title: "Total Recovered",
                      iconColor: Color(0xFF50E3C2),
                      effectedNum: 659,
                      press: () {},
                    ),
                    InfoCard(
                      title: "New Cases",
                      iconColor: Color(0xFF5856D6),
                      effectedNum: 52,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Preventions",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPreventation(),
                    SizedBox(
                      height: 30,
                    ),
                    buildHelpCard(context),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        PreventionCard(
          svgSrc: "assets/icons/hand_wash.svg",
          title: "Wash Hands",
        ),
        PreventionCard(
          svgSrc: "assets/icons/use_mask.svg",
          title: "Use Masks",
        ),
        PreventionCard(
          svgSrc: "assets/icons/Clean_Disinfect.svg",
          title: "Clean Disincfect",
        ),
      ],
    );
  }

  SizedBox buildHelpCard(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.4,
              top: 20,
              right: 20,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dial 999 for \nMedical Help!\n",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: "If any symptons appear",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset("assets/icons/nurse.svg"),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: SvgPicture.asset("assets/icons/virus.svg"),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/menu.svg"),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
