n = 17
p 'Дано целое число. '
p 'n : ' + "#{n}" 
p 'Найти произведение его цифр.'
p 'result :' + ' ' + ((1..n).to_a).inject {|mul, n| mul * n }.to_s