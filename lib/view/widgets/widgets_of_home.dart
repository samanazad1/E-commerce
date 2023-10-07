import 'package:e_commerece/controllers/UI-cotrollers/tabbar_controller.dart';
import 'package:e_commerece/model/items_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.height * 0.25,
      child: Card(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * 0.001, vertical: mq.height * 0.025),
                child: SizedBox(
                  width: mq.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Clearance \nSales',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: mq.height * 0.01,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: mq.width * 0.8,
                        height: mq.height * 0.035,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Up to 50%',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              color: const Color.fromARGB(255, 65, 148, 67),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Image.asset('images/i14.png'),
            ],
          )),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SizedBox(
      height: mq.width * 0.14,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: const Icon(
              IconlyLight.search,
              size: 30,
              color: Color.fromARGB(255, 114, 113, 113),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 234, 232, 232),
            hintText: 'Search here...',
            hintStyle: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 101, 100, 100)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

class CategorieItem extends StatelessWidget {
  const CategorieItem(
      {super.key,
      required this.title,
      required this.index,
      required this.isSelected});
  final String title;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabbarController>(context, listen: false);
    var mq = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        provider.changeTabbar(index);
      },
      child: Container(
        height: mq.height * 0.052,
        margin: EdgeInsets.symmetric(horizontal: mq.width * 0.01),
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.001),
        width: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                isSelected ? null : Border.all(color: Colors.black, width: 2),
            color: isSelected ? Colors.green : Colors.white),
        child: Text(title,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0))),
      ),
    );
  }
}

class MainItems extends StatelessWidget {
  const MainItems({super.key, required this.itemModel});
  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          height: mq.height * 0.14,
          child: Image.network(
            itemModel.path,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemModel.itemName,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 101, 100, 100))),
                const SizedBox(
                  height: 2,
                ),
                Text('${itemModel.price}\$',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0))),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.star_outlined,
                  color: Color.fromARGB(249, 211, 184, 27),
                ),
                SizedBox(
                  width: 6,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    required this.items,
    required this.count,
  });
  final int count;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SizedBox(
      height: 400,
      child: GridView.builder(
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 1.0,
            mainAxisExtent: 170),
        itemBuilder: (context, index) {
          final itemModel = items[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                height: mq.height * 0.14,
                child: Image.network(
                  itemModel.path,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemModel.itemName,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 101, 100, 100))),
                      const SizedBox(
                        height: 2,
                      ),
                      Text('${itemModel.price}\$',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Color.fromARGB(249, 211, 184, 27),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
