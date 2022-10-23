N = 5
a = (1..N).to_a
p 'Дано натуральное число N. Если N - нечетное, то найти произведение 1*3*…*N; если N - четное, то найти произведение 2*4*…*N.'
p "N: #{N}"
p 'result partition: ' + a.partition{|e| e%2!=0}.to_s
p 'result select: ' + a.partition{|e| e%2!=0}.select{ |e| e.index(a[-1]) }.to_s
p 'result flatten: ' + a.partition{|e| e%2!=0}.select{ |e| e.index(a[-1]) }.flatten.to_s
p 'result : ' + a.partition{|e| e%2!=0}.select{ |e| e.index(a[-1]) }.flatten.inject{ |sum, n| sum * n }.to_s
p '______________________________________________________________________________________________'
