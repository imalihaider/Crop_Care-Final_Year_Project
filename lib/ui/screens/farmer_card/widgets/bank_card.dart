import 'package:plantdetectionfyp/ui/screens/farmer_card/bank_card_model.dart';
import 'package:plantdetectionfyp/ui/screens/farmer_card/constants.dart';
import 'package:flutter/material.dart';
import 'package:plantdetectionfyp/ui/screens/farmer_card/card_detaill.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
    required this.bankCard,
  }) : super(key: key);

  final BankCardModel bankCard;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      padding: const EdgeInsets.all(Constants.padding * 2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bankCard.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          Constants.radius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ClipOval(
              //   child: Image.asset(
              //     bankCard.icon,
              //     height: Constants.padding * 3,
              //     width: Constants.padding * 3,
              //   ),
              // ),
              // Text(
              //   bankCard.number,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline4!
              //       .copyWith(color: Colors.white),
              // )
              // Text(
              //   bankCard.number,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline4!
              //       .copyWith(color: Colors.white),
              // )
            ],
          ),
          TextButton(
            onPressed: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const CardDetail()));

            },
            child: Text(
              "\$${bankCard.balance.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .headline4!

                  .copyWith(color: Colors.white),
            ),

          )
        ],
      ),
    );
  }
}
