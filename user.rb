require_relative 'db'

class User < Database
    
    attr_accessor :name,:seats,:movie
    @name=nil
    @seats=0
    @movie=0
    def book
        if @@screens[@movie]["data"].count<@@screens[@movie]["total_seats"]
            if @seats>(@@screens[@movie]["total_seats"]-@@screens[@movie]["data"].count) 
                puts "sorry , only #{@@screens[@movie]["current_seats"]} seats are available"
            else
                @@screens[@movie]["current_seats"]+=seats
                @seats.times {
                    h=Hash.new
                    seat_no=@@screens[@movie]["data"].count+1
                    h[seat_no]=@name
                    @@screens[@movie]["data"].push(h)
                }
                puts"your seats are booked in screen #{@movie}"
            end
        else
            puts "sorry the screens are full"
        end
    end

    def view
        flag=0
        count=0
        @@screens.each_key { |screen_no|
            
                
                puts "screen : #{screen_no}"
                @@screens[screen_no]["data"].collect { |hash|
                        if hash.has_value?(@name)
                            count+=1
                            flag=1
                        end
                    }
                
                puts "no of seats booked: #{count}"
                
                flag=1
                count=0
            }
        if flag==0
            puts "sorry user not found"
        end        
    end

    def history
        @@screens.each_key { |screen_no|
            count=0
            @@screens[screen_no]["data"].each { |hash|
                if hash.has_value?(@name)
                    count+=1
                end
            }
            puts "you have booked #{count} seats in screen #{screen_no} for the movie #{@@screens[screen_no]["movie"]}"
        }
    end


    def cancel
        flag=0
        @@screens.each_key { |screen_no|

            @@screens[screen_no]["data"].each { |hash|
            
                if hash.has_value?(@name)
                    @@screens[screen_no]["data"]-=@@screens[screen_no]["data"]-[hash]
                    flag=1
                end
            }
            
        }

    
        if flag==0
            puts "sorry user not found"
        else
            puts "your ticket has been cancelled\n"
        end
    end
end