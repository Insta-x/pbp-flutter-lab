import 'package:counter_7/fetch_mywatchlist.dart';
import 'package:counter_7/watchlist.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/watchlist_detail.dart';
import 'package:flutter/material.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot<List<Watch>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Text(
                "Tidak ada Watchlist",
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  child: InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        snapshot.data![index].title,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WatchListDetail(
                            watchList: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
