import 'package:flutter/material.dart';
import 'package:job_task/controller/provider/category_provider.dart';
import 'package:job_task/model/category_model.dart';
import 'package:provider/provider.dart';



class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final filteredCategories = categoryProvider.categories.where((category) {
      return category.name.toLowerCase().contains(_searchTerm.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Categories')),
      ),
      body: categoryProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search categories...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchTerm = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return buildCategoryItem(category);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildCategoryItem(CategoryModel category) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(category.url??''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Center(
          child: Text(
            category.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
