# Resaltador de sintaxis para archivos JSON.

## Instrucciones

Para correr el programa se debe modificar la función SyntaxHighlighter.highlight_json_file(). El primer argumento de la función es el path 
del archivo JSON que se quiere leer, y el segundo argumento es el path con el nombre de archivo de salida que se requiere.

Un ejemplo de la llamada a la función sería 

```Elixir
SyntaxHighlighter.highlight_json_file("Tests/1.json", "output.html")
```
