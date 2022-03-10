# dynamique

- comprendre qu'un problème, ce sont des sous problème
- création d'un tableau qui calcule les solutions de 0 à n
- création de tableauX (solution partielle) qui permet de découvrir la solution
- garder un état lors du parcours du tableau

## sac à dos

prix: [int]
poids: [int]
sol: [int] -> solution de 0 à n

sol[i] = Max(prix[0] + sol[i] - poids[0],prix[0] + sol[i] - poids[0] ...)
