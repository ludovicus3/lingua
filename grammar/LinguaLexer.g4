lexer grammar LinguaLexer;

options {
  language = Cpp;
}

channels {
  COMMENT
}

// Whitespace and Comments
fragment Ws           : Hws | Vws;
fragment Hws          : [ \t];
fragment Vws          : [\r\n\f];
fragment BlockComment : '/*' .*? '*/';
fragment LineComment  : '//' ~[\r\n]*;

// Escapes
fragment EscSeq     : Esc ([btnfr"'\\] | UnicodeEsc | .);
fragment EscAny     : Esc .;
fragment UnicodeEsc : 'u' (HexDigit (HexDigit (HexDigit HexDigit)?)?)?;

// Numerals
fragment DecimalNumeral : '0' | [1-9] DecDigit;

// Digits
fragment HexDigit : [0-9a-fA-F];
fragment DecDigit : [0-9];

// Literals
fragment BooleanLiteral : 'true' | 'false';
fragment RuneLiteral    : SQuote (EscSeq | ~['\r\n\\]) SQuote;
fragment StringLiteral  : DQuote (EscSeq | ~["\r\n\\])* DQuote;

// Symbols
fragment Esc        : '\\';
fragment Colon      : ':'
fragment DColon     : '::';
fragment SQuote     : '\'';
fragment DQuote     : '"';
fragment LParen     : '(';
fragment RParen     : ')';
fragment LBrace     : '{';
fragment RBrace     : '}';
fragment LBracket   : '[';
fragment RBracket   : ']';
fragment RArrow     : '->';
fragment Lt         : '<';
fragment Gt         : '>';
fragment Equal      : '=';
fragment Question   : '?';
fragment Star       : '*';
fragment Plus       : '+';
fragment PlusAssign : '+=';
fragment Underscore : '_';
fragment Pipe       : '|';
fragment Dollar     : '$';
fragment Comma      : ',';
fragment Semi       : ';';
fragment Dot        : '.';
fragment Range      : '..';
fragment At         : '@';
fragment Pound      : '#';
fragment Tilde      : '~';

BLOCK_COMMENT
  : BlockComment -> channel(COMMENT)
  ;

LINE_COMMENT
  : LineComment -> channel(COMMENT)

// Whitespace
WS
  : Ws+ -> channel(HIDDEN)
  ;
