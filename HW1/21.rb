array = Array [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти количество элементов, расположенных '
p 'перед первым максимальным.'
p 'result : ' + array.index(array.max).to_s
p '_____________________________________________________________'