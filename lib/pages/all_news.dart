import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:techtime/models/article_model.dart';
import 'package:techtime/models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
import 'article_view.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];

  void initState() {

    getSlider();
    getNews();
    super.initState();
  }

  getNews()async{
    News newsclass =News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {

    });

  }

  getSlider()async{
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
setState(() {

});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(




        title:
      Text(
          widget.news+"news" ,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)
      ),
        centerTitle: true,
        elevation: 0.0,
      ),



      body: Container(child:
        ListView.builder(shrinkWrap: true,physics: ClampingScrollPhysics(), itemCount: widget.news == "Breaking"? sliders.length: articles.length, itemBuilder: (context,index){
          return AllNewsSection(
            Image: widget.news == "Breaking"? sliders[index].urlToImage!:articles[index].urlToImage!,
            desc: widget.news == "Breaking"? sliders[index].description!:articles[index].description!,
            title: widget.news == "Breaking"? sliders[index].title!:articles[index].title!,
            url: widget.news == "Breaking"? sliders[index].url!:articles[index].url!,);
        }),
      ),

    );
  }
}
class AllNewsSection extends StatelessWidget {
  String Image,desc,title,url;

 AllNewsSection({required this. Image, required this.desc, required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
        },child:Container(
      child: Column(
        children: [
          ClipRRect (
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(imageUrl: Image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(title,maxLines:2,style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold), ),
          Text(desc,maxLines: 3,),
          SizedBox(height: 20.0,),
        ],
      ),
    )
    );
  }
}

class ScreenshotIconExample extends StatefulWidget {
  @override
  _ScreenshotIconExampleState createState() => _ScreenshotIconExampleState();
}

class _ScreenshotIconExampleState extends State<ScreenshotIconExample> {
  // Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _takeScreenshot,
            tooltip: 'Capture Screenshot',
          ),
        ],
      ),
      body: Screenshot(
        controller: screenshotController,
        child: Center(
          child: Text(
            '',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    // Capture the screenshot
    final image = await screenshotController.capture();

    if (image != null) {
      // Save the image to the gallery
      final result = await ImageGallerySaver.saveImage(
        image,
        quality: 100,
        name: "screenshot-${DateTime.now().toIso8601String()}",
      );

      // Show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('')),
      );
    }
  }
}


