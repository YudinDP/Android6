# laba6_1


Флаттер приложение для загрузки фото с NASA API
По заданию:
     марсоход - opportunity
     sol - 130

Нынешняя версия программы задачу не выполняет, фото с указанного марсохода в указанный sol загрузить не получается, причина предположительно в формате ссылки на фото, так как фото ссылки на которые начинаются с "hdurl":"https" загрузить выходит, но фото с "img_src":"http" в начале - нет. Так же проблема может быть связана с графическим процессором хоста или эмулятора

Сейчас программа загружает фото с NASA APOD(Astronomy Picture of the Day), так как там фото содержат в начале "https"
"img_src":"http://mars.nasa.gov/mer/gallery/all/1/p/130/1P139728610ESF3097P2600R8M1-BR.JPG"  не работает
"hdurl":"https://apod.nasa.gov/apod/image/2504/GHR5997Luna1giornofirmapicc.jpg"  работает
В программу уже добавлена обработка "http" и замена на "https" в файле api.dart, но проблема остаётся

Другие попытки решить проблему, которые были применены:
1.Добавление всех необходимых зависимостей в pubsec.yaml
2.Добавление параметра android:usesCleartextTraffic="true"> в AndroidManifest.xml
3.Установка запрашиваемой компилятором ndkVersion = "27.0.12077973" в build.gradle.kts
4.Обновление и установка всех потенциально необходимых SDK, установка Google API вместо Google Play Store для эмулатора, изменение для эмулятора Graphic acceleratin с Auto на Software

Наиболее частые ошибки, замеченные в консоли:
E/libEGL  ( 5469): called unimplemented OpenGL ES API
E/FlutterJNI( 3453): Failed to decode image
E/FlutterJNI( 3453): android.graphics.ImageDecoder$DecodeException: Failed to create image decoder with message 'unimplemented'Input contained an error.

url для проверки:
https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10
https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=130&api_key=t5EY8daoEzYwoPNLd6xkFf6nAtz5fxzjENDeON3Y