import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Savings',
      'Investments',
      'Budget',
      'Credit Cards',
      'Financial Goals',
      'Resources'
    ];
    List<String> imagesLink = [
      'https://g.foolcdn.com/editorial/images/541946/jar-full-of-hundred-dollar-bills-money-savings.jpg',
      'https://www.livemint.com/lm-img/img/2023/08/08/1600x900/-iStockphoto-_1691514418144.jpg',
      'https://takecaregarden.com/wp-content/uploads/2024/08/67162601.jpg',
      'https://ringgitplus.com/en/blog/wp-content/uploads/2020/03/credit-cards.jpg',
      'https://blog.jeton.com/wp-content/uploads/2020/10/financial_goals.png',
      'https://insidesources.com/wp-content/uploads/2014/06/bigstock-A-pile-of-books-with-library-o-54563726.jpg',
    ];
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: ResponsiveValue<int>(
              //     defaultValue: 2,
              //     context,
              //     conditionalValues: [
              //       const Condition.equals(name: TABLET, value: 3),
              //       const Condition.largerThan(
              //           name: TABLET, value: 4, breakpoint: 800),
              //     ]).value,
              crossAxisCount: 2,
              childAspectRatio: 0.7),
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SecondPage(
              //       pageName: titles[index],
              //       // textToSpeechEnabled: widget.textToSpeechEnabled,
              //     ),
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  border: Theme.of(context).brightness == Brightness.dark
                      ? Border.all(color: Colors.white)
                      : Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    ClipRect(
                      child: Image(
                        //make it responsive
                        image: NetworkImage(imagesLink[index]),
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(5),
                    //   child: AutoSizeText(
                    //     softWrap: true,
                    //     titles[index],
                    //     style: GoogleFonts.poppins(
                    //         fontWeight: FontWeight.bold, fontSize: 15),
                    //   ),
                    // ),
                    // const AutoSizeText('sdasa')
                  ],
                ),
              ),
            );
          },
          itemCount: titles.length,
        ),
      ),
    ));
  }
}
