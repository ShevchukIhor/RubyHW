array = Array [100, 12, 10, -11, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Вывести индексы массива в том порядке, в котором соответствующие'
p ' им элементы образуют убывающую последовательность.'
p 'result : ' + (0...array.size).sort_by{|i| array[i]}.reverse.to_s