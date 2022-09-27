public class Blackjack {

    public int parseCard(String card) {
        switch(card) {
            case "ace":
                return 11;
            case "king":
            case "queen":
            case "jack":
            case "ten":
                return 10;
            case "nine":
                return 9;
            case "eight":
                return 8;
            case "seven":
                return 7;
            case "six":
                return 6;
            case "five":
                return 5;
            case "four":
                return 4;
            case "three":
                return 3;
            case "two":
                return 2;
            case "one":
                return 1;
            default:
                return 0;
            
        }
    }

    public boolean isBlackjack(String card1, String card2) {
        return parseCard(card1) + parseCard(card2) == 21;
    }

    public String largeHand(boolean isBlackjack, int dealerScore) {
        if (!isBlackjack){
            return "P";
        }
        else if (dealerScore >= 10){
            return "S";
        }
        // else if (isBlackjack){
        else {
            return "W";
        }
        // return "P"
    }

    public String smallHand(int handScore, int dealerScore) {
        if (handScore >= 17){
            return "S";
        }
        else if (handScore <= 11){
            return "H";
        }
        else if (dealerScore >= 7){
            return "H";
        }
        else{
            return "S";
        }
    }

    // FirstTurn returns the semi-optimal decision for the first turn, given the cards of the player and the dealer.
    // This function is already implemented and does not need to be edited. It pulls the other functions together in a
    // complete decision tree for the first turn.
    public String firstTurn(String card1, String card2, String dealerCard) {
        int handScore = parseCard(card1) + parseCard(card2);
        int dealerScore = parseCard(dealerCard);

        if (20 < handScore) {
            return largeHand(isBlackjack(card1, card2), dealerScore);
        } else {
            return smallHand(handScore, dealerScore);
        }
    }
}
