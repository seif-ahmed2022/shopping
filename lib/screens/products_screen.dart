import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cubits/shopcubit.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';

// class ProductsScreen extends StatelessWidget {
//   ProductsScreen({Key? key, required this.homeModel, required this.category})
//       : super(key: key);
//
//   HomeModel homeModel;
//   Category category;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CarouselSlider(
//             items: homeModel.data!.banners
//                 .map((e) => Image(
//                       image: NetworkImage(e.image!),
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ))
//                 .toList(),
//             options: CarouselOptions(
//               height: MediaQuery.of(context).size.height / 4,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: const Duration(
//                 seconds: 3,
//               ),
//               autoPlayAnimationDuration: const Duration(seconds: 1),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               scrollDirection: Axis.horizontal,
//               viewportFraction: 1.0,
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 20.0),
//             child: Text(
//               "Categories",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Container(
//             height: 100,
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) =>
//                   categoryItem(category.data!.data[index]),
//               itemCount: category.data!.data.length,
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 20.0),
//             child: Text(
//               "Products",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 2 / 3,
//               crossAxisSpacing: 1,
//               mainAxisSpacing: 1,
//             ),
//             itemBuilder: (context, index) =>
//                 gridItem(homeModel.data!.products[index], context),
//             itemCount: homeModel.data!.products.length,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget gridItem(Product product, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             alignment: Alignment.bottomLeft,
//             children: [
//               Image(
//                 image: NetworkImage(product.image!),
//                 width: double.infinity,
//                 height: 100,
//                 // fit: BoxFit.cover,
//               ),
//               if (product.discount != 0)
//                 Container(
//                   color: Colors.red,
//                   child: const Text(
//                     "Discount",
//                     style: TextStyle(fontSize: 12, color: Colors.white),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Text(
//             product.name!,
//             style: const TextStyle(
//               fontSize: 14,
//               height: 1.3,
//             ),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Row(
//             children: [
//               Text(
//                 product.price!.toString(),
//                 style: const TextStyle(fontSize: 12, color: Colors.blue),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               if (product.discount != 0)
//                 Text(
//                   product.old_price!.toString(),
//                   style: const TextStyle(
//                       fontSize: 12,
//                       color: Colors.blue,
//                       decoration: TextDecoration.lineThrough),
//                 ),
//               //const Spacer(),              ////////////////////////////////////////////////////////////////////////////////
//               Expanded(
//                 child: CircleAvatar(
//                   radius: 15,
//                    backgroundColor:Colors.red,
//                   //backgroundColor: ShopCubit.get(context).favourites[product.id]!            /////////////////////////////////////////
//                     //  ? Colors.red                              /////////////////////////////////////////
//                       //: Colors.grey,                                               /////////////////////////////////////////
//                   child: IconButton(
//                     onPressed: () {
//                       //ShopCubit.get(context).changeFavourite(product.id!);            ///////////////////////////////////////////
//                      // ShopCubit.get(context).updateFavourites(product.id!);
//                      ShopCubit.get(context).getFavourites();
//
//                     },
//                     icon: const Center(
//                       child:  Icon(
//                         Icons.favorite_border,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget categoryItem(Data data) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Image(
//               image: NetworkImage(data.image!),
//               width: 150,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//             Container(
//               width: 150,
//               height: 20,
//               alignment: Alignment.center,
//               color: Colors.black.withOpacity(0.5),
//               child: Text(
//                 data.name!,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
// }








class ProductsScreen extends StatelessWidget {
  ProductsScreen({
    Key? key,
    required this.homeModel,
    required this.category,
  }) : super(key: key);
  HomeModel homeModel;
  Category category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel.data!.banners
                .map((e) => Image(
              image: NetworkImage(e.image!),
              fit: BoxFit.cover,
              width: double.infinity,
            ))
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 3,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(
                seconds: 3,
              ),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  categoryItem(category.data!.data[index]),
              itemCount: category.data!.data.length,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Products",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 30,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) =>
                gridItem(homeModel.data!.products[index],context),
            itemCount: homeModel.data!.products.length,
          ),
        ],
      ),
    );
  }

  Widget gridItem(Product product,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(product.image!),
                width: double.infinity,
                height: 200.0,
                //fit: BoxFit.cover,
              ),
              if (product.discount != 0)
                Container(
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Discount",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(product.name!,
              style: const TextStyle(
                fontSize: 14,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.price!.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
             // const SizedBox(width: 20),
              if (product.discount != 0)
                Expanded(
                  child: Text(
                    product.old_price!.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              //Spacer(),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    ShopCubit.get(context).changeFavourite(product.id!);
                    ShopCubit.get(context).updateFavourites(product.id!);
                    ShopCubit.get(context).getFavourites();

                  },
                  icon:  CircleAvatar(
                      backgroundColor:ShopCubit.get(context).favourites[product.id]! ? Colors.red:Colors.grey,
                      child: const Icon(Icons.favorite_border,color: Colors.white,)),
                ),
              ),
            ],
          ),
        ],
      ),
    );}

  Widget categoryItem(Data data) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: NetworkImage(data.image!),
          width: 150,
          height: 100,
          fit: BoxFit.cover,
        ),
        Container(
          width: 150,
          height: 20,
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.5),
          child: Text(
            data.name!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

