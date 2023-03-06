import 'package:flutter/material.dart';
import '../utils/theme.dart';

// Textfield
class TextEditingWidget extends StatelessWidget {
  const TextEditingWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.readOnly = true,
      this.inputType = TextInputType.text});

  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: inputType,
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
      this.controller,
      required this.hintText,
      required this.imageUrl,
      required this.navigationPage,
      this.readOnly = false});

  final TextEditingController? controller;
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


// DropdownTextField
/*
class TextEditingDropdown extends StatefulWidget {
  const TextEditingDropdown({super.key, this.selectedValue});
final  String? selectedValue;

  @override
  State<TextEditingDropdown> createState() => _TextEditingDropdownState();
}

class _TextEditingDropdownState extends State<TextEditingDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Image.asset("assets/images/icon_bottom.png"),
      hint: Text(
        "Unit",
        style: body1Regular.copyWith(color: greyColor),
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      style: body1Regular,
      items: const [
        DropdownMenuItem(
          value: 'Tonne',
          child: Text('Tonne', style: body1Regular),
        ),
        DropdownMenuItem(
          value: '20” FCL',
          child: Text('20” FCL', style: body1Regular),
        ),
        DropdownMenuItem(
          value: 'Litres',
          child: Text('Litres', style: body1Regular),
        ),
        DropdownMenuItem(
          value: 'Kilogram (Kg)',
          child: Text('Kilogram (Kg)', style: body1Regular),
        ),
        DropdownMenuItem(
          value: 'Metric Tonne (MT)',
          child: Text('Metric Tonne (MT)', style: body1Regular),
        ),
      ],
      value: widget.selectedValue,
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value;
        });
      },
    );
  }
}
*/
