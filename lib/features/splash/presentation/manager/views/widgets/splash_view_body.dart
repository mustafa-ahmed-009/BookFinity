import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/presenation/manager/cubit/shared_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            effects: [
              FadeEffect(
                  duration: Duration(
                seconds: 1,
              )),
              SlideEffect(
                  delay: Duration(milliseconds: 100),
                  duration: Duration(seconds: 1))
            ],
            child: Image.asset(
              "assets/images/Logo.png",
              scale: 0.9,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
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
                  borderSide: BorderSide(color: kborderColor, width: 2),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              // Check if the input is empty
              if (_controller.text.trim().isEmpty) {
                // Show an error or feedback

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(
                        child: Text("Please enter a topic before proceeding.")),
                    backgroundColor: kPrimaryColor,
                  ),
                );
              } else {
                BlocProvider.of<SharedDataCubit>(context).topic =
                    _controller.text;

                GoRouter.of(context).go(AppRouter.kHomeView);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            ),
            child: Text(
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
