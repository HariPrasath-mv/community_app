import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final void Function(String)? onSearch;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Search...',
    this.onSearch,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text(
            "My Community",
            style: TextStyle(color: AppColors.fontColor2),
          ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isActive = false;
                              });
                              _controller.clear();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        onSubmitted: widget.onSearch,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
