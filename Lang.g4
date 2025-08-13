grammar Lang;

start		: prog+ EOF
			;

prog		: stm
			| new_type
			| function
			;

stm			: expr EOL
			| att  EOL
			;

function	: TYPE ID '(' args ')' '{' func_body '}'
			;

func_body	: stm+ (return expr? EOL)?
			| 
			;

att			: TYPE ID '=' expr
			;

new_type	: 'type' TYPE 'as' TYPE EOL
			;

expr		: var '+' term
			| var '-' term
			| term
			;

term		: var '*' expr
			| var '/' expr
			| var
			;

var			: ID
			| INT
			| DOUBLE
			| '(' expr ')'
			;

IF				: if												;
ELSE			: else												;
GE				: >													;
GEQ				: >=												;
LEQ				: <													;
LE				: <													;
TYPE			: int|uint|double|float|bool|[a-zA-Z][a-Za-Z0-9_]?	;
ID				: [a-zA-Z][a-Za-Z0-9_]?								;
TRUE			: true												;
FALSE			: false												;
INT				: -?[0-9]+											;
DOUBLE			: -?(([0-9]+\.[0-9]*)|([0-9]*\.[0-9]+))				;
WS				: [\t\r\n ]+ -> skip								;
EOL				: ';'												;
LINE_COMMENT	: \/\/.* -> skip									;
BLOCK_COMMENT	: \/\*[\s\S]*\*\/									;