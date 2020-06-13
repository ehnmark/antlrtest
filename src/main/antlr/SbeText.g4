// Heavily based on https://raw.githubusercontent.com/antlr/grammars-v4/master/json/JSON.g4

grammar SbeText;

message
   : pair ('|' pair)*
   ;

pair
   : KEY '=' value
   ;

arr
   : '[' value (',' value)* ']'
   | '[' ']'
   ;

value
   : STRING
   | NUMBER
   | arr
   | 'true'
   | 'false'
   | 'null'
   | KEY '(' message ')'
   ;


fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;
fragment DIGIT : [0-9] ;

KEY : (LOWERCASE | UPPERCASE) (LOWERCASE | UPPERCASE | DIGIT)+ ;


STRING
   : '\'' (ESC | SAFECODEPOINT)* '\''
   ;


fragment ESC
   : '\\' (["\\/bfnrt] | UNICODE)
   ;


fragment UNICODE
   : 'u' HEX HEX HEX HEX
   ;


fragment HEX
   : [0-9a-fA-F]
   ;


fragment SAFECODEPOINT
   : ~ ["\\\u0000-\u001F]
   ;


NUMBER
   : '-'? INT ('.' [0-9] +)? EXP?
   ;


fragment INT
   : '0' | [1-9] [0-9]*
   ;

// no leading zeros

fragment EXP
   : [Ee] [+\-]? INT
   ;

// \- since - means "range" inside [...]

WS
   : [ \t\n\r] + -> skip
   ;
