array = Array [100, 12, 10, -11, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти индекс первого экстремального элемента.'
p 'result max: ' + array.index(array.max).to_s
p 'result min: ' + array.index(array.min).to_s