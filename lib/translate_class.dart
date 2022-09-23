import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'permission': 'Permissions',
          'permissiondesc':
              'Metrobus nerede app needs the following permissions to work properly. Your personal information is never collected and is not transferred out of the phone. The following requested permissions are used only for Metrobus Nerede application functions.',
          'locationperm': 'Location Permission',
          'locationpermdesc':
              'Metrobus Nerede collects location data to enable bus stop tracking, bus stop alarm , next bus stop, speed, alarm count  even when the app is closed or not in use.',
          'backgroundpermission': 'Background location permission',
          'backgroundpermissiondesc':
              'Allows your app to access your location while the app is running in the background. It is used to operate the alarm system when you arrive at the stop you have chosen. The use of the application is terminated from the moment it is closed. Available only when the app is open.',
          'notificationpermission': 'Notification permission',
          'notificationpermissiondesc':
              'The notification permission is used to give you an audible warning by using the background location permission when you arrive at the stop you have chosen.',
          'advertisement': 'Advertisement',
          'advertisementdesc':
              'Our app needs support ads to continue to be developed. There are 2 ads, the application opening ad (only at the first launch) and the banner ad.',
          'permbuttontext': 'Allow Permissions / Go to homepage',
          'waydialogtitle': 'Please select the direction you want to go.',
          'goway': 'This way',
          'gowaychoise':
              'You cannot pass this section without making a selection.',
          'locationalwayspermdesc':
              'The application will not work properly unless your location permission is set to always.',
          'locationalwayspermdesc2':
              'You can perform the permission process according to the instructions below.',
          'opensettings': 'Open Settings',
          'close': 'Close',
          'locationpermdenieddesc':
              'Your app wont be able to alert you in the background unless the location permission is marked as "Always"',
          'notipermdenieddesc':
              'Without notification permissions, the alarm system will not work properly and the application will not be able to warn you at the stop you want to get off at.',
          'changeway': 'Change Way',
          'ontheway': 'on the way',
          'now': 'You have come to',
          'duragindasiniz': 'Bus Stop',
          'nextstation': 'Next Bus stop',
          'distancenextstop': 'Distance',
          'speed': 'Speed',
          'yourchosenstop': 'Select Alarm Stop',
          'selectbusstop': 'Select Bus Stop',
          'alarmoptions': 'Alarm Options',
          'remainingstop': 'Count',
          'wrongway': 'WRONG WAY',
          'cannotload': 'Cannot load',
          'couldnotopen': 'The Application Could Not Open Correctly.',
          'busstops': 'Bus Stops',
          'pleaseselectbusstop': 'Please Select Stop.',
          'secilmedi': 'NOT SELECTED.',
          'linkprivacy':
              'https://metrobusnerede.ahmetbalkan.com.tr/en/privacy-policy/',
          'permprivacytext':
              'By continuing, you are deemed to have accepted the privacy policy. You can',
          'permprivacylinktext': ' click here to read.',
          'permpage': 'Perm Page',
          'permlocres': 'assets/permission-ing.jpg',
          'permnotires': 'assets/noti-ing.png',
          'notificationtitle': 'Metrobüs Nerede ?',
          'notificationdesc':
              'Metrobus Nerede Application now provides access to your location.',
        },
        'tr_TR': {
          'permission': 'İzinler',
          'permissiondesc':
              'Metrobüs Nerede uygulaması düzgün çalışması için aşağıdaki izinlere ihtiyacı vardır. Kişisel bilgileriniz hiç bir zaman toplanmamaktadır ve telefon dışına aktarılmamaktadır. Aşağıdaki istenilen izinler sadece Metrobüs Nerede uygulaması fonksiyonları için kullanılmaktadır.',
          'locationperm': 'Lokasyon İzni',
          'locationpermdesc':
              'Metrobüs Nerede, uygulama kapalıyken veya kullanılmadığında bile durak takibi, otobüs durak alarmı, sonraki durak, hız, alarm sayımı için konum verilerini toplar.',
          'backgroundpermission': 'Arka plan lokasyon izni',
          'backgroundpermissiondesc':
              'Uygulama arka planda çalışıyorken uygulamanızın konumunuza erişmesini sağlar. Seçtiğiniz durağa vardığınızda alarm sisteminin çalışması için kullanılmaktadır. Uygulama kapatıldığı andan itibaren kullanımı sonlanır. Sadece uygulama açıkken kullanılabilirdir.',
          'notificationpermission': 'Bildirim izni',
          'notificationpermissiondesc':
              'Bildirim izni seçtiğiniz durağa vardığınızda arkaplan konum izninden faydalanarak size sesli uyarı yapabilmemiz için kullanılmaktadır. ',
          'advertisement': 'Reklam',
          'advertisementdesc':
              'Uygulamamızı geliştirilmeye devam edebilmesi için destek reklamlarına ihtiyaç duymaktadır. Uygulama açılış reklamı (sadece ilk açılışta) ve banner reklam olmak üzere 2 reklam bulunmaktadır.',
          'permbuttontext': 'İzin ver / Anasayfaya git',
          'waydialogtitle': 'Lütfen gitmek istediğiniz yönü seçiniz.',
          'goway': 'Tarafına Git',
          'gowaychoise': 'Seçim yapmadan bu bölümü geçemessiniz.',
          'locationalwayspermdesc':
              'Konum izniniz her zaman olarak ayarlanmadığı sürece uygulama sağlıklı çalışmayacaktır.',
          'locationalwayspermdesc2':
              'Aşağıdaki yönergelere göre izin işlemini gerçekleştirebilirsiniz.',
          'opensettings': 'Ayarları Aç',
          'close': 'Kapat',
          'notipermdenieddesc':
              'Bildirim izinleri olmadan alarm sistemi düzgün çalışmaz ve uygulama inmek istediğiniz durakta sizi uyaramaz.',
          'locationpermdenieddesc':
              'Lokasyon izni "Her zaman" olarak işaretlenmediği sürece uygulamanız arka planda size uyarı veremez.',
          'changeway': 'Yönü Değiştir',
          'ontheway': 'Durağa İlerliyorsunuz..',
          'now': 'şu an',
          'duragindasiniz': 'Durağındasınız.',
          'nextstation': 'Sonraki Durak',
          'distancenextstop': 'Kalan Mesafe',
          'speed': 'Hız',
          'yourchosenstop': 'Seçtiğiniz Durak',
          'selectbusstop': 'Durak Seç',
          'alarmoptions': 'Alarm Seçenekleri',
          'remainingstop': 'Kalan Durak',
          'wrongway': 'TERS YÖN',
          'cannotload': 'Yüklenemiyor',
          'couldnotopen': 'Uygulama Düzgün Açılamadı.',
          'busstops': 'Duraklar',
          'pleaseselectbusstop': 'Lütfen Durak Seçiniz.',
          'secilmedi': 'SECILMEDI.',
          'linkprivacy':
              'https://metrobusnerede.ahmetbalkan.com.tr/gizlilik-politikasi/',
          'permprivacytext':
              'Devam etmeniz durumun gizlilik politikası kabul etmiş sayılırsınız. okumak için ',
          'permprivacylinktext': 'buraya tıklayabilirsiniz.',
          'permpage': 'İzin Sayfası',
          'permlocres': 'assets/permission-tr.jpg',
          'permnotires': 'assets/noti-tr.png',
          'notificationtitle': 'Metrobüs Nerede ?',
          'notificationdesc':
              'Metrobüs Nerede Uygulaması şuan konumunuza erişim sağlıyor.',
        }
      };
}
