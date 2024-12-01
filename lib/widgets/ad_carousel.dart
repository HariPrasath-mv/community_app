import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class AdsCarousel extends StatefulWidget {
  const AdsCarousel({super.key});

  @override
  State<AdsCarousel> createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  final PageController _pageController = PageController();
  int _currentAdIndex = 0;

  final List<Map<String, String>> _ads = [
    {
      'image':
          'https://images.unsplash.com/photo-1657664072464-e525da1d426e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': '50% Off on New Fashion Collection!',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1595461240565-1f5779bc1d2b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Exclusive Deals for Community Members!',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1628336707631-68131ca720c3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': "Upcoming Yoga Session: Don't Miss Out!",
    },
    {
      'image':
          'https://images.unsplash.com/photo-1595877786670-393ef0ac0961?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Join the Gardening Club today!',
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _currentAdIndex + 1;
        if (nextPage >= _ads.length) {
          _pageController.jumpToPage(0);
          nextPage = 0;
        } else {
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        setState(() {
          _currentAdIndex = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _ads.length,
            onPageChanged: (index) {
              setState(() {
                _currentAdIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle ad tap
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  clipBehavior: Clip
                      .hardEdge, // Ensures border radius applies to children
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image
                      Image.network(
                        _ads[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                      // Transparent black overlay
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      // Text content
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _ads[index]['text']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Explore ➔',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _ads.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: _currentAdIndex == index
                    ? AppColors.fontColor3
                    : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
