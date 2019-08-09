class Database
    #@@screens={1 => [], 2 => [], 3 => [] }
    #@@total_seats={1 => 10, 2 => 20, 3 => 15}
    #@@current_seats={1 => 0, 2 => 0, 3 => 0}
    #@@movie={1=>"AVENGERS",2=>"JURASSIC PARK",3=>"IRON MAN"}

    @@screens= {
        1 => {"data" => [],"total_seats" => 10,"current_seats" => 0, "movie"=> "AVENGERS"},
        2 => {"data"=>[],"total_seats"=> 20,"current_seats"=> 0, "movie"=> "JURASSIC PARK"},
        3 => {"data"=>[],"total_seats"=> 15,"current_seats"=> 0, "movie"=> "IRON MAN"}
    
    }
end

