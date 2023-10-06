import 'package:e_commerece/controllers/UI-cotrollers/tabbar_controller.dart';
import 'package:e_commerece/model/data/categories_data.dart';
import 'package:e_commerece/view/widgets/widgets_of_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    List<List<Widget>> items = const [
      [MainItems(), MainItems(), MainItems(), MainItems()],
      [
        Center(
          child: Text('s'),
        )
      ],
      [
        Center(
          child: Text('sd'),
        )
      ],
      [
        Center(
          child: Text('ffdf'),
        )
      ],
      [
        Center(
          child: Text('vcvd'),
        )
      ],
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.03, vertical: mq.height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SearchInput(),
            SizedBox(
              height: mq.height * 0.024,
            ),
            const MainCard(),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.montserrat(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ],
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            Consumer<TabbarController>(
              builder: (context, provider, child) => SizedBox(
                height: mq.height * 0.04,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: availableCategories.length,
                  itemBuilder: (context, index) {
                    final item = availableCategories[index];
                    return CategorieItem(
                      isSelected: index == provider.index,
                      title: item.title,
                      index: index,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: mq.height * 0.024,
            ),
            Consumer<TabbarController>(
                builder: (context, value, child) => CustomGrid(
                      items: items[value.index],
                      count: items[value.index].length,
                    ))
          ],
        ),
      ),
    );
  }
}
