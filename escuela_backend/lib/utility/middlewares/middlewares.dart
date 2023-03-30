import 'package:escuela_backend/utility/middlewares/cors.dart';
import 'package:shelf/shelf.dart';

class Middlewares {
  Middleware corsMiddleware = generateCorsMiddleware(
    bypassCors:
        true, //como no se q mas hacer, aceptemos todo a ver si anda al menos
    allowedOrigins: [
      '*',
      'http://admin.alcanza.com.do',
      'http://qa.admin.alcanza.com.do',
      'https://d2oi6hkrjjxvdz.cloudfront.net', //backend AWS
      'http://d2oi6hkrjjxvdz.cloudfront.net', //backend AWS
      'http://d1xcla9476h813.cloudfront.net', //webadmin AWS
      'https://d1xcla9476h813.cloudfront.net', //webadmin AWS
      'http://localhost:3000',
      'http://20.51.244.93',
      'http://backend-qa-lb-285042686.us-east-2.elb.amazonaws.com:8080/',
      'http://web-qa-lb-837252200.us-east-2.elb.amazonaws.com'
    ],
  );
}
