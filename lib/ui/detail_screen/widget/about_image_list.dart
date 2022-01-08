import 'package:flutter/material.dart';

class AboutImageList extends StatelessWidget {
  const AboutImageList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 3,
                                      offset: Offset(5.0, 5.0)),
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 3,
                                      offset: Offset(-5.0, -5.0))
                                ],
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.hardEdge,
                                child: Container(
                                  child: Image.asset(
                                    "assets/1-$i.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
                
  }
}