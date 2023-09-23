import 'package:flutter/material.dart';

import '../controller/fetchMeme.dart';
import '../controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imgUrl = "";
  int? memeNo;
  int targetMeme = 100;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getInitMemeNo();

    updateImg();
  }

  getInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo! > 100) {
      targetMeme = 500;
    } else if (memeNo! > 500) {
      targetMeme = 1000;
    }
    setState(() {});
  }

  void updateImg() async {
    String getImgUrl = await FetchMeme.fetchNewMeme();
    // imgUrl = getImgUrl;
    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: totalHeight / 10,
            ),
            Text(
              "Meme #${memeNo.toString()}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: totalHeight / 45,
            ),
            Text(
              "Target $targetMeme Memes",
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: totalHeight / 30,
            ),
            isLoading
                ? SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Image.network(
                    height: totalHeight / 1.7,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    imgUrl),
            SizedBox(
              height: totalHeight / 35,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(
                  () {
                    isLoading = true;
                  },
                );
                await SaveMyData.saveData(memeNo! + 1);
                getInitMemeNo();

                updateImg();
              },
              child: SizedBox(
                height: totalHeight / 25,
                width: 150,
                child: const Center(
                  child: Text(
                    "More Fun!!",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "APP CREATED BY",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "Deepesh Kalura",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: totalHeight / 55,
            ),
          ],
        ),
      ),
    );
  }
}
