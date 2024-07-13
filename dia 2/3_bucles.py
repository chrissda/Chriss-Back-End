# for
# repetitivo que DEBE tener un final

# posicion inicial hasta menor que el limite (10)
for numero in range(0, 10):
  print(numero)

print('*********')
for numero in range(5):
  print(numero)

# no se recomienda utilizar la varibale del bucle ya que esta puede cambiar si valor en base al bucle y puede generar error de logica en nuestros programas
print(numero)
print('*********')
for numero in range(1, 10, 2):
  print(numero)


print('*********')
# el for se usa mayormente cuando queremos iterar elementos de una lista o tupla
notas = [10, 15, 6, 13, 18, 20]

for nota in notas:
  # cada vuelta ingresara a una posicion de la lista
  print(nota)


print('*********')
# el bucle for sirve para iterar texto
texto = 'El dia de hoy fue un dia muy frio ya que estamos en invierno'

for letra in texto:
  print(letra)

# se tiene la siguiente informacion
notas = [15, 7, 12, 14, 20]
# aprobado > 10 | desaprobado <= 10
# imprimir las notas aprobadas y las notas desaprobadas
notas_aprobadas, notas_desaprobadas, contadorA, contadorD = [], [], 0 ,0
total_notas_desaprobadas, total_notas_aprobadas = 0, 0
for nota in notas:
  if nota <= 10:
    notas_desaprobadas.append(nota)
    # contadorD = contadorD + 1
    # incrementamos el valor anterior en una unidad
    contadorD += 1
    # sumando los valores de mis notas desaprobadas
    total_notas_desaprobadas += nota
  else:
    notas_aprobadas.append(nota)
    contadorA += 1
    total_notas_aprobadas += nota

print(f'Las notas aprobadas son: {notas_aprobadas}')
print(f'Las notas desaprobadas son: {notas_desaprobadas}')  
# indicar cuantas notas son aprobadas y cuantas desaprobadas
print(f'Hay {contadorD} notas desaprobadas')
print(f'Hay {contadorA} notas aprobadas')

# sacar el promedio de las notas aprobadas y el promedio de las notas desaprobadas
print(f'''El promedio de las notas desaprobadas es {total_notas_desaprobadas/contadorD} notas aprobadas''')
print(f'''El promedio de las notas aprobadas es {total_notas_aprobadas/contadorA} notas aprobadas''')

# while
tope = 100
actual = 0
while actual < tope:
  print(actual)
  actual += 1

# para cerrar el while de una manera abrupta
while True:
  print('hola')
  break # termina la iteracion de manera abrupta, esto tambien es valor para los for

for numero in range(5):
  if numero == 3:
    continue # detiene la iteracion actual y no permite que se ejecute el codigo restante PERO no acaba la iteracion como el brak
  print(numero)

def mostrar_alumno():
  # si de momento no tenemos una logica planeada para nuestra funcion, if, else, for, while, etc o cualquier bloque de codigo podemos usar
  pass
  # {}