import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WatchListDetail extends StatelessWidget {
  final watchList;
  const WatchListDetail({Key? key, required this.watchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    watchList.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(7),
                child: Text.rich(
                  TextSpan(
                    text: 'Release Date: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: DateFormat.yMMMMd('en_US')
                            .format(watchList.releaseDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.all(7),
                child: Text.rich(
                  TextSpan(
                    text: 'Rating: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                    children: <InlineSpan>[
                      TextSpan(
                        text: "${watchList.rating.toString()}/5",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(7, 7, 7, 0),
                child: const Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  watchList.review,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.fromLTRB(7, 7, 7, 15),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
