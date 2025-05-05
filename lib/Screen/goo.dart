import 'dart:async';
import 'package:flutter/material.dart';

class AutoSlidingBanner
    extends
        StatefulWidget {
  final List<
    String
  >
  imageUrls;
  final double
  height;

  const AutoSlidingBanner({
    Key?
    key,
    required this.imageUrls,
    this.height =
        180,
  }) : super(
         key:
             key,
       );

  @override
  State<
    AutoSlidingBanner
  >
  createState() =>
      _AutoSlidingBannerState();
}

class _AutoSlidingBannerState
    extends
        State<
          AutoSlidingBanner
        > {
  late PageController
  _pageController;
  int
  _currentPage =
      0;
  Timer?
  _timer;

  @override
  void
  initState() {
    super
        .initState();
    _pageController = PageController(
      initialPage:
          _currentPage,
    );
    _startAutoSlide();
  }

  void
  _startAutoSlide() {
    _timer = Timer.periodic(
      const Duration(
        seconds:
            3,
      ),
      (
        timer,
      ) {
        if (_currentPage <
            widget.imageUrls.length -
                1) {
          _currentPage++;
        } else {
          _currentPage =
              0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(
            milliseconds:
                500,
          ),
          curve:
              Curves.easeInOut,
        );
      },
    );
  }

  @override
  void
  dispose() {
    _timer
        ?.cancel();
    _pageController
        .dispose();
    super
        .dispose();
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return SizedBox(
      height:
          widget.height,
      child: PageView.builder(
        controller:
            _pageController,
        itemCount:
            widget.imageUrls.length,
        itemBuilder: (
          context,
          index,
        ) {
          return Image.asset(
            widget.imageUrls[index],
            fit:
                BoxFit.cover,
            width:
                double.infinity,
          );
        },
      ),
    );
  }
}
