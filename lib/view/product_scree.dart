import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:job_task/controller/provider/product_provider.dart';
import 'package:job_task/model/product_model.dart';
import 'package:job_task/view/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    if (!productProvider.isLoading && productProvider.products.isEmpty) {
      productProvider.fetchProducts();
    }

    final filteredProducts = productProvider.products.where((product) {
      return product.title.toLowerCase().contains(_searchTerm.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Products')),
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for a product...',
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
                  Text('${filteredProducts.length} results found'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return customContainer(product);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget customContainer(Product product) {
    return InkWell(
       onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(productId: product.id),
        ),
      );
    },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color.fromARGB(255, 224, 219, 219))
        ),
        child: Column(
          children: [
            Image.network(
              product.thumbnail,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(overflow: TextOverflow.ellipsis,
                        product.title,
                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    Text('${product.rating}'),
                    const SizedBox(width: 8),
                      RatingBarIndicator(
                      rating: product.rating.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  overflow: TextOverflow.ellipsis,
                  'by ${product.description}',
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//  Widget customContainer(Product product) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 5.0,
//             spreadRadius: 1.0,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             product.thumbnail,
//             width: 100.0,
//             height: 100.0,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(width: 16.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.title,
//                   style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4.0),
//                 Row(
//                   children: [
//                     Text(
//                       '\$${product.price.toStringAsFixed(2)}',
//                       style: const TextStyle(color: Colors.green),
//                     ),
//                     const SizedBox(width: 8.0),
//                     Text(
//                       'by ${product.description}',
//                       style: const TextStyle(fontSize: 12.0, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4.0),
//                 Row(
//                   children: [
//                     RatingBarIndicator(
//                       rating: product.rating.toDouble(),
//                       itemBuilder: (context, index) => const Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       itemCount: 5,
//                       itemSize: 20.0,
//                       direction: Axis.horizontal,
//                     ),
//                     const SizedBox(width: 8),
//                     Text('${product.rating}/5')
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
 
 //use of ...
//  Expanded(
//                     child: ListView.builder(
//                       itemCount: filteredProducts.length,
//                       itemBuilder: (context, index) {
//                         final product = filteredProducts[index];
//                         return customContainer(product);
//                       },
//                     ),
//                   ),
