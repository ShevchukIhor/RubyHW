array = Array [100, 12, 10, 120, -1, -100, 68, -12, -2, 0, 45, 120, 55, 68, 120, 12, 70, 96, -2, 8]
p 'Дан целочисленный массив:'
p array
p 'Найти количество его локальных минимумов.'
p 'result: ' 
p (1..array.size-2).select{ |i| (array[i] < array[i-1])&&(array[i] < array[i+1]) }.size

p '_____________________________________________________________'