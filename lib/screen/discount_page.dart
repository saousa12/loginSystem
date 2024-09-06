import 'package:flutter/material.dart';

class DiscountPage extends StatefulWidget {
  DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  List<Map<String, dynamic>> data = [
    // {
    //   "image": "",
    //   "title": "ส่วนลด 15%\nลดสูงสุด ฿1,000",
    //   "subtitle": "ขั้นต่ำ ฿500",
    //   "detail": "ใช้ได้ถึง 30/01/2564",
    //   "couponAction": true,
    // },
    // {
    //   "image": "",
    //   "title": "ส่วนลด 15%\nลดสูงสุด ฿1,200",
    //   "subtitle": "ขั้นต่ำ ฿500",
    //   "detail": "ใช้ได้ถึง 30/01/2564",
    //   "couponAction": false,
    // },
    // {
    //   "image": "",
    //   "title": "ส่วนลด 15%\nลดสูงสุด ฿1,200",
    //   "subtitle": "ขั้นต่ำ ฿500",
    //   "detail": "ใช้ได้ถึง 30/01/2567",
    //   "couponAction": true,
    // },
    // {
    //   "image": "",
    //   "title": "ส่วนลด 15%\nลดสูงสุด ฿1,200",
    //   "subtitle": "ขั้นต่ำ ฿500",
    //   "detail": "ใช้ได้ถึง 30/01/2567",
    //   "couponAction": true,
    // },
    // {
    //   "image": "",
    //   "title": "ส่วนลด 15%\nลดสูงสุด ฿1,200",
    //   "subtitle": "ขั้นต่ำ ฿500",
    //   "detail": "ใช้ได้ถึง 30/01/2567",
    //   "couponAction": true,
    // },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello world");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text(
          "ส่วนลด",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Container(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 15,
                color: Colors.blue,
              ),
              onPressed: () {
                print("you are tap");
              },
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade50,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                const Image(
                  image: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/shopping-commerce-10/64/gift_voucher-shopping-voucher-coupon-sale-discount-512.png",
                  ),
                  fit: BoxFit.cover,
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
                const Text(
                  "ส่วนลดทั้งหมด",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
            ),
            // Ticket
            Container(
                width: double.infinity,
                height: height * 0.78,
                child: data.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            image: NetworkImage(
                              "https://static.vecteezy.com/system/resources/previews/038/364/925/original/open-gift-with-gift-coupon-coins-3d-rendering-icon-illustration-simple-realistic-illustration-png.png",
                            ),
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            "ไม่มีคูปองส่วนลด",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ticketContainer(data[index]),
                                ),
                              ),
                            ],
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }

  Widget ticketContainer(Map<String, dynamic> data) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // width: width * 0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(15)),
                border: Border(
                  left: BorderSide(color: Colors.grey.shade200, width: 1),
                  bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  top: BorderSide(color: Colors.grey.shade200, width: 1),
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.5h9Nb8LU6gN1_oT3pbJRSQHaGR?rs=1&pid=ImgDetMain",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                ),
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data["title"],
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data["subtitle"],
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade600),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      Text(
                        data["detail"],
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.15,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                  width: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        border: Border(
                          left:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                          right:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                          bottom:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                            (constraints.constrainHeight() / 10).floor(),
                            (index) => Container(
                              width: 1,
                              height: 5,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 30,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        border: Border(
                          left:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                          right:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                          top:
                              BorderSide(color: Colors.grey.shade200, width: 1),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(15)),
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                    right: BorderSide(color: Colors.grey.shade200, width: 1),
                    top: BorderSide(color: Colors.grey.shade200, width: 1),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("you are tap");
                      setState(() {
                        data["couponAction"] = !data["couponAction"];
                        print(data["couponAction"]);
                      });
                    },
                    child: Container(
                      width: width * 0.17,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: data["couponAction"] == true
                                  ? Colors.red
                                  : Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            data["couponAction"] == true
                                ? "ยกเลิก"
                                : "ใช้คูปอง",
                            style: TextStyle(
                                color: data["couponAction"] == true
                                    ? Colors.red
                                    : Colors.blue,
                                fontWeight: FontWeight.w800,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tap");
                    },
                    child: const Text(
                      "เงื่อนไข",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
