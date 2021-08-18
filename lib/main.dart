import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  // для лайков
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 87654;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
    void _toggleFavorite(){ // используем setstate
      setState(() {
       if(_isFavorited){
         _isFavorited = false;
         _favoriteCount -=1;
       } else {
          _isFavorited = true;
         _favoriteCount +=1;
       }
      });
    }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Япония, Старшая Некома'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
        //listview для скролла
        children: [
          _buildTopImage(),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildRating(), // рейтинг
                  ),
                  Card(
                    // карточка
                    margin: const EdgeInsets.all(5),
                    elevation: 5, // визуальное поднятие карточки
                    child: Container(
                      padding:
                          const EdgeInsets.all(10), // отступы со всех сторон
                      child: _buildAction(), // кнопочки
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDescription(), // описание
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _buildTopImage() => Container(
        child: Card(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          elevation: 5,
          child: Image.asset(
            'assets/images/rick.jpg',
            //fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),
      );

  Widget _buildRating() => ListTile(
        // ListTile список плиткой
        title: Text(
          'Рик',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Япония, Старшая Некома'),
        trailing: Row(
          // иконка идёт в конце
          mainAxisSize: MainAxisSize.min, // чтобы влезли
          children: <Widget>[FavoriteWidget()],
        ),
      );

  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton('Блокирующий', Icons.star, Colors.black),
          _buildButton('Рост 188', Icons.radio_button_checked, Colors.black),
          _buildButton('Возраст 76', Icons.school, Colors.black),
        ],
      );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );

      Widget _buildDescription() => Text('Рик Санчез (англ. Rick Sanchez) — один из двух главных героев американского мультсериала «Рик и Морти», созданного Джастином Ройландом и Дэном Хармоном. Рик — гениальный учёный, алкоголик, реалист, атеист и мизантроп; для него характерны цинизм и пренебрежение общепринятыми нормами поведения. Рик приходится дедушкой Морти Смиту, второму главному герою мультсериала. В мультсериале и медиафраншизе в целом появляются и другие версии Рика из параллельных миров; конкретный герой, приключениям которого посвящёно повествование, обозначается в мультсериале как «Рик из вселенной C-137». В серии комикcов действует другой Рик, относящийся к измерению C-132, а в игре Pocket Mortys — к измерению C-123[1]. Прообразом Рика Санчеза является Эмметт Браун, герой кинотрилогии «Назад в будущее»; образ Рика — как и «Дока» Брауна — обыгрывает бытующий в массовой культуре архетип безумного учёного.',
      softWrap: true,
      );
}
