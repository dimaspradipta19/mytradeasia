import 'package:flutter/material.dart';

import '../../../../../../config/themes/theme.dart';

class NotificationMenu extends StatefulWidget {
  const NotificationMenu({super.key});

  @override
  State<NotificationMenu> createState() => _NotificationMenuState();
}

class _NotificationMenuState extends State<NotificationMenu> {
  bool isNotificationOn = false;
  bool shipmentNotification = false;
  bool documentNotification = false;
  bool messageNotification = false;
  bool quotationNotificaiton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Notifications", style: heading2),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/images/icon_back.png",
              width: 24.0,
              height: 24.0,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: size20px),
        child: Column(
          children: [
            // Push Notification
            SizedBox(
              height: size20px + 30.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Push notification",
                    style: body1Medium,
                  ),
                  Switch.adaptive(
                      value: isNotificationOn,
                      onChanged: (bool value) {
                        setState(() {
                          isNotificationOn = value;
                          shipmentNotification = value;
                          documentNotification = value;
                          messageNotification = value;
                          quotationNotificaiton = value;
                        });

                        // print("all notif: $isNotificationOn");
                        // print("shipment notif: $shipmentNotification");
                        // print("document notif: $documentNotification");
                        // print("message notif: $messageNotification");
                        // print("quotation notif: $quotationNotificaiton");
                      })
                ],
              ),
            ),
            const SizedBox(height: size20px / 4),
            // Shipment Notification
            isNotificationOn == true
                ? Column(
                    children: [
                      SizedBox(
                        height: size20px + 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Shipment notification",
                              style: body1Medium,
                            ),
                            Switch.adaptive(
                                value: shipmentNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    shipmentNotification = value;
                                  });
                                  print(
                                      "shipment notif: $shipmentNotification");
                                })
                          ],
                        ),
                      ),
                      // Document Notification
                      SizedBox(
                        height: size20px + 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Document notification",
                              style: body1Medium,
                            ),
                            Switch.adaptive(
                                value: documentNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    documentNotification = value;
                                  });
                                  print(
                                      "document notif: $documentNotification");
                                })
                          ],
                        ),
                      ),
                      // Message Notification
                      SizedBox(
                        height: size20px + 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Message notification",
                              style: body1Medium,
                            ),
                            Switch.adaptive(
                                value: messageNotification,
                                onChanged: (bool value) {
                                  setState(() {
                                    messageNotification = value;
                                  });
                                  print("message notif: $messageNotification");
                                })
                          ],
                        ),
                      ),
                      // Quotation Status Notification
                      SizedBox(
                        height: size20px + 30.0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Quotation Status notification",
                              style: body1Medium,
                            ),
                            Switch.adaptive(
                                value: quotationNotificaiton,
                                onChanged: (bool value) {
                                  setState(() {
                                    quotationNotificaiton = value;
                                  });
                                  print(
                                      "quotation notif: $quotationNotificaiton");
                                })
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
