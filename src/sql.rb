#!/Users/lijun695/.rbenv/shims/ruby

for i in 1..50
#    puts "Value of local variable is "
   puts "UPDATE t_certificate_apply_#{i} SET mail = '' WHERE mail LIKE '%@%';";
   puts "UPDATE t_certificate_apply_#{i} SET mail_changed = '' WHERE mail_changed LIKE '%@%';";
   puts "UPDATE t_certificate_send_#{i} SET send_mail = '' WHERE send_mail LIKE '%@%';";
   puts "";
   
end