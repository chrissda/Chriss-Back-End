# Coleccion de datos es una variable que puede guardar varios valores

# Listas(list)(arreglo)
frutas = ['manzana', "platano", 'papaya', "granadilla"]
# Ordenada(tienen un indice de busqueda)
print(frutas[0])

frutas.append('uva')
print(frutas)

# Elimina el valor de la lista segun su indice
fruta_eliminada = frutas.pop(0)
# Si queremos eliminar un elemento pero por su valor usamos el metodo remove
# Si tenemos dos o mas veces el valor repetido solo eliminara la primera cocordancia
# Si no existe ningun elemento con ese valor lanzara un error
frutas.remove('papaya')

# cuando nosotros colocamos el indice y le asignamos un valor, este reemplazara el valor actual
frutas[0] = 'palta'

# No se puede utilizar un indice que no existe para reemplazar un elemento
# frutas[7] = 'fresa'
print(fruta_eliminada)
print(frutas)

# len > longitud ya se ade texto, listas, tuplas, set
texto = 'hola soy un profe'
print(len(frutas))
print(len(texto))

# tuplas
# No se puede editar (ineditable)
meses = ('Enero', 'Febrero', 'Marzo')

# Mantener el mismo contenido durante toda la ejecucion del archivo o programa
# Aca se suele guardar informacion que no va a cambiar en toda la ejecucion del programa
print(meses[1])

# sets
# Es desordenada
# Si es editable
alumnos = {
  'Abel',
  'Cristhian',
  'Denys',
  'Andre',
  'Giancarlo',
  'Ignacio',
  'Luis',
  'Segundo',
  'Rodrigo',
  'Renzo'
}

print(alumnos)

# sirve para ver si esta o no esta
print('Denys' in alumnos)
print('Eduardo' in alumnos)

# agregar elementos a un set
alumnos.add('Arnold')
alumnos.remove('Luis')
print(alumnos)

# Diccionarios
# es ordenado PEEEERO no utiliza indices ino que usa LLAVES(KEYS)
persona = {
  'nombre': 'Cristhian',
  'apellido': 'Barreto',
  'sexo': 'Masculino',
  'hobbies': ['Dotear', 'Programar', 'Estudiar'],
  'direccion': {
    'calle': 'Icaro N',
    'numero': 1167,
    'zip_code': '15637'
  },
  'casado': False,
  'estatura': 1.77
}

# Si utilizamos una KEY que no exista, creara esa nueva key caso contrario reemplazara el valor antiguo
persona['edad'] = 36
persona['estatura'] = 1.80

print(persona)


# Como puedo obtener el nombre de la persona
print(persona['nombre'])
# Como obtener del numero de hobbies de la persona
print(len(persona['hobbies']))
# Como obtener el zip code de la direccion de la persona
print(persona['direccion']['zip_code'])

print(persona['apellido'])