import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/shared_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animate(
            effects: const [
              FadeEffect(
                  duration: Duration(
                seconds: 1,
              )),
              SlideEffect(
                  delay: Duration(milliseconds: 100),
                  duration: Duration(seconds: 1))
            ],
            child: Image.asset(
              kLogoImage,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onSubmitted: (value) {
                 submitTopic(_controller, context);  
              },
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter a topic you are interested in",
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kborderColor, width: 2),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              submitTopic(_controller, context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            ),
            child: const Text(
              "Start",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void submitTopic(
    TextEditingController textController, BuildContext context) async {
  if (textController.text.trim().isEmpty) {
    // Show an error or feedback

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text("Please enter a topic before proceeding.")),
        backgroundColor: kPrimaryColor,
      ),
    );
  } else {
    BlocProvider.of<SharedDataCubit>(context).topic = textController.text;
    var boxFeatured = Hive.box<BookEntity>(kHiveFeaturebBox);
    var boxNewest = Hive.box<BookEntity>(kHiveNewsetBox);
    await boxFeatured.clear();
    await boxNewest.clear();
    GoRouter.of(context).go(AppRouter.kHomeView);
  }
}
