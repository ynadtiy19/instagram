
import 'package:flutter/material.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:instgram_app/ui/widget/MoreTextBio.dart';
import 'package:provider/provider.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  int? sizeText;
  ExpandableText({required this.text, this.sizeText});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: TextStyle(fontSize: 20,   color: isDarkMode ? Colors.white : Colors.black,),
          ),
          maxLines: 3,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        if (!_isExpanded && textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: widget.text.substring(0, widget.text.length ~/ 2) +
                      "... ",
                  style: TextStyle(fontSize: 16,   color: isDarkMode ? Colors.white : Colors.black,),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = true;
                          });
                        },
                        child: moreText()
                      ),
                    ),
                  ],
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        } else {
          return Text(widget.text,
              style: TextStyle(fontSize: 16,   color: isDarkMode ? Colors.white : Colors.black,));
        }
      },
    );
  }
}

