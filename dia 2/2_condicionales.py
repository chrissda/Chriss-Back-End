numero1 = 45
numero2 = 50
numero3 = 40

# condicionales se pueden da con resultado boolean
if numero1 > numero2:
  print('El numero 1 es mayor que el numero 2')
# si no cumple con la primera conficion entonces trataremos con esta nueva y si no cumple entonces continuara al else o a otro elif si hubiese
elif numero1 > numero3:
  print('El numero 1 es mayor que el numero 3')
else:
  print('El numero 2 es mayor que el numero 3')


# Si tengo el sueldo entre 500 y 800 soles entonces puedo ir a la playa
# Si tengo mas de 800 soles puedo ir al inti raymi
def calcular_actividades_vacacionales(sueldo: int):
  if sueldo >= 500 and sueldo <= 800:
    print('Puedo ir a la playa')
  elif sueldo > 800:
    print('Puedo ir al inti raymi')

sueldo = 600
# playaso
calcular_actividades_vacacionales(sueldo)

sueldo = 1300
# inti raymi
calcular_actividades_vacacionales(sueldo)

# Queremos saber si un alumno esta reprobado o necesita ir a vacacional o esta reprobado
# las condiciones son: si tiene entre 13 y 18 esta aprobado, si tiene entre 19 y 20 esta aprobado con felicitaciones, si tiene entre 11 y 12 necesita ir a vacacional y si tiene menos de 11 entonces esta reprobado
# convierta esto en una funcion en la cual se pase la nota y el nombre del estudiante
# nombre = 'Cristhian'
# nota = 15

def reprobado(nombre, nota):
    # modificar para no recibir menores que 0
    if nota < 0:
      print('No puede haber notas negativas')
    elif nota <= 10:
      print(f'El alumndo {nombre} esta desaprobado')
    elif nota <= 12:
      print(f'El alumndo {nombre} necesita ir a vacacional')
    elif nota <= 18:
      print(f'El alumndo {nombre} esta aprobado')
    elif nota <= 20:
      print(f'El alumndo {nombre} esta aprobado con felicitaciones')

reprobado('Cristhian', -10)