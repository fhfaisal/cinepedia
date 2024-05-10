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
    return Column(
      children: [
        Divider(color: Theme.of(context).colorScheme.primary,height: 1,thickness: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Text(separationText??'',style: Theme.of(context).textTheme.labelSmall,))),
            isAction?
            Flexible(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    )
                ),
                child: GestureDetector(
                    onTap: onPressed,child:Text(actionText!.toUpperCase()??'',style: Theme.of(context).textTheme.bodyLarge,))))
            :const SizedBox()
          ],
        ),
        Divider(color: Theme.of(context).colorScheme.primary,height: 1,thickness: 1,),
      ],
    );
  }
}