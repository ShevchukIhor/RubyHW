n = 15
p 'Дано целое число. '
p 'n : ' + "#{n}" 
p 'Найти сумму его цифр.'
p 'result :' + ' ' + ((0..n).to_a).inject{|mul, n| mul + n }.to_s