domains
	s=string.
	list=s*.
predicates
	start.
	pars(s).
	type(s,s).
	mem(s,list).
	

clauses
	start:-write("Enter Sentense : "),nl,
	       readln(S),pars(S).
	
	pars(""):-!.
	pars(S):-fronttoken(S,W,S1),type(W,W1),write(W," : ",W1),nl,pars(S1).
	
	type(S,"Keyword"):-mem(S,["int"]),!.
	type(S,"Digit"):-S>="0",S<="9",!.
	type(S,"Id"):-isname(S),!.
	type(S,"Delimeter"):-mem(S,[";",",","(",")"]),!.
	type(S,"Operator"):-mem(S,["+","-","=","*","/"]),!.
	type(_,"Unknown").
	
	mem(H,[H|_]):-!.
	mem(S,[_|T]):-mem(S,T).
	

goal
	start.