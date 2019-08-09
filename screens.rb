require_relative 'db'

class Scrs < Database
    #total number of tickets that has been booked so far in the theatre
    def tot_booked
        
        3.times {|i|
            puts "the total booked tickets in screen #{i+1} is #{@@screens[i+1]["data"].count}"
        }
        
    end

    #admin rights to view the details of any user who has booked in the theatre
    def user_details(scr,seat)
        name=@@screens[scr]["data"][seat-1][seat]
        puts"Screen: #{scr}"
        if scr==1 || scr==2 || scr==3
        puts "Movie name: #{@@screens[scr]["movie"]}"
        else
            puts "sorry no such screen exists"
        end
        puts "Name of the user who booked this seat: #{name}"
    end

    def scr_details
        3.times{ |i|
            puts "Screen #{i+1}: #{@@screens[i+1]["movie"]}"
            puts "Total Seats : #{@@screens[i+1]["total_seats"]}"
            puts "seats booked: #{@@screens[i+1]["data"].count}"
        }
        
    end

    def movie_list
        print("\n")
        3.times {|i|
        
        puts "#{i+1}. #{@@screens[i+1]["movie"]}"
    }
        print("\n")
        end

    def book_ticket(name,scr,seat)
        if @@screens[scr]["data"].count<@@screens[scr]["total_seats"]
            if seat>(@@screens[scr]["total_seats"]-@@screens[scr]["data"].count) 
                puts "sorry that many seats r not available"
            else
                @@screens[scr]["current_seats"]+=seat
                seat.times {
                    h=Hash.new
                    seat_no=@@screens[scr]["data"].count+1
                    h[seat_no]=name
                    @@screens[scr]["data"].push(h)
                }
                puts"your seats are booked in screen #{scr}"
            end
        else
            puts "sorry the screens are full"
        end
    end

    def log

        File.open("log.txt","w"){
            |f|
            3.times {|i|
            f << "Screen #{i+1} :\n"
            @@screens[i+1]["data"].each{ |hash|
                hash.each{|k,v|
                        f << "\tSeat no: #{k}   User name: #{v}\n"
                    }
                }
        }
    }
    File.close("log.txt")
    
    end

end
