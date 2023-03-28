import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/auth/register/register_screen.dart';

class RoleUserScreen extends StatefulWidget {
  const RoleUserScreen({super.key});

  @override
  State<RoleUserScreen> createState() => _RoleUserScreenState();
}

class _RoleUserScreenState extends State<RoleUserScreen> {
  bool isCustomer = false;
  bool isAgent = false;
  bool isSales = false;

  List<Modeluser> roleUser = [
    Modeluser(
        isSelected: false,
        role: "Customer",
        roleDescription:
            "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
        urlImage: "assets/images/avatar_customer.png"),
    Modeluser(
        isSelected: false,
        role: "Agent",
        roleDescription:
            "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
        urlImage: "assets/images/avatar_agent.png"),
    Modeluser(
        isSelected: false,
        role: "Sales",
        roleDescription:
            "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
        urlImage: "assets/images/avatar_sales.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: size20px * 2.5),
              child: Center(
                child: Image.asset(
                  "assets/images/logo_biru.png",
                  width: 159.0,
                  height: 65.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: size20px * 1.5),
              child: Text(
                "Which role that describes you?",
                style: heading1,
              ),
            ),

            /* Customer */
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: roleUser.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: size20px / 2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Deselect all other containers
                      for (int i = 0; i < roleUser.length; i++) {
                        if (i != index) {
                          roleUser[i].isSelected = false;
                        }
                      }
                      // Select user
                      roleUser[index].isSelected = !roleUser[index].isSelected;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: roleUser[index].isSelected == true
                              ? secondaryColor1
                              : greyColor3),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.asset(
                            roleUser[index].urlImage,
                            width: 43.0,
                            height: 43.0,
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(roleUser[index].role),
                                const SizedBox(height: 5.0),
                                Text(
                                  roleUser[index].roleDescription,
                                  style: body2Light.copyWith(color: greyColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13.0),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (roleUser.any((role) => role.isSelected == true)) {
                      // If any container is selected, return primaryColor1
                      return primaryColor1;
                    } else {
                      // If no container is selected, return greyColor
                      return greyColor;
                    }
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
              onPressed: roleUser.any((role) => role.isSelected == true)
                  ? () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    }
                  : null,
              child: Text("Choose Role",
                  style: text16.copyWith(color: whiteColor)),
            )),
      ),
    );
  }
}

class Modeluser {
  String role;
  String roleDescription;
  String urlImage;
  bool isSelected;

  Modeluser(
      {required this.isSelected,
      required this.role,
      required this.roleDescription,
      required this.urlImage});
}
