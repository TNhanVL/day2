import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Char "mo:base/Char";

actor {

  // Challenge 1

  public func nat_to_nat8(n : Nat): async Nat8 {
    if (n > 255) {
      return 255;
    };

    let n8 : Nat8 = Nat8.fromNat(n);
    return n8;
  };

  // Challenge 2

  public func max_number_with_n_bits(n : Nat): async Nat {
    return (2**n) - 1;
  };

  // Challenge 3
  public func decimal_to_bits(n : Nat): async Text {

    if (n == 0){
      return "0";
    };

    var ans : Text = "";
    var number : Nat = n;
    
    while(number > 0){
      var bit : Nat = number % 2;
      if (bit == 1) {
        ans := "1" # ans;
      }else{
        ans := "0" # ans;
      };
      number := number / 2;
    };

    return ans;
  };

  // Challenge 4
  public func capitalize_character(c : Char): async Char {
    var t = Char.toNat32(c);
    if(Char.isLowercase(c)){
      t := t - 32;
    };
    return Char.fromNat32(t);
  };

  // Challenge 5
  public func capitalize_text(t : Text): async Text {
    var ans : Text = "";
    for(char in t.chars()){
      var t = Char.toNat32(char);
      if(Char.isLowercase(char)){
        t := t - 32;
      };
      ans := ans # Char.toText(Char.fromNat32(t));
    };
    return ans;
  };
};
