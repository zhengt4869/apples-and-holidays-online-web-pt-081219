require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_supplies[:winter].each do |holiday,supplies|  
    supplies << supply
  end 
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  res = []
  holiday_hash[:winter].each do |holiday, supplies|
    res += supplies
  end 
  res 
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize + ":"
    holidays.each do |holiday, supplies|
      re_holiday = ""
      holiday.to_s.split("_").each do |word|
        re_holiday += word.capitalize + " "
      end 
      new_holiday = re_holiday[0, re_holiday.length-1]
      res = "  "+ new_holiday + ": "
      index = 0
      n = supplies.length - 1 
      supplies.each do |supply|
        if index == n
          res += supply
        else 
          res += supply + ", "
        end
        index += 1 
      end 
      puts res 
    end 
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  res = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        res << holiday
      end 
    end 
  end
  res
end







