import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/list_view_items.dart';
import 'package:flutter_ebook_app/tabs.dart';
import 'package:flutter_ebook_app/utils/app_color.dart';
import 'package:flutter_ebook_app/utils/paths.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late List popularBooks;
  late List books;
  late TabController _tabController;
  late ScrollController _scrollController;

  void readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("${Paths.jsonPath}popular_books.json")
        .then((value) => {
              setState(() {
                popularBooks = json.decode(value);
              })
            });
  }

  void readBooks() async {
    await DefaultAssetBundle.of(context)
        .loadString("${Paths.jsonPath}books.json")
        .then((value) => {
              setState(() {
                books = json.decode(value);
              })
            });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    readData();
    readBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage("assets/img/menu.png"),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.notifications),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Popular Books",
                      style: GoogleFonts.lato(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Container(
                height: 190,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      bottom: 0,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount:
                            popularBooks == null ? 0 : popularBooks.length,
                        itemBuilder: (_, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(popularBooks[i]["img"]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: AppColors.sliverBackground,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(10),
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 15, left: 20, right: 10),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              controller: _tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 7,
                                      offset: const Offset(0, 0))
                                ],
                              ),
                              tabs: const [
                                Tabs(title: "New", color: AppColors.menu1Color),
                                Tabs(
                                    title: "Popular",
                                    color: AppColors.menu2Color),
                                Tabs(
                                    title: "Trending",
                                    color: AppColors.menu3Color),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: 5,
                          itemBuilder: (_, i) {
                            return Container(
                              // height: 120,
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: ListViewItems(
                                image: books[i]["img"],
                                tittle: books[i]["title"],
                                subtitle: books[i]["text"],
                                ratting: books[i]["rating"],
                              ),
                            );
                          }),
                      const Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Content"),
                        ),
                      ),
                      const Material(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text("Content"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
