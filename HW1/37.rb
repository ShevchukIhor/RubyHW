array = [100, 12, 10, -1, -2, 0, 45, 120, 55, 68, 70, 96, 2, 8]
k = rand(-20..120)
p 'Дан целочисленный массив.'
p array
p " и число К : #{k}."
p 'Если все элементы массива больше К, то вывести true; в противном случае вывести false.'
p "result : #{array.select { |element| element > k }.length == array.length}"
p '____________________________________________________________'
