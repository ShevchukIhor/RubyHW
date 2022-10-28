array = Array [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
p "дізнатись кількість елементів в масиві;"
p "result 1 : #{ array.length }"
p '_________________________________________________________________________________________'

p "перевернути масив;"
p "result 2 : #{ array.reverse }"
p '_________________________________________________________________________________________'

p "знайти найбільше число;"
p "result 3 : #{ array.max }"
p '_________________________________________________________________________________________'

p "знайти найменше число;"
p "result 4 : #{ array.min }"
p '_________________________________________________________________________________________'

p "відсортувати від меншого до більшого;"
p "result 5 : #{ array.sort }"
p '_________________________________________________________________________________________'

p "відсортувати від більшого до меншого;"
p "result 6 : #{ array.sort.reverse }"
p '_________________________________________________________________________________________'

p "видалити всі непарні числа;"
p "result 7 : #{ array.find_all{ |i| i.even? } }"
p '_________________________________________________________________________________________'

p "залишити тільки ті числа, які без остачі ділятся на 3;"
p "result 8 : #{ array.select{ |i| i % 3 == 0 } }"
p '_________________________________________________________________________________________'

p "видалити з масиву числа, які повторюються (тобто, потрібно вивести масив, в якому немає повторень);"
p "result 9 : #{ array.uniq }"
p '_________________________________________________________________________________________'

p "розділити кожен елемент на 10, в результаті елементи не мають бути округленими до цілого;"
p "result 10 : #{ array.map{ |i| (i / 10.0) } }"
p '_________________________________________________________________________________________'

p "отримати новий масив, який би містив в собі ті літери англійського алфавіту, порядковий номер яких є в нашому масиві;"
a = ('A'..'Z').to_a
p 'result 11: '
p (0...array.size).collect { |i| a[i] }.delete_if{ |i| i.nil?}
p '_________________________________________________________________________________________'

p "змінити місцями мінімальний і максимальний елементи масиву;"
p array
min_ind, max_ind = array.index(array.min), array.index(array.max)
array[min_ind], array[max_ind] = array.max, array.min
p "result 12 : "
p array
p '_________________________________________________________________________________________'

p "знайти елементи, які знаходяться перед мінімальним числом в масиві;"
p "result 13 : #{ (0...array.min-2).map { |i| array[i] } }"
p '_________________________________________________________________________________________'

p "необхідно знайти три найменших елементи."
p "result 14 : #{ array.sort.first 3 }"
p '_________________________________________________________________________________________'