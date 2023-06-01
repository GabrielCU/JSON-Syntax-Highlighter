# Reflexión y conclusiones

Para la solución de este proyecto primero se plantearon las expresiones regex para identificar los tokens de un archivo JSON.
Después se utiliza la función Regex.replace() para remplazar el token encontrado y generar el texto HTML. Creo que esta solución
es mejor a la técnica de usar una implementación del DFA, ya que es visualmente menos complejo y es más eficiente.

No existe documentación completa analizando la complejidad de las expresiones regex, pero según el documento "Regular Expression Matching Can Be Simple And Fast"
escrito por Russ Cox, la implementación de regex tiene una complejidad de O(n), pero puede llegar hasta O(n^m) en espacio y tiempo, donde m es el tamaño de la expresión regular.

En sí este programa no considero que tenga implicaciones éticas graves, pero sé que las expresiones regex pueden llegar a ser utilizadas de maneras poco éticas.
He visto en algunos analisis de malware que suelen esconder pedazos de codigo malicioso utilizando regex. Estas expresiones pueden mantenerse ocultas gracias a que no son
muy intuitivas al momento de verse a simple vista, por lo que puede llegar a ser difícil encontrarlas en un base de código grande.
