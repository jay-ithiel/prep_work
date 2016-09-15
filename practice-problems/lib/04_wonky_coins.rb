# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
# Difficulty: 3/5

def wonky_coins(n)
  # n/2.floor
  # n/3.floor
  # n/4.floor
  zero_count = 0
  # convert method that takes 'n' and returns [n/2, n/3, n/4]
    # for each '0', increment zero_count by 1
    # for each non-zero, toss it into convert


end


# wonky_coins(1)#.should == 3
# wonky_coins(5)#.should == 11
# wonky_coins(6)#.should == 15
# wonky_coins(0)#.should == 1
