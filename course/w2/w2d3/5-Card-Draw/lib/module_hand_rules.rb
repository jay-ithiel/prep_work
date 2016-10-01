module HandRules
  CARD_VALUE_TYPE_PAIRS = {two: 2, three: 3, four: 4, five: 5, six: 6,
    seven: 7, eight: 8, nine: 9, ten: 10, jack: 11, queen: 12, king: 13,
    ace: 14}
  HAND_HIERARCHY = {royal_flush: 10, straight_flush: 9, four_kind: 8,
    full_house: 7, flush: 6, straight: 5, three_kind: 4, two_pair: 3, pair: 2,
    high_card: 1}

  def winning_hand(*hands)
    # hand_results = {}
    winner = {
      player: nil,
      hand_value: nil,
      tie_breaker: nil
    }

    hands.each do |hand|
      hand_type, tie_breaker = declare_hand_type(hand)
      hand_value = HAND_HIERARCHY[hand_type]
      if winner.values.include?(nil) || hand_value >= winner[:hand_value]
        if winner[:hand_value] == hand_value && winner[:tie_breaker] < tie_breaker
          winner = {player: hand.player, hand_value: hand_value, tie_breaker: tie_breaker }
        else
          winner = {player: hand.player, hand_value: hand_value, tie_breaker: tie_breaker }
        end
# puts winner
      end
    end
    winner[:player]
  end

  def declare_hand_type(hand)
    royal_flush(hand) ||
    straight_flush(hand) ||
    four_kind(hand) ||
    flush(hand) ||
    straight(hand) ||
    three_kind(hand) ||
    two_pair(hand) ||
    pair(hand) ||
    high_card(hand)
  end

  private

    def royal_flush(hand)
      has_straight_flush = straight_flush(hand)
      if has_straight_flush && has_straight_flush[1] == 14
        [:royal_flush, 14]
      else
        false
      end
    end

    def straight_flush(hand)
      has_flush = flush(hand)
      has_straight = straight(hand)
      if has_flush && has_straight
        [:straight_flush, hand.value_hash.keys.max]
      else
        false
      end
    end

    def four_kind(hand)
      fours = hand.value_hash.select{ |_, occurances| occurances == 4 }
      fours.length == 1 ? [:four_kind, fours.keys[0]] : false
    end

    def full_house(hand)
      has_trip = three_kind(hand)
      has_pair = pair(hand)
      if has_trip && has_pair
        [:full_house, has_trip.keys[0]]
      else
        false
      end
    end

    def flush(hand)
      p_flush = hand.suit_hash.select { |_, freq| freq == 5 }
      p_flush.count == 1 ? [:flush, hand.value_hash.keys.max] : false
    end

    def straight(hand)
      p_straight = hand.value_hash.keys.sort
      diff = p_straight[-1] - p_straight[0] if p_straight.length == 5
      diff == 4 ? [:straight, p_straight[-1]] : false
    end

    def three_kind(hand)
      trips = hand.value_hash.select{|_, occurances| occurances == 3}
      trips.length == 1 ? [:three_kind, trips.keys[0]] : false
    end

    def two_pair(hand)
      pairs = hand.value_hash.select{|_, occurances| occurances == 2}
      pairs.length == 2 ? [:two_pair, pairs.keys.max] : false
    end

    def pair(hand)
      pair = hand.value_hash.select{|_, occurances| occurances == 2}
      pair.length == 1 ? [:pair, pair.keys[0]] : false
    end

    def high_card(hand)
      [:high_card, hand.value_hash.keys.sort[-1] ]
    end
end
