import 'package:cinepedia/app/utils/design_elements.dart';
import 'package:flutter/material.dart';
class SectionSeparation extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? separationText;
  final String? actionText;
  final bool isAction;
  const SectionSeparation({
    super.key,
    required this.separationText,
    this.actionText,
    this.onPressed,
    this.isAction=true
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Column(
        children: [
          //Divider(color: Theme.of(context).colorScheme.primary,height: 1,thickness: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(separationText??'',style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
              isAction?
              GestureDetector(
                  onTap: onPressed,child:Text(actionText!??'',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.primary)))
              :const SizedBox()
            ],
          ),
         // Divider(color: Theme.of(context).colorScheme.primary,height: 1,thickness: 1,),
        ],
      ),
    );
  }
}