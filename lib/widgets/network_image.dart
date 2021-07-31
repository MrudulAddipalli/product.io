import 'package:flutter/material.dart';
import 'package:productdotio/utilities/theme.dart' as UtilTheme;

class NetworkImage extends StatelessWidget {
  const NetworkImage({
    Key? key,
    required String imageURL,
  })  : _imageURL = imageURL,
        super(key: key);

  final String _imageURL;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "${_imageURL}",
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) =>
          (loadingProgress == null)
              ? child
              : Center(
                  child: CircularProgressIndicator(
                    color: UtilTheme.productColor,
                  ),
                ),
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.cancel,
          color: Colors.redAccent,
          size: 25,
        );
      },
    );
  }
}
