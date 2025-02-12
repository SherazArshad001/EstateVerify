
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:real_estate_app/feature/homepage/presentation/widgets/textfield.dart';

class BuySellCard extends StatelessWidget {
  const BuySellCard({
    super.key,
    required this.categories,
    required this.selectedIndex,
  });

  final List<String> categories;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () {
                  context.read<HomepageBloc>().add(SelectCategory(index));
                },
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: selectedIndex == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(top: 5),
                      height: 3,
                      width: 50,
                      color: selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(thickness: 1, height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 300,
              child: HomeTextField(
                placeholderText: 'Search property by location',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
