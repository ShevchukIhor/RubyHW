array = Array [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти количество элементов, расположенных перед первым минимальным.'
p 'result : ' + array.index(array.min).to_s
p '______________________________________________________________________________________________'