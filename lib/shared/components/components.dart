import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webview_screen.dart';

import '../cubit/cubit.dart';
import 'constants.dart';

Widget articleBuilder(
    {required List news, required int index, required context}) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebviewScreen(link: news[index]['url']));
    },
    child: Padding(
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
                      color: AppCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
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

Widget newsBuilder({required List news, bool isSearch = false}) {
  return ConditionalBuilder(
    condition: news.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => articleBuilder(
        news: news,
        index: index,
        context: context,
      ),
      separatorBuilder: (context, index) => separatorBuilder(),
      itemCount: news.length,
    ),
    fallback: (context) => isSearch
        ? Container()
        : const Center(child: CircularProgressIndicator()),
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  var function,
  required var validated,
  required TextInputType type,
  bool hide = false,
  required String title,
  required Widget prefix,
  var suffix,
  var readOnly = false,
  required bool isDark,
}) {
  return TextFormField(
    style: isDark
        ? const TextStyle(color: Colors.white)
        : const TextStyle(color: Colors.black),
    onChanged: function,
    controller: controller,
    obscureText: hide,
    validator: validated,
    readOnly: readOnly,
    decoration: InputDecoration(
      labelText: title,
      labelStyle: const TextStyle(color: Colors.deepOrange),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.deepOrange,
      )),
      prefixIcon: prefix,
      prefixIconColor: Colors.deepOrange,
      suffix: suffix,
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
