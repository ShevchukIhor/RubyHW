array = Array [12, 10, 11, 45, 55, 68, 70, 96, 2, 8]
p 'Дан целочисленный массив:'
p array
p 'Упорядочить его по убыванию.'
p array.sort{|a, b| b <=> a}
p '_____________________________________________________________'