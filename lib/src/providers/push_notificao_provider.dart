import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';


class PushNotificacaoProvider {
  //fSpToXM0XLk:APA91bEFzGyl_fFuk7NgCLJ-T6YSetWRyuhpS43VkWYNb_27fKH2UWICaw2QmEOR2wnzEWXwDY47yJ4jPmNGVp6GwoVlZpSkTNyTjsILZ15aZjRilZav0P1sSLJY5TUa6PuPgmWTv7ga
   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
   final _messagemStreamController = BehaviorSubject<String>();

  Stream<String> get menssagens => _messagemStreamController.stream;


   initNotificacoes(){
     _firebaseMessaging.requestNotificationPermissions();

     _firebaseMessaging.getToken().then((token){
       print("==== TOKEN ====");
       print(token);
     });

     _firebaseMessaging.configure(

       onMessage: (info)async{
         print("======= On Messege ==========");
         print(info);
        String argumento = "no-data";

        if(Platform.isAndroid){
          argumento = info['data']['menssagem']??'no-data';
        }
         _messagemStreamController.sink.add(argumento);

       },

       onLaunch: (info)async{
         print("======= On Launch ==========");
         print(info);
         
       },

       onResume: (info)async{
         print("======= On Resume ==========");
         print(info);

         final notificacao = info['data']['menssagem'];
        _messagemStreamController.sink.add(notificacao);
       }

     );
   }

   dispose(){
     _messagemStreamController.close();
   }
}