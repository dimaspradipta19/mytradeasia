import 'package:flutter/material.dart';
import '../utils/theme.dart';

// Textfield
class TextEditingWidget extends StatelessWidget {
  const TextEditingWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.readOnly = true});

  final TextEditingController controller;
  final String hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: body1Regular.copyWith(color: greyColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: greyColor3),
            borderRadius: BorderRadius.all(Radius.circular(7.0))),
        focusedBorder: readOnly == false
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor1),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(color: greyColor3),
              ),
      ),
    );
  }
}

// Textfield with suffix
class TextEditingWithIconSuffix extends StatelessWidget {
  const TextEditingWithIconSuffix(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.imageUrl,
      required this.navigationPage,
      this.readOnly = false});

  final TextEditingController controller;
  final String hintText;
  final String imageUrl;
  final bool readOnly;
  final Widget navigationPage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: body1Regular.copyWith(color: greyColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: greyColor3),
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: greyColor3),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return navigationPage;
              },
            ));
          },
          icon: Image.asset(
            imageUrl,
            width: 24.0,
            height: 24.0,
          ),
        ),
      ),
    );
  }
}

// Textfield with prefix

class TextEditingWithPrefixFilled extends StatelessWidget {
  const TextEditingWithPrefixFilled(
      {Key? key,
      required this.hintText,
      required this.urlImage,
      required this.controller})
      : super(key: key);

  final String hintText;
  final String urlImage;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: body1Regular,
        filled: true,
        fillColor: whiteColor,
        prefixIcon: Image.asset("assets/images/icon_search.png"),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: greyColor3),
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor1),
        ),
      ),
    );
  }
}
