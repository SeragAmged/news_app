import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import 'constants.dart';

Widget buildArticleBuilder(
    {required List news, required int index, required context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                news[index]['urlToImage'] ?? errorImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news[index]['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:AppCubit.get(context).isDark ? Colors.white:Colors.black,
                  ),
                  // Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const SizedBox(height: 5),
                Text(
                  news[index]['publishedAt'],
                  style: const TextStyle(
                    color: Colors.grey,
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

Widget separatorBuilder() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 1,
      color: Colors.grey,
    ),
  );
}

Widget newsBuilder({required List news}) {
  return GestureDetector(
    onHorizontalDragStart: (details) {},
    child: ConditionalBuilder(
      condition: news.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleBuilder(
          news: news,
          index: index,
          context: context,
        ),
        separatorBuilder: (context, index) => separatorBuilder(),
        itemCount: news.length,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    ),
  );
}
