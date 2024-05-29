import 'package:flutter/material.dart';

class Button extends StatelessWidget {                        
  final Widget forIcons;                                          
  final VoidCallback onPressed;                                   
  final Color color;                                             

   Button({ 
    required this.forIcons,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(                                      
      onTap: onPressed,                                          
      child: Container(                                           
        margin: const EdgeInsets.only(                           
          top: 10,                                                
          left: 15,                                       
          right: 5,                                               
        ),
        decoration: BoxDecoration(                                
          color: color,                                          
          borderRadius: BorderRadius.circular(15),               
        ),                                           
        child: forIcons,
      ),
    );
  }
}