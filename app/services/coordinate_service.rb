class CoordinateService
  def self.for_location(location)
    {
      "Financial District, Milk and Kilby Streets" => "42.3571787,-71.0573071",
      "Clarendon St at Trinity Church" => "42.3500752,-71.0776725",
      "Financial District, Pearl Street at Franklin" => "42.3560843,-71.0570633",
      "Stuart St. at Trinity Place" => "42.3486086,-71.0775693",
      "City Hall Plaza, Fisher Park" => "42.359903,-71.0604875",
      "Hurley Building, New Chardon and Cambridge St" => "42.3620412,-71.0657414",
      "West End, Blossom St at Emerson Place, behind MGH" => "42.3650571,-71.0710883",
      "NEU, on Opera Place at Huntington Ave" => "42.3398106,-71.0913604",
      "Prudential, in front of Christian Science Center's Children's Fountain" => "42.3451299,-71.0881027",
      "East, on Commonwealth Ave at Silber Way" => "42.3493903,-71.1027633",
      "Boston Public Library" => "42.3492782,-71.0816086",
      "Innovation District, Seaport Blvd at Boston Wharf Rd" => "",
      "Harrison Ave and East Concord St, by BMC" => "42.3364781,-71.0754173",
      "Charlestown Navy Yard at Baxter Road" => "42.3733756,-71.0549069",
      "Chinatown, Boylston St near Washington St" => "42.352304,-71.0635862",
    }[location] || ""
  end
end
