/* Options for each category. */
meals([normal, healthy, value, vegan, veggie, meaty]).

vegan_breads([multigrain, italian_wheat, hearty_italian, parmesan_oregano, flatbread]).
non_vegan_breads([honey_oat]).

value_mains([chicken, ham, tuna, bacon]).
expensive_mains([beef, turkey, salmon]).

veggies([lettuce, cucumber, tomato, capsicum, red_onion, pickle, olive, jalapeno]).

vegan_topups([avocado]).
non_vegan_topups([cheddar, egg_mayonnaise, monterey_jack]).

healthy_sauces([mustard, honey_mustard, chilli, ketchup, sweet_onion]).
unhealthy_sauces([bbq, chipotle_southwest, ranch, mayonnaise]).

healthy_sides([energy_bar]).
unhealthy_sides([chips, hashbrowns, cookies]).

healthy_drinks([mineral_water, orange_juice, green_tea, coffee]).
unhealthy_drinks([fountain_drinks]).



/* Define the condition check. */
healthy_meal(healthy).
value_meal(value).
vegan_meal(vegan).
veggie_meal(veggie).
meaty_meal(meaty).



/* Define the append method. */
append([], X, X).
append([X|Y], Z, [X|W]):-
    append(Y, Z, W).

/* Instantiate an empty list. */
empty_list([]).



/* All options for a particular category. */
all_options(A, X):-
    A == meals -> meals(X);
    A == breads -> breads(X);
    A == mains -> mains(X);
    A == veggies -> veggies(X);
    A == sauces -> sauces(X);
    A == topups -> topups(X);
    A == sides -> sides(X);
    A == drinks -> drinks(X).

/* Available options for every category based on user inputs. */
available_options(A, X):-
    A == meals -> ask_meals(X);
    A == breads -> ask_breads(X);
    A == mains -> ask_mains(X);
    A == veggies -> ask_veggies(X);
    A == sauces -> ask_sauces(X);
    A == topups -> ask_topups(X);
    A == sides -> ask_sides(X);
    A == drinks -> ask_drinks(X).

/* Selected options for every category. */
selected_options(A, X):-
    A == meals -> findall(X, selected_meals(X), X);
    A == breads -> findall(X, selected_breads(X), X);
    A == mains -> findall(X, selected_mains(X), X);
    A == veggies -> findall(X, selected_veggies(X), X);
    A == sauces -> findall(X, selected_sauces(X), X);
    A == topups -> findall(X, selected_topups(X), X);
    A == sides -> findall(X, selected_sides(X), X);
    A == drinks -> findall(X, selected_drinks(X), X).



/* Return the list of all breads for customers to choose. */
breads(X):-
    vegan_breads(B1), non_vegan_breads(B2), append(B1, B2, X).

/* Return the list of all mains for customers to choose. */
mains(X):-
    value_mains(M1), expensive_mains(M2), append(M1, M2, X).

/* Return the list of all topups for customers to choose. */
topups(X):-
    non_vegan_topups(T1), vegan_topups(T2), append(T1, T2, X).

/* Return the list of all sauces for customers to choose. */
sauces(X):-
    healthy_sauces(S1), unhealthy_sauces(S2), append(S1, S2, X).

/* Return the list of all sides for customers to choose. */
sides(X):-
    healthy_sides(S1), unhealthy_sides(S2), append(S1, S2, X).

/* Return the list of all drinks for customers to choose. */
drinks(X):-
    healthy_drinks(D1), unhealthy_drinks(D2), append(D1, D2, X).



/* Return the list of available meals. */
ask_meals(X):-
    meals(X).

/*  Return the list of available breads based on the meal choice.
    If vegan meal is selected, return the list of vegan_breads. */
ask_breads(X):-
    selected_meals(Y), vegan_meal(Y) -> vegan_breads(X);   
    breads(X).

/*  Return the list of available mains based on the meal choice.
    If vegan meal or veggie meal is selected, return empty list [] since they don't have mains. 
    If value meal is selected, return value_mains. */
ask_mains(X):-
    selected_meals(Y), vegan_meal(Y) -> empty_list(X);
    selected_meals(Y), veggie_meal(Y) -> empty_list(X);
    selected_meals(Y), value_meal(Y) -> value_mains(X); 
    mains(X).

/*  Return the list of available veggies based on the meal choice.
    If meaty meal is selected, return empty list [] as it has no veggie options. */
ask_veggies(X):-
    selected_meals(Y), \+ meaty_meal(Y), veggies(X).

/*  Return the list of available top-ups based on the meal choice.
    If value meal is selected, return an empty list as it has no topups.
    If vegan meal is selected, return a list containing vegan_topups. */
ask_topups(X):-
    selected_meals(Y), value_meal(Y) -> empty_list(X);
    selected_meals(Y), vegan_meal(Y) -> vegan_topups(X); 
    topups(X).

/*  Return the list of available sauces based on the meal choice.
    If healthy meal is selected, return a list containing only healthy_sauces. */
ask_sauces(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_sauces(X);   
    sauces(X).

/*  Return the list of available sides based on the meal choice. 
    If healthy meal is selected, return a list containing only healthy_sides. */
ask_sides(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_sides(X);   
    sides(X).

/*  Return the list of available drinks based on the meal choice. 
    If healthy meal is selected, return a list containing only healthy_drinks. */
ask_drinks(X):-
    selected_meals(Y), healthy_meal(Y) -> healthy_drinks(X);   
    drinks(X).