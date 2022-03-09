import 'package:flutter/material.dart';

class HeaderBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final double? height;
  final bool isShowButtonClose;
  final bool isShowButtonCloseLeft;
  final bool showClearButton;
  final Function? onPressedClear;
  final Color? colorIconClose;
  final TextStyle? titleHeaderModalTextStyle;

  const HeaderBottomSheet(
      {Key? key,
      this.title,
      this.titleWidget,
      this.height,
      this.colorIconClose,
      this.isShowButtonClose = true,
      this.isShowButtonCloseLeft = false,
      this.showClearButton = false,this.titleHeaderModalTextStyle,
      this.onPressedClear})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? (titleWidget != null ? 83 : 63),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Stack(
            children: [
              if (isShowButtonCloseLeft)
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: colorIconClose,
                          ),
                        ))),
              Center(
                child: titleWidget ??
                    Text(
                      this.title ?? '',
                      textAlign: TextAlign.center,
                      style: titleHeaderModalTextStyle ?? Theme.of(context).textTheme.subtitle1,
                    ),
              ),
              if (isShowButtonClose)
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: colorIconClose,
                          ),
                        ))),
              if (showClearButton)
                TextButton(
                    onPressed: () {
                      if (onPressedClear == null) return;
                      onPressedClear!();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text('Clear'),
                    ))
            ],
          ),
        ));
  }
}
