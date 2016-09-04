/* You do not need to change anything up here. */
package lexer;

import frontend.Token;
import static frontend.Token.Type.*;

	
%%

%public
%final
%class Lexer
%function nextToken
%type Token
%unicode
%line
%column

%{
	/* These two methods are for the convenience of rules to create toke objects.
	* If you do not want to use them, delete them
	* otherwise add the code in 
	*/
	
	private Token token(Token.Type type) {
	
	}
	
	/* Use this method for rules where you need to process yytext() to get the lexeme of the token.
	 *
	 * Useful for string literals; e.g., the quotes around the literal are part of yytext(),
	 *       but they should not be part of the lexeme. 
	*/
	private Token token(Token.Type type, String text) {
		
	}
%}

/* This definition may come in handy. If you wish, you can add more definitions here. */
WhiteSpace = [ ] | \t | \f | \n | \r
	INTEGERS [0-9][0-9]*	
	IDENTIFIER [a-z|A-Z|_][a-z|A-Z|0-9|_]*
	PUNCTUATION [,|(|)|{|}|[|]|;]
	OPERATOR [/|==|=|>=|<=|>|<|-|!=|+|*]
	STRING '"'(Not["|\n])*'"'	


%%
/* put in your rules here.    */
boolean|break|else|false|if|import|int|module|public|return|true|type|void|while        {
            printf( "A keyword: %s\n", yytext );
            }

{IDENTIFIER} printf("An identifier: %s/n", yytext);
{PUNCTUATION} printf("An punctuation: %s/n", yytext);
{OPERATOR} printf("An operator: %s/n", yytext);
{INTEGER} printf("An integer: %s/n", yytext);
{STRING} printf("A string: %s/n", yytext);

            
            

/* You don't need to change anything below this line. */
.							{ throw new Error("unexpected character '" + yytext() + "'"); }
<<EOF>>						{ return token(EOF); }
