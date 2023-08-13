part of 'view.dart';
class _Item extends StatelessWidget {
  final MovieModel model;
  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor.withOpacity(0.15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              model.image,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(model.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                SizedBox(height: 16,),
                Text(model.overview, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).hintColor),),
                SizedBox(height: 16,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber,),
                    SizedBox(width: 4,),
                    Text(model.voteAverage.toString(), style: TextStyle(fontWeight: FontWeight.w700, color: Colors.amber,),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
