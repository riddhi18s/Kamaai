import 'package:flutter/material.dart';



class AuthOptionCard extends StatelessWidget {


  final IconData icon;

  final String title;

  final String hinglishText;

  final Color color;

  final VoidCallback onTap;





  const AuthOptionCard({

    super.key,

    required this.icon,

    required this.title,

    required this.hinglishText,

    required this.color,

    required this.onTap,

  });







  @override
  Widget build(BuildContext context) {


    return InkWell(


      onTap: onTap,


      borderRadius:
          BorderRadius.circular(20),





      child: Container(


        height:
            120,


        padding:
            const EdgeInsets.symmetric(

              horizontal: 10,

              vertical: 10,

            ),





        decoration: BoxDecoration(


          color:
              color,



          borderRadius:
              BorderRadius.circular(20),





          boxShadow: [


            BoxShadow(


              color:
                  Colors.black.withOpacity(.08),


              blurRadius:
                  10,


              offset:
                  const Offset(0,5),


            ),


          ],


        ),






        child: Row(


          children: [





            Container(


              height:
                  44,


              width:
                  44,



              decoration: BoxDecoration(


                color:
                    Colors.white.withOpacity(.20),


                shape:
                    BoxShape.circle,


              ),




              child: Icon(


                icon,


                color:
                    Colors.white,


                size:
                    24,


              ),



            ),






            const SizedBox(width:10),







            Expanded(


              child: Column(


                mainAxisAlignment:
                    MainAxisAlignment.center,



                crossAxisAlignment:
                    CrossAxisAlignment.center,



                children: [





                  Text(


                    title,


                    maxLines:
                        2,


                    overflow:
                        TextOverflow.ellipsis,



                    textAlign:
                        TextAlign.center,



                    style: const TextStyle(


                      color:
                          Colors.white,


                      fontSize:
                          14,


                      fontWeight:
                          FontWeight.w800,


                    ),



                  ),







                  const SizedBox(height:4),






                  Text(


                    hinglishText,



                    maxLines:
                        1,



                    overflow:
                        TextOverflow.ellipsis,



                    textAlign:
                        TextAlign.center,



                    style: TextStyle(


                      color:
                          Colors.white.withOpacity(.9),


                      fontSize:
                          12,


                      fontWeight:
                          FontWeight.w600,


                    ),



                  ),





                ],



              ),



            ),






            const Icon(


              Icons.arrow_forward_ios_rounded,


              color:
                  Colors.white,


              size:
                  16,


            ),






          ],


        ),


      ),


    );


  }


}