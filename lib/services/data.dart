import 'package:techtime/models/category_model.dart';

List<CategoryModel> getCategories(){
List<CategoryModel> category=[];

CategoryModel categoryModel = new CategoryModel();

categoryModel.categoryName = "Top Tech";
categoryModel.image="images/technology.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

categoryModel.categoryName = "";
categoryModel.image="images/indian tech.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

categoryModel.categoryName = "";
categoryModel.image="images/startup.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

categoryModel.categoryName = "";
categoryModel.image="images/apple.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

categoryModel.categoryName = " ";
categoryModel.image="images/tesla.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

categoryModel.categoryName = " ";
categoryModel.image="images/usa.jpeg";
category.add(categoryModel);
categoryModel = new CategoryModel();

return category;
}