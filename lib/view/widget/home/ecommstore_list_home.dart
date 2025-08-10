import 'package:flutter/material.dart';
import 'package:tasawoqi/data/datasource/categoy.dart';

class Recommstore_list extends StatelessWidget {
  const Recommstore_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Recommstores.length,
          itemBuilder: (context, i) => SizedBox(
                width: 160,
                height: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            Recommstores[i].image,
                            height: 132,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(Recommstores[i].title1,
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(height: 5),
                        Text(
                          maxLines: 1, // سطر واحد فقط
                          overflow: TextOverflow.ellipsis,
                          Recommstores[i].titl2,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
