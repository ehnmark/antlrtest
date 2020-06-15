// Heavily based on https://raw.githubusercontent.com/antlr/grammars-v4/master/json/JSON.g4

grammar SbeText;

message
   : messageType body
   ;

messageType
   : '[' PRIMITIVE ']'
   ;

body
   : '(' pair ('|' pair)* ')'
   ;

pair
   : key '=' value
   ;

key
   : PRIMITIVE
   ;

value
   : composite
   | PRIMITIVE
   ;

composite
   : compositeType body
   ;

compositeType
   : PRIMITIVE
   ;

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;
fragment DIGIT : [0-9] ;

PRIMITIVE : (LOWERCASE | UPPERCASE | DIGIT)+ ;

WS
   : [ \t\n\r] + -> skip
   ;
