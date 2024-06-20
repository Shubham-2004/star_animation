import 'package:flutter/material.dart';
import 'package:icon_animation/provider/card_item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('3 Card View')),
          body: CardView(),
        ),
      ),
    );
  }
}

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedList(
            key: _listKey,
            scrollDirection: Axis.horizontal,
            initialItemCount: provider.cards.length,
            itemBuilder: (context, index, animation) {
              return buildCard(provider.cards[index], index, animation);
            },
          ),
        );
      },
    );
  }

  Widget buildCard(Widget card, int index, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
      child: card,
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String name;
  final String title;
  final String mutualConnection;

  CardItem({
    required this.color,
    required this.name,
    required this.title,
    required this.mutualConnection,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      color: color,
      child: Container(
        width: 250, // Fixed width
        height: 300, // Fixed height
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.cancel),
                color: Colors.grey,
                onPressed: () {
                  final cardProvider = context.read<CardProvider>();
                  cardProvider.removeCard(name);
                },
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      title,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/5e/11/d9/5e11d90a049c701335f3d3cb9ac673dc.jpg'),
                ),
                SizedBox(width: 5),
                Text(
                  mutualConnection,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 10),
            Consumer<CardProvider>(
              builder: (context, provider, _) {
                bool isFollowing = provider.isFollowing(name);
                return ElevatedButton.icon(
                  onPressed: () {
                    provider.toggleFollow(name);
                  },
                  icon: Icon(isFollowing
                      ? Icons.person_remove_alt_1
                      : Icons.person_add_alt_1),
                  label: Text(isFollowing ? 'Unfollow' : 'Follow'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: isFollowing ? Colors.red : Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
