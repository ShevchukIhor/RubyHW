array = Array [100, 12, 10, -1, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]
p 'Дан целочисленный массив.'
p array
p 'Вывести индексы элементов,' 
p 'которые больше своего правого соседа, и количество таких чисел.'
p "result : #{ (1...array.size).select { |e| array[e-1] > array[e] } }"
p "result : #{ (1...array.size).select { |e| array[e-1] > array[e] }.size }"
p '____________________________________________________________'
