array = Array [100, 12, 10, -11, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]
k = 35
p "Дан целочисленный массив и число К : #{k}"
p array
p 'Вывести количество элементов, меньших К.'
p "result : #{ array.select { |i| i < k } }"
p "result : #{ array.select { |i| i < k }.size }"
p '_____________________________________________________________'
