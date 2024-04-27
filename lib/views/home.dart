import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/models/category_model.dart';
import 'package:mynotes/models/diet_model.dart';
import 'package:mynotes/models/popular_model.dart';

enum MenuAction { logout }

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<CategoryModel> catigories = [];

  List<DietModel> diets = [];

  List<PopularDietModel> popularDiets = [];

  void _getInitialInfo() {
    catigories = CategoryModel.getCategories();
    diets = DietModel.getDiet();
    popularDiets = PopularDietModel.getPopularDiet();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            searchField(),
            const SizedBox(height: 40),
            catigorySection(),
            const SizedBox(height: 40),
            dietSection(),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Popular',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: popularDiets.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: popularDiets[index].viewIsSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: (popularDiets[index].viewIsSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.07),
                                    offset: const Offset(0, 10),
                                    blurRadius: 40,
                                    spreadRadius: 0,
                                  )
                                ]
                              : [])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiets[index].iconPath,
                            width: 65,
                            height: 65,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                popularDiets[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              Text(
                                '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calories}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xff7B6F72)),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/button.svg',
                              width: 30,
                              height: 30,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Column dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation for Diet',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 240,
            child: ListView.separated(
                itemCount: diets.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: diets[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          diets[index].iconPath,
                        ),
                        Column(
                          children: [
                            Text(
                              diets[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                              style: const TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 130,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              diets[index].viewIsSelected
                                  ? const Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? const Color(0xff92A3FD)
                                  : Colors.transparent,
                            ]),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : const Color(0xffC58BF2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Column catigorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 120,
            child: ListView.separated(
                itemCount: catigories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: catigories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              catigories[index].iconPatch,
                            ),
                          ),
                        ),
                        Text(catigories[index].name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0,
        )
      ]),
      child: TextField(
          decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search for recipes',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/search.svg'),
        ),
        suffixIcon: SizedBox(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      )),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/left arrow.svg',
              height: 20, width: 20),
        ),
      ),
      actions: [
        PopupMenuButton<MenuAction>(
          onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final showLogOut = await showLogOutDialog(context);
                if (showLogOut) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (_) => false);
                }

                break;
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Logout'),
              ),
            ];
          },
        ),
      ],
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/first/', (_) => false);
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
