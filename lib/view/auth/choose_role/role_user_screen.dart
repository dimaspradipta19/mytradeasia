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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 53),
            Center(
              child: Image.asset(
                "assets/images/logo_biru.png",
                width: 159.0,
                height: 65.0,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Which role that describes you?",
              style: heading1,
            ),
            const SizedBox(height: 30),
            // Customer
            GestureDetector(
              onTap: () {
                setState(() {
                  isCustomer = !isCustomer;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isCustomer == true ? secondaryColor1 : greyColor3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/avatar_customer.png",
                        width: 43.0,
                        height: 43.0,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Costumer"),
                            const SizedBox(height: 5.0),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
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
            const SizedBox(height: 10),
            // Agent
            GestureDetector(
              onTap: () {
                const snackbar = SnackBar(
                  content: Text(
                      "Agent is under Development, sorry for the incovenience! "),
                  backgroundColor: redColor1,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isAgent == true ? secondaryColor1 : greyColor3),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/avatar_agent.png",
                        height: 43.0,
                        width: 43.0,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Agent"),
                            const SizedBox(height: 5.0),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
                              style: body2Light.copyWith(color: greyColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Sales Associate
            GestureDetector(
              onTap: () {
                const snackbar = SnackBar(
                  content: Text(
                      "Sales Associate is under Development, sorry for the incovenience! "),
                  backgroundColor: redColor1,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isSales == false ? greyColor3 : secondaryColor1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/avatar_sales.png",
                        width: 43.0,
                        height: 43.0,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Sales Associate"),
                            const SizedBox(height: 5.0),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. In est porta nisi pulvinar lectus fringilla eget volutpat.",
                              style: body2Light.copyWith(color: greyColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: isCustomer == true
              ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor1),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  child: Text("Choose Role",
                      style: text16.copyWith(color: whiteColor)),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(greyColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Choose Role",
                    style: text16.copyWith(color: whiteColor),
                  ),
                ),
        ),
      ),
    );
  }
}
