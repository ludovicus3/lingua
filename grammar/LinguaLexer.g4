lexer grammar LinguaLexer;

MultiLineComment  : '/*' .*? '*/' -> channel(HIDDEN);
SingleLineComment : '//' ~[\r\n]* -> channel(HIDDEN);

OpenBracket        : '[';
CloseBracket       : ']';
OpenParen          : '(';
CloseParen         : ')';
OpenBrace          : '{';
CloseBrace         : '}';
Semicolon          : ';';
Comma              : ',';
Assign             : '=';
QuestionMark       : '?';
Colon              : ':';
Ellipsis           : '...';
Dot                : '.';
Increment          : '++';
Decrement          : '--';
Plus               : '+';
Minus              : '-';
Tilde              : '~';
Bang               : '!';
Multiply           : '*';
Divide             : '/';
Modulus            : '%';
LeftShiftArithmetic : '<<';
RightShiftArithmetic : '>>';
RightShiftLogical    : '>>>';
LessThan             : '<';
GreaterThan          : '>';
LessThanEquals       : '<=';
GreaterThanEquals    : '>=';
Equals               : '==';
NotEquals            : '!=';
BitwiseAnd           : '&';
BitwiseOr            : '|';
BitwiseXOr           : '^';
MultiplyAssign       : '*=';
DivideAssign         : '/=';
ModulusAssign        : '%=';
PlusAssign           : '+=';
MinusAssign          : '-=';
LeftShiftArithmeticAssign  : '<<=';
RightShiftArithmeticAssign : '>>=';
RightShiftLogicalAssign    : '>>>=';
BitwiseAndAssign           : '&=';
BitwiseOrAssign            : '|=';
BitwiseXOrAssign           : '^=';

PointerLiteral: 'null';

BooleanLiteral: 'true' | 'false';

IntegerLiteral
  : DecimalIntegerLiteral
  | OctalIntegerLiteral
  | HexadecimalIntegerLiteral
  | BinaryIntegerLiteral
  ;

FloatingLiteral
  : DecimalFloatingLiteral
  | HexadecimalFloatingLiteral // I'd like to see cases where it's used and is helpful
  ;

RuneLiteral
  : '\'' RuneCharacter '\''
  ;

StringLiteral
  : '"' StringCharacter* '"'
  ;

// Keywords
And       : 'and';
As        : 'as';
Async     : 'async';
Await     : 'await';
Break     : 'break';
Case      : 'case';
Catch     : 'catch';
Const     : 'const';
Continue  : 'continue';
Default   : 'default';
Delete    : 'delete';
Do        : 'do';
Else      : 'else';
Enum      : 'enum';
Export    : 'export';
For       : 'for';
From      : 'from';
Function  : 'function';
If        : 'if';
Import    : 'import';
Interface : 'interface';
Let       : 'let';
Not       : 'not';
Operator  : 'operator';
Or        : 'or';
Package   : 'package';
Private   : 'private';
Protected : 'protected';
Public    : 'public';
Return    : 'return';
Struct    : 'struct';
Switch    : 'switch';
Throw     : 'throw';
Type      : 'type';
Try       : 'try';
While     : 'while';
Yield     : 'yield';

// Primitive Keywords
Any     : 'any';
Boolean : 'boolean';
Byte    : 'byte';
Double  : 'double';
Float   : 'float';
Integer : 'integer';
Rune    : 'rune';
String  : 'string';


// Identifiers

Identifier: IdentifierStart IdentifierPart*;

Whitespaces: [ \t]+ -> channel(HIDDEN);
LineTerminator: [\r\n] -> channel(HIDDEN);

fragment DecimalIntegerLiteral: DigitSequence;
fragment OctalIntegerLiteral: '0' [oO] OctalDigitSequence;
fragment HexadecimalIntegerLiteral: '0' [xX] HexadecimalDigitSequence;
fragment BinaryIntegerLiteral: '0' [bB] BinaryDigitSequence;

fragment DigitSequence: Digit ('_'? Digit)*;
fragment OctalDigitSequence: OctalDigit ('_'? OctalDigit)*;
fragment HexadecimalDigitSequence: HexadecimalDigit ('_'? HexadecimalDigit)*;
fragment BinaryDigitSequence: BinaryDigit ('_'? BinaryDigit)*;

fragment Digit: [0-9];
fragment OctalDigit: [0-7];
fragment HexadecimalDigit: [0-9a-fA-F];
fragment BinaryDigit: '0' | '1';

fragment DecimalFloatingLiteral
  : '.' DigitSequence Exponent?
  | DigitSequence ('.' DigitSequence? Exponent? | Exponent)
  ;

fragment Exponent: [eE] [+-]? DigitSequence;

fragment HexadecimalFloatingLiteral
  : '0' [xX] HexadecimalSignificand HexadecimalExponent
  ;

fragment HexadecimalSignificand
  : HexadecimalDigitSequence ('.' HexadecimalDigitSequence)?
  | '.' HexadecimalDigitSequence
  ;

fragment HexadecimalExponent: [pP] [+-]? DigitSequence;

fragment RuneCharacter: ~['\\\r\n] | EscapeSequence;

fragment EscapeSequence
  : '\\'
  ( [abfnrtv"'\\]
  | OctalDigit OctalDigit OctalDigit
  | 'x' HexadecimalDigit HexadecimalDigit
  | 'u' HexadecimalQuadlet
  | 'U' HexadecimalQuadlet HexadecimalQuadlet
  );

fragment HexadecimalQuadlet: HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit;

fragment StringCharacter: ~["\\\r\n] | EscapeSequence;

fragment IdentifierStart: [a-zA-Z_];
fragment IdentifierPart: IdentifierStart | [0-9];

