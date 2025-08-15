grammar Expr;

start
    : prog+ EOF
    ;

prog
    : stm
    | new_type
    | function
    ;

stm
    : expr EOL
    | att  EOL
    | RETURN expr? EOL
    ;

function
    : type ID '(' args? ')' '{' func_body '}'
    ;

func_body
    : stm*
    ;

att
    : type ID '=' expr
    ;

new_type
    : 'type' ID 'as' type EOL
    ;

args
    : type ID (',' type ID)*
    ;

expr
    : expr ('*'|'/') expr      # MulDiv
    | expr ('+'|'-') expr      # AddSub
    | '(' expr ')'             # Parens
    | ID                       # Var
    | INT                      # IntLiteral
    | DOUBLE                   # DoubleLiteral
    ;

type
    : 'int'
    | 'double'
    | 'float'
    | 'bool'
    | 'string'
    | ID
    ;

/* -------- TOKENS -------- */
RETURN        : 'return';
IF            : 'if';
ELSE          : 'else';
GR            : '>';
GRT           : '>=';
LE            : '<';
LET           : '<=';
TRUE          : 'true';
FALSE         : 'false';
ID            : [a-zA-Z_][a-zA-Z0-9_]*;
INT           : [0-9]+;
DOUBLE        : [0-9]+'.'[0-9]* | [0-9]*'.'[0-9]+;
EOL           : ';';
WS            : [ \t\r\n]+ -> skip;
LINE_COMMENT  : '//' ~[\r\n]* -> skip;
BLOCK_COMMENT : '/*' .*? '*/' -> skip;
