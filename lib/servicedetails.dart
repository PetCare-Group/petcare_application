import 'package:flutter/material.dart';
import 'package:petcare_application/api/UserService.dart';
import 'package:petcare_application/api/Review.dart';
import 'package:petcare_application/api/ReviewService.dart';

class ServiceDetails extends StatefulWidget {
  final UserService userService;
  final String imageUrl;

  const ServiceDetails({Key? key, required this.userService, required this.imageUrl})
      : super(key: key);

  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  late Future<List<Review>> futureReviews;

  @override
  void initState() {
    super.initState();
    futureReviews = ReviewService.fetchReviewsByService(widget.userService.serviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Servicio'),
        backgroundColor: Color.fromRGBO(248, 209, 55, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.userService.user.firstName} ${widget.userService.user.lastName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Ubicación: ${widget.userService.location}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descripción: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
        Flexible(
          child: Text(
            '${widget.userService.description}',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),),),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Correo: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.userService.user.mail,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Teléfono: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.userService.phone,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Precio: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'S/.${widget.userService.price}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 8,),
            FutureBuilder<List<Review>>(
              future: futureReviews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  double averageStars = snapshot.data!
                      .map((review) => review.stars)
                      .reduce((a, b) => a + b) /
                      snapshot.data!.length;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Puntaje: ',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                          ),
                          Icon(Icons.star, color: Colors.green),
                          Text(' ${averageStars.toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Reseñas:',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                      ),
                      ...snapshot.data!.map((review) => Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text('${review.stars} estrellas'),
                          subtitle: Text(review.description),
                          trailing: review.user != null
                              ? Text('Usuario: ${review.user!.firstName}')
                              : Text('Usuario: Anónimo',
                            style: TextStyle(fontSize: 14),),
                        ),
                      )),
                    ],
                  );
                } else {
                  return Text('Sin reseñas aún');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key? key, this.value = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
