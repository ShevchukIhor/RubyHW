array = [100, 12, 10, -11, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти количество элементов, расположенных после последнего максимального.'
p "result : #{array.reverse.index(array.max)}"
p '______________________________________________________________________________________________'
