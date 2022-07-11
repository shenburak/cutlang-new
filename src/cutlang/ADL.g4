grammar ADL;
prog            :   (expr (NEWLINE | EOF))*
                ;

expr            :   (initilization|definition)+
                ;

initilization   :   TRGE EQ INT         # InitilizationExpr
                ;

definition      :   DEF ID EQ ID        # DefinitionExpr
                ;


fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];

fragment MINUS : [-];
fragment DIGIT : '0'..'9';
fragment UPPERCASE : 'A'..'Z';
fragment LOWERCASE : 'a'..'z';

INT             :   DIGIT+;
EQ              :   ('='|E Q);
ID              :   (MINUS | INT)+;
TRGE            :   'TRGe';
DEF             :   'define';

NEWLINE         :   [\r\n]+;

WS              :   [ \t\r\n]+ -> skip;
