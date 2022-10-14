# Circuito decodificado de código Gray utilizando tarjeta Basys 3
Hecho por:
- Jose Antonio Espinoza Chaves
- Naheem Johnson Solís
- Rolando Vega Marino
- David Obando Pereira

## Funcionamiento del circuito completo y de cada subsistema.

### Registro.sv:
Lleva el registro de los valores de entrada, cada cambio ocurrido en la entrada del sistema se actualiza agregándose al registro.

### Decoder.sv:
Este módulo convierte el código Gray a Binario, tomando en cuenta cuatro entradas de bits y cuatro salidas, se implementó como un switch case. 

### BCD_a_Catodo.sv:
Módulo que controla los cátodos de uno de los LEDs de 7 segmentos, se establecen los valores para mostrar dígitos del 0 al 15. 

### display1.sv:
Módulo, que de igual manera que "BCD_a_Catodo", controla el otro LED de 7 segmentos a partir de entradas binarias en sus cátodos. Solo se habilitan dos LED de siete segmentos pues los valores decimales llegan hasta 15, por lo que el LED de centenas y miles no se necesitan. 

### And1.sv:
Este módulo establece la tasa de refresco para cada segmento del LED aplicado a cada segmento, de manera que se pueda mostrar correctamente el número decimal. Se instancia un contador, el cual generará una variable "Cout", la cual conforme su valor, cuando esté dentro de ciertos rangos se asigna a dos Flipflops, los cuales se encargan de controlar la tasa de refresco. 

### RefreshCounter.sv:
Es el módulo contador para la tasa de refresco, suma 1 iterativamente hasta llegar a 480000 o hasta que reset sea activado. En estos caso base se resetea el valor de "Cout", por lo que funciona sumando recursivamente hasta llegar a 480000 y luego se reinicia el valor y vuelve a sumar. De esta manera se establece el tiempo de refresco. 

### FFT.sv:
Son los Flipflops encargados del control de la tasa de refresco. Reciben como parametro el valor Cout obtenido del contador y dependiendo de su valor, devuelven el resutado Q o -Q. Sirven para control de la señal de refresco dependiendo del rango del contador. 

### MUX2a1.sv:
Módulo que aplica un multiplexor de grado 2 a 1. Este recibe como entrada a "sel" (seleccionador), si este es 0, asigna el valor de A a la salida, y si es 1, asigna el valor de B a la salida. Esta salida controla el orden de los LEDs y evita que se enciendan en desorden. 

### Refreshcounter 500ms.sv:
De igual manera que el contador, este subsegmento, lleva una suma recursiva hasta llegar al valor máximo, donde alterna el valor de su salida dependiendo del valor del contador. Si reset es presionado su salida es 0, si el contador no ha llegado al valor máximo, este sigue sumando y mantiene el valor de salida en 0. Cuando llega la valor máximo cambia su valor de salida a 1. 

### Top.sv:
Segmento que incorpora e instancia todos los subsegmentos del circuito, en este se declaran los cables o alambres necesarios para controlar las entradas y salidas del sistema, y se instancian las partes de este, de manera que el resultado o salida de una es la entrada o insumo del otro, de manera que se ejecuten todos a la vez y cumplan la funcionalidad del circuito. Este es el archivo que se convierte a bitstream para ser ejecutado en la FPGA Basys3. 

### Constraints.xdc:
Archivo donde se declaran todas las entradas analógicas y digitales que se utilizarán en la tarjeta Basys3, de igual manera, se declaran los nombres que se utilizaron en los segmentos como labels y se les asigna una entrada de la tarjeta. Estos valores cambian por el tipo de tarjeta. 

## Funcionamiento del Circuito

El circuito comienza en las entradas analógicas (switches) de la Basys3. En esta se utilizaron los puertos W2, U1, T1 y R2, los cuales están en la posición más a la izquierda de la sección de switches. En estos se establecen los valores de Gray, donde el switch para arriba representa un 1 y el switch para abajo representa un 0. Estos valores son guardados en el registro inicial, el cual es actualizado por el reloj de 500ms. Una vez el sistema recibió la entrada de manera analógica (Código Gray), este pasa por el decodificador para convertirlo en código binario. Una vez generado en binario, este es desplegado en las leds pequeñas de la Basys 3. Donde se utilizaron los LEDs P3, N3, P1 y L1, de manera que también fueran los más a la izquierda. Finalmente el valor binario es convertido a decimal, y representado en dos LEDs de 7 segmentos, controlados por cada dígito del valor y con los segmentos de control de cátodos. Además, este siendo controlado por el contador y los flipflops de tasa de refresco para mostrar el númerto decimal correctamente. 

# Diagrama de bloques de cada subsistema

## Primer subsistema (Decodificador Gray a Binario):

![](https://cdn.discordapp.com/attachments/1022689209041031262/1030030363843625020/unknown.png)

Este subsistema tiene como entradas a los switches analógicos, los cuales si estan hacia arriba es un 1 y si están hacia abajo es un 0. De esta manera los valores entrados son guardados en un registro para establecer el valor por los siguientes 500ms hasta que el siguiente ciclo de reloj ocurra, por lo que este registro guarda el valor entrado cada 500ms. Luego los valores de salida del registro entran al decodificador, el cual a partir de un "case" obtiene su equivalente en código binario, siendo esta la salida del primer subsistema. 

## Segundo subsistema (Binario a LEDs y decimal a 7 segmentos):

![](https://cdn.discordapp.com/attachments/1022689209041031262/1030038173608321044/unknown.png)

Este subsistema tiene como entrada al número binario previamente mostrado en las luces LEDs, para esto el mismo numero binario pasa por dos decodificadores, uno tomará su valor de unidades y el otro el valor de decenas. Para esto, se utilizan los flipflops, donde, en caso de que solo tenga unidades el flipflop que controla las decenas enviará un 0 al ánodo provocando que no encienda el LED de 7 segmentos, caso contrario si lo encendería. Luego, para los cátodos, al pasar por el decodificador de 7 segmentos para cada display, este pasa por un MUX de control, el cual recibe la variable "sel" de los flipflops, con la cual en caso de ser 0, no prende los cátodos, en caso de ser 1 enciende los cátodos necesarios para mostrar el número que se desea. Todo este proceso es controlado por un contador que actúa como reloj. 

# Simulación (Ejecución)

Para ejecutar el funcionamiento del código, se creó el módulo Top.sv, el cual contiene todas las asignaciones e instanciaciones de los otros módulos necesarias para el funcionamiento total. Este valor se selecciona en Vivado y se le da a "Run Implementation", una vez ejecutado, se crea el bitstream necesario y se procede a programar la tarjeta Basys 3, mediante conexión USB. 

Una vez cargado el código en la Basys 3, se procede a ingresar el código Gray de 4 bits utilizando los switches analógicos de la tarjeta. Donde si el switch está hacia arriba representa un 1 y si está hacia abajo representa un 0. Dependiendo de el valor introducido en Gray, este se decodifica y se convierte a binario. Una vez decodificado este se muestra en los leds de la Basys3, donde el led encendido representa un 1 o "alto" y un led apagado representa un 0 o "bajo". Por ultimo ese valor binario se traduce a BCD el cual luego se decodifica a los cátodos de 7 segmentos. Una vez decodificado se convierte a decimal a partir del BCD y se muestra en las LEDs de 7 segmentos. 

Para demostrar el funcionamiento se presenta el siguiente caso, donde se insertó en código Gray el valor "1010" el cual corresponde a 12 en código Gray. Se puede ver como las luces que se encienden son solo las primeras dos, de manera que representa un "1101", el cual sería el valor en binario. Por último, en el display de 7 segmentos se muestra el valor "12" el cual es correcto con respecto a la entrada. 

![](https://media.discordapp.net/attachments/329398607021342721/1030341974894587954/IMG_20221013_090625.jpg?width=901&height=676)


# Consumo de recursos en la FPGA

Sobre la implementación del proyecto de Vivado se obtuvo el reporte de recursos utilizados. Como se puede observar, se utilizaron 50 look up tables distribuidas a lo largo de los subsistemas del circuito. Además, se utilizaron 51 registros y 25 pares de flipflops. 

![](https://media.discordapp.net/attachments/1022689209041031262/1030229485292892161/utilizacion.png)

# Consumo de potencia

Posteriormente, se ejecutó un reporte de potencia, Vivado utiliza la implementación del código y el modelo en este caso una Basys3 y calcula la potencia necesitada y usada para ejecutar la secuencia. Para este proyecto, se obtuvo que el consumo es de 73mW totales, con los siguientes márgenes de temperatura: 

![](https://media.discordapp.net/attachments/1022689209041031262/1030229484424659084/potencia.png)

# Velocidades máximas de reloj

Para el reporte de timings, se obtuvo que el Worst Negative Slack el cual dió 6.042ns, por lo tanto, la frecuencia máxima del sistema es 1/(10-6.042)ns, lo cual es 252.65MHz.

![](https://media.discordapp.net/attachments/1022689209041031262/1030229484898615440/timings.png)


# Problemas hallados durante el trabajo y de las soluciones aplicadas.

El mayor problema ocurrió a la hora de establecer los valores de temporizado de los contadores que se utilizarían como entradas de los flipflops, ya que erróneamente se implementó con un enfoque secuencial, lo cual es incorrecto, ya que se pensaba que se podía dar un valor a una variable e inmediatamente otra para cambiar su estado, lo cual no era posible, ya que al ejecutarse todo al mismo tiempo se estaban dando dos valores diferentes a una misma variable, por lo que daba un error de múltiple driver. Para solucionarlo, se manejó solo un valor inicial, y el cambio de estado se controló mediante un switch case. Ya con esto, el código se ejecutó sin problemas. 
