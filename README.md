# Pdep Brawls

**La empresa Superchet nos ha contratado para desarrollar la lógica de su nuevo juego Pdep Brawls en el lenguaje Wollok. Cualquier coincidencia con juegos existentes es mera casualidad.... ¡El juego es completamente diferente!**

En este juego se pueden tener varios personajes con los cuales participar de distintas misiones. Cada personaje tiene una cierta cantidad de copas ganadas y al realizar una misión puede pasar que los personajes ganen o pierdan copas.

Estos son los personajes que existen en este juego, pero puede haber más a futuro:
* Arqueros: la destreza de los arqueros se calcula como su agilidad por su rango, y tienen estrategia cuando su rango supera los 100 metros.
* Guerreras: hay guerreras que tienen estrategia y guerreras que no. Además, su destreza es 50% más que su fuerza.
* Ballesteros: los ballesteros son arqueros entrenados cuya destreza es el doble que la de un arquero normal.

En toda misión, hay copas que están en juego y estas se suman o se restan de los personajes que participan en la misión dependiendo de si la misión puede ser superada o no.  

Existen las misiones individuales y las misiones por equipo. En las misiones individuales, las copas que están en juego son el doble de la dificultad de la misión, y puede ser superada cuando el personaje tiene estrategia o bien cuando su destreza supera la dificultad de la misión.

En las misiones por equipo las copas que están en juego son 50 dividido la cantidad de personajes que participan, y pueden ser superadas cuando más de la mitad de los participantes tienen estrategia, o bien, cada uno tiene una destreza mayor a 400.

Se pide codificación para resolver lo siguiente:
1. Saber si una misión puede ser superada.
2. Realizar una misión, repartiendo las copas (sumando o restando) de acuerdo a lo establecido. Tener en cuenta que no debe ser posible realizar misiones individuales cuyo participante tenga menos de 10 copas, ni misiones por equipo con un total de copas entre los participantes menor a 60, en ambos casos debe ocurrir el error “Misión no puede comenzar”.
Por ejemplo, al realizar una misión por equipo con 5 participantes, cada uno recibe 10 copas (si es que puede ser superada) y si no puede ser superada a cada uno se le restan 10 copas. Pero si la misión no puede realizarse, no ocurre ninguna de las dos cosas y en su lugar salta el error “Misión no puede comenzar”.
3. El tiempo pasa y nos piden agregar además de las misiones comunes, las misiones Boost y las misiones Bonus. Cada una de las misiones Boost tiene un multiplicador que multiplica la cantidad de copas en juego, mientras que las misiones Bonus otorgan 1 copa más por cada participante de la misión. Tener en cuenta que puede haber misiones comunes, Boost y Bonus tanto por equipo como individuales. 
4. Escribir los tests necesarios para probar el correcto funcionamiento del código que prueba que una misión individual fue superada. Se espera un test bien nombrado por cada clase de equivalencia.
5. ¿En qué lugar de tu solución aparece el polimorfismo? Justificar marcando objetos polimórficos y quién se aprovecha del polimorfismo.
6. Realizar el diagrama estático de toda la solución. No hace falta poner getters ni setters.
