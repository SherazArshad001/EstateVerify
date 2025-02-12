import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/core/common/appbar.dart';
import 'package:real_estate_app/core/utils/assets.dart';
import 'package:real_estate_app/core/utils/text.dart';
import 'package:real_estate_app/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:real_estate_app/feature/homepage/presentation/widgets/card.dart';
import 'package:real_estate_app/feature/homepage/presentation/widgets/stack_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstateVerifyAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Buy, rent, or sell your property easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'A great platform to buy, sell, or even rent your properties without any commissions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomepageBloc, HomepageState>(
                builder: (context, state) {
                  int selectedIndex =
                      (state is HomepageInitial) ? state.selectedIndex : 0;

                  final categories = [
                    AppTexts.rent,
                    AppTexts.buy,
                    AppTexts.sell,
                  ];
                  return BuySellCard(
                    categories: categories,
                    selectedIndex: selectedIndex,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PropertyStackImage(
                      imagePath: Assets.stackImage1,
                      title: '50k+ renters',
                      subtitle: 'believe in our service',
                    ),
                    PropertyStackImage(
                      imagePath: Assets.stackImage2,
                      title: '10k+ properties',
                      subtitle: 'ready for occupancy',
                    ),
                  ],
                ),
              ),
              Text(
                'The new way to find your new home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              Text(
                'Find your dream place to live in with more than 10k+ properties listed.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Image.asset(
                Assets.exploreImage,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
