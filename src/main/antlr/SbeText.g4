// Heavily based on https://raw.githubusercontent.com/antlr/grammars-v4/master/json/JSON.g4

grammar SbeText;

message
   : key body
   ;

key
   : '[' PRIMITIVE ']'
   ;

body
   : '(' pair ('|' pair)* ')'
   ;

pair
   : PRIMITIVE '=' value
   ;

value
   : PRIMITIVE body
   | PRIMITIVE
   ;


fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;
fragment DIGIT : [0-9] ;

PRIMITIVE : (LOWERCASE | UPPERCASE | DIGIT)+ ;

WS
   : [ \t\n\r] + -> skip
   ;
