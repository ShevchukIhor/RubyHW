array = [100, 12, 10, 120, -1, -100, 68, -12, -2, 0, 45, 120, 55, 68, 120, 12, 70, 96, -2, 8]
p 'Дан целочисленный массив:'
p array
p 'Найти количество его локальных максимумов.'
p 'result: '
p (1..array.size - 2).select { |index| (array[index] > array[index - 1]) && (array[index] > array[index + 1]) }.size
p '_____________________________________________________________'