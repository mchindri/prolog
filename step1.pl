femme(anne).
femme(betty).
femme(lisa).
femme(sylvie).
femme(eve).
femme(julie).
femme(valerie).

homme(marc).
homme(luc).
homme(jean).
homme(jules).
homme(leon).
homme(loic).
homme(gerard).
homme(jacques).
homme(herve).
homme(paul).

mari_de(marc, anne).
mari_de(luc, betty).
mari_de(jules, lisa).
mari_de(leon, sylvie).
mari_de(loic, eve).
mari_de(paul, julie).

femme_de(X, Y):-mari_de(Y, X).

enfant_de(jean, marc).
enfant_de(jules, marc).
enfant_de(leon, marc).
enfant_de(lisa, luc).
enfant_de(loic, luc).
enfant_de(gerard, luc).
enfant_de(jacques, jules).
enfant_de(herve, leon).
enfant_de(julie, leon).
enfant_de(paul, loic).
enfant_de(valerie, loic).

enfant_de(X, Y):-femme_de(Y, Z), enfant_de(X, Z).

beaupere(X, Y):-enfant_de(Z, X), (mari_de(Y, Z); femme_de(Y, Z)), homme(X).
beaumere(X, Y):-enfant_de(Z, X), (mari_de(Y, Z); femme_de(Y, Z)), femme(X).

ancetre_de(X, Y):-enfant_de(Y, X).
ancetre_de(X, Y):-enfant_de(Y, Z), enfant_de(Z, X).
