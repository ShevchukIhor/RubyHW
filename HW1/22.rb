array = Array [12, 10, -11, -2, 0, 45, 55, 68, 70, 96, 2, 8]

p 'Дан целочисленный массив:'
p array
p 'Найти среднее арифметическое модулей его элементов.'
p 'result :' + ' ' + ((array.inject { |sum, n| sum + n.abs }.to_f) / array.size).to_s