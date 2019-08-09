require_relative 'db'
require_relative 'user'
require_relative 'screens'

while(1)
    puts "Enter your Theatre interface option"
    puts "\t1. User\n\t2. Admin"
    choice=gets.chomp.to_i
    case choice
        when 1
            puts "\t1. Book\n\t2. view\n\t3. history\n\t4. cancel"
            user_choice=gets.chomp.to_i
            obj=User.new()
            puts"enter your name"
            obj.name=gets.chomp.to_s
            case user_choice
                
                when 1
                    puts "enter the movie name"
                    puts "\t1. AVENGERS\n\t2. JURASSIC PARK\n\t3. IRON MAN"
                    obj.movie=gets.chomp.to_i
                    if obj.movie>3 || obj.movie<1
                        puts "sorry enter a value from 1 to 3"
                    else
                        puts"enter no of seats you wish to book"
                        obj.seats=gets.chomp.to_i
                        obj.book
                    end
                when 2
                    obj.view
                when 3
                    obj.history
                when 4
                    obj.cancel
            end
        
        when 2
            puts "enter your option"
            puts "\t1. Screen\n\t2. Theatre\n\t3. Log the details"
            admin_choice=gets.chomp.to_i
            ob1=Scrs.new
            case admin_choice
                when 1
                    puts "\t1. total tickets booked\n\t2. total tickets in a screen\n\t3. view user details by seat number\n\t4. Screen details"
                    ch1=gets.chomp.to_i
                    case ch1
                        when 1
                            ob1.tot_booked

                        when 2
                            puts "enter the screen to view its ticket count"
                            d=gets.chomp.to_i
                            if d==1
                                puts "total of 10 seats"
                            elsif d==2
                                puts "total of 20 seats"
                            elsif d==3
                                puts "total of 15 seats"
                            else
                                puts "sorry the screen doesnt exist"
                            end

                        when 3
                            puts "enter the screen number (1,2,3)"
                            scr=gets.chomp.to_i
                            puts "enter the seat number"
                            seat=gets.chomp.to_i
                            ob1.user_details(scr,seat)
                        end
                when 2
                    puts "\t1. List Movies\n\t2. Show screen details\n\t3. Book tickets"
                    ch2=gets.chomp.to_i
                    
                    case ch2
                        when 1
                            ob1.movie_list

                        when 2
                            
                            ob1.scr_details
                        
                        when 3
                            puts"enter name"
                            name=gets.chomp.to_s
                            puts"enter the movie option\n\t1. AVENGERS\n\t2. JURASSIC PARK\n\t3. IRON MAN"
                            scr=gets.chomp.to_i
                            puts "how many seats"
                            seats=gets.chomp.to_i
                            ob1.book_ticket(name,scr,seats)

                    end
                
                when 3
                    ob1.log
            end
    end
end