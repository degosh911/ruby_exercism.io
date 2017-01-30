File.open(ARGV[0]).each_line do |line|

  missing_letters = []

  unless line.chomp.empty?
    line.chomp!
    line.downcase!
    ('a'..'z').each do |l|
      if line.index(l).nil?
        missing_letters << l
      end
    end
  end

  if missing_letters.empty?
    puts "NULL"
  else
    puts missing_letters.join('')
  end
end  