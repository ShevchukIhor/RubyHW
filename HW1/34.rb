array = [100, 12, 10, -11, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]
p 'Дан целочисленный массив.'
p array
p 'Вывести индексы элементов,' 
p 'которые меньше своего левого соседа, и количество таких чисел.'
p "result : #{(1...array.length).select { |index| array[index] < array[index - 1] }}"
p "result : #{(1...array.length).select { |index| array[index] < array[index - 1] }.size}"
p '____________________________________________________________'
