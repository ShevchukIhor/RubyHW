array = Array [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти все четные элементы.'
p 'result : ' + array.select{|e| e%2!=0}.to_s