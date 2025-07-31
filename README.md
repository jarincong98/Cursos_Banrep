# Material del Curso de Modelación DSGE

Este repositorio contiene el material desarrollado para los cursos de modelación DSGE dictados por:

- **Óscar I. Ávila-Montealegre**  
- **Fredy A. Castañeda-Valdés**  
- **Juan A. Rincón-Galvis**

## Descripción

El propósito de este repositorio es centralizar y versionar los contenidos utilizados y desarrollados en los cursos sobre modelos dinámicos estocásticos de equilibrio general (DSGE). Aquí se incluyen:

- Presentaciones y notas de clase  
- Códigos en Dynare, MATLAB y/o R  
- Ejercicios prácticos y soluciones  
- Material complementario y referencias  

## Estructura del repositorio

## Convención de Commits

| Tipo         | Descripción                                                                |
| ------------ | -------------------------------------------------------------------------- |
| `model`      | Cambios en la estructura del modelo DSGE (ecuaciones, parámetros, shocks). |
| `data`       | Cambios en datos utilizados, momentos empíricos o procesamiento de datos.  |
| `estimation` | Modificaciones en la calibración, estimación bayesiana o SMM.              |
| `simulation` | Cambios en simulaciones, IRFs, escenarios o ejercicios contrafactuales.    |
| `code`       | Cambios generales en scripts, funciones utilitarias o estructura del repo. |
| `doc`        | Actualizaciones en la documentación, README, notas o comentarios.          |
| `refactor`   | Reorganización del código sin cambiar su comportamiento.                   |
| `fix`        | Correcciones de errores o bugs en el modelo o scripts.                     |
| `test`       | Scripts de validación, pruebas de sensibilidad, comparación modelo-datos.  |
| `viz`        | Gráficos, visualizaciones o scripts para presentación de resultados.       |

### Especificadores opcionales
Los commits pueden incluir un especificador opcional entre paréntesis para aclarar el entorno, lenguaje o componente específico al que se refiere el cambio. Esto es útil en proyectos con múltiples modelos, lenguajes o plataformas.
| Especificador | Significado                                             |
| ------------- | ------------------------------------------------------- |
| `(dynare)`    | Cambios en archivos `.mod` o scripts que usan Dynare    |
| `(r)`         | Cambios en scripts escritos en R                        |
| `(matlab)`    | Cambios en código MATLAB fuera de Dynare                |
| `(python)`    | Scripts o herramientas de soporte escritas en Python    |
| `(stata)`     | Scripts de procesamiento de datos o estimación en Stata |
| `(cumbia)`    | Específico al modelo CUMBIA                             |
| `(4gm)`       | Específico al modelo 4GM                                |
| `(core)`      | Parte central o base del modelo DSGE general            |
| `(irf)`       | Análisis de funciones impulso respuesta                 |
| `(ss)`        | Cálculo del estado estacionario o balance general       |


### Ejemplo: 
model(dynare): agrego fricción nominal al bloque de precios
data(r): actualizo momentos empíricos con datos hasta 2024T1
estimation(patacon): estimación bayesiana con prior revisado

