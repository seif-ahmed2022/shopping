import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/models/category_model.dart';
import 'package:shopping/shared/local/const.dart';
import 'package:shopping/shared/remote/dio_helper.dart';
import '../models/favourite_model.dart';
import '../models/home_model.dart';
import '../models/update_fav.dart';
import '../screens/categries_screen.dart';
import '../screens/favourites_screen.dart';
import '../screens/products_screen.dart';
import '../screens/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);


  List<Widget> screens()=> [
    ProductsScreen(homeModel: homeModel!, category: categories!,),
     CategoriesScreen(category: categories!,),
     FavouritesScreen(favourites: favouriteModel!,),
    const SettingsScreen(),
  ];
  int currentIndex=0;
  void changeBottomIndex(int index){
    currentIndex=index;
    emit(ChangeBottomIndexState());
  }


  Map<int, bool> favourites={};
  HomeModel? homeModel;

  void changeFavourite(int id){
    favourites [id]=! favourites[id]!;
    emit(ChangeFavouriteState());
  }

  void getHomeData(){
    emit(GetHomeDataLoadingState());
    DioHelper.getData(url: "home",
        token: Constant.token,
      lang: "en",
    ).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      if(homeModel != null)
      {
        homeModel!.data!.products.forEach((product) {
          favourites.addAll({product.id!: product.in_favourites!});
        });
      }
      print(favourites);
      emit(GetHomeDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetHomeDataErrorState());
    });

  }

  Category? categories;
  void getCategories(){
    emit(GetCategoryLoadingState());
    DioHelper.getData(url: "categories", lang: 'en',).then((value)  {
      categories=Category.fromJson(value.data);
      print("category done");
      print(categories!.data!.data[0].name);
      emit(GetCategorySuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetCategoryErrorState());
    });
  }


  FavouriteModel? favouriteModel;
    void getFavourites(){
      emit(GetFavouritesLoadingState());
      DioHelper.getData(url: "favourites", lang: 'en', token: Constant.token).then((value)  {
        favouriteModel=FavouriteModel.fromJson(value.data);
        print(favouriteModel!.status!);
        emit(GetFavouritesSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(GetFavouritesErrorState());
      });
    }


     UpdateFavourites? result;
    void updateFavourites(int productId){
      emit(UpdateFavouritesLoadingState());
      DioHelper.postData(
          url: "favourites",
        data: {
            "product_id":productId,
        },
        token: Constant.token,
      ).then((value) {
        result=UpdateFavourites.fromJson(value.data);
        print(result!.message!);
        emit(UpdateFavouritesSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(UpdateFavouritesErrorState());
      });
    }

}



abstract class ShopStates{}
class ShopInitialState extends ShopStates{}

class ChangeBottomIndexState extends ShopStates{}

class GetHomeDataLoadingState extends ShopStates{}
class GetHomeDataSuccessState extends ShopStates{}
class GetHomeDataErrorState extends ShopStates{}

class GetCategoryLoadingState extends ShopStates{}
class GetCategorySuccessState extends ShopStates{}
class GetCategoryErrorState extends ShopStates{}

class ChangeFavouriteState extends ShopStates{}

class GetFavouritesLoadingState extends ShopStates{}
class GetFavouritesSuccessState extends ShopStates{}
class GetFavouritesErrorState extends ShopStates{}

class UpdateFavouritesLoadingState extends ShopStates{}
class UpdateFavouritesSuccessState extends ShopStates{}
class UpdateFavouritesErrorState extends ShopStates{}