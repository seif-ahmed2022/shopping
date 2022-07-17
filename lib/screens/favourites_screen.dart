import 'package:flutter/material.dart';
import 'package:shopping/cubits/shopcubit.dart';
import 'package:shopping/models/favourite_model.dart';

// class FavouritesScreen  extends StatelessWidget {
//    FavouritesScreen({Key? key, required this.favourites}) : super(key: key);
//
//    FavouriteModel favourites;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children:[
//           GridView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 2 / 3,           ///( 1 / 1)
//               crossAxisSpacing: 1,
//               mainAxisSpacing: 1,
//             ),
//             itemBuilder: (context, index) =>
//                 gridItem(favourites.data!.data![index].product!, context),
//             itemCount: favourites.data!.data!.length,
//           ),
//         ],
//       ),
//     );
//
//   }
//    Widget gridItem(Product product, BuildContext context) {
//      return Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            Stack(
//              alignment: Alignment.bottomLeft,
//              children: [
//                Image(
//                  image: NetworkImage(product.image!),
//                  width: double.infinity,
//                  height: 100,
//                  // fit: BoxFit.cover,
//                ),
//                if (product.discount != 0)
//                  Container(
//                    color: Colors.red,
//                    child: const Text(
//                      "Discount",
//                      style: TextStyle(fontSize: 12, color: Colors.white),
//                    ),
//                  ),
//              ],
//            ),
//            const SizedBox(
//              height: 20,
//            ),
//            Text(
//              product.name!,
//              style: const TextStyle(
//                fontSize: 14,
//                height: 1.3,
//              ),
//              maxLines: 2,
//              overflow: TextOverflow.ellipsis,
//            ),
//            Row(
//              children: [
//                Text(
//                  product.price!.toString(),
//                  style: const TextStyle(fontSize: 12, color: Colors.blue),
//                ),
//                const SizedBox(
//                  width: 20,
//                ),
//                if (product.discount != 0)
//                  Text(
//                    product.oldPrice!.toString(),
//                    style: const TextStyle(
//                        fontSize: 12,
//                        color: Colors.blue,
//                        decoration: TextDecoration.lineThrough),
//                  ),
//                //const Spacer(),              ////////////////////////////////////////////////////////////////////////////////
//                Expanded(
//                  child: CircleAvatar(
//                    radius: 15,
//                    backgroundColor:Colors.red,
//                    //backgroundColor: ShopCubit.get(context).favourites[product.id]!            /////////////////////////////////////////
//                    //  ? Colors.red                              /////////////////////////////////////////
//                    //: Colors.grey,                                               /////////////////////////////////////////
//                    child: IconButton(
//                      onPressed: () {
//                      //  ShopCubit.get(context).changeFavourite(product.id!);            ///////////////////////////////////////////
//                     //   ShopCubit.get(context).updateFavourites(product.id!);
//                       ShopCubit.get(context).getFavourites();
//                      },
//                      icon: const Center(
//                        child:  Icon(
//                          Icons.favorite_border,
//                          color: Colors.white,
//                          size: 18,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
//      );
//    }
//
// }







class FavouritesScreen  extends StatelessWidget {
  FavouritesScreen ({Key? key,required this.favourites}) : super(key: key);
  FavouriteModel favourites;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) =>
                gridItem(favourites.data!.data![index].product!,context),
            itemCount:favourites.data!.data!.length,
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
              //const SizedBox(width: 20),
              if (product.discount != 0)
                Expanded(
                  child: Text(
                    product.oldPrice!.toString(),
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
}
