#include <iostream>
#include <string>

// Function to get the symbol for the suit
std::string getSuitSymbol(const std::string& suit) {
    if (suit == "Spades" || suit == "spades") return "♠";
    if (suit == "Hearts" || suit == "hearts") return "♥";
    if (suit == "Diamonds" || suit == "diamonds") return "♦";
    if (suit == "Clubs" || suit == "clubs") return "♣";
    return "?"; // Unknown suit
}

// Function to print the card
void printCard(int cardNumber, std::string& suitSymbol) {
    const int cardHeight = 7;
    const int cardWidth = 17;

    // Array of strings for each card layout
    std::string cardLayouts[10][cardHeight] = {
        { // Card 1
            "---------------",
            "||             ||",
            "||             ||",
            "||      "+suitSymbol+"      ||",
            "||             ||",
            "||             ||",
            "---------------"
        },
        { // Card 2
            "---------------",
            "||  "+suitSymbol+"          ||",
            "||             ||",
            "||             ||",
            "||             ||",
            "||          "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 3
            "---------------",
            "||  "+suitSymbol+"          ||",
            "||             ||",
            "||      "+suitSymbol+"      ||",
            "||             ||",
            "||          "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 4
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||             ||",
            "||             ||",
            "||             ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 5
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||             ||",
            "||      "+suitSymbol+"      ||",
            "||             ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 6
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||             ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||             ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 7
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||             ||",
            "||  "+suitSymbol+"   "+suitSymbol+"   "+suitSymbol+"  ||",
            "||             ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 8
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||      "+suitSymbol+"      ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||      "+suitSymbol+"      ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 9
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||      "+suitSymbol+"      ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        },
        { // Card 10
            "---------------",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "||  "+suitSymbol+"       "+suitSymbol+"  ||",
            "---------------"
        }
    };

    // Print the layout for the given card number
    for (int i = 0; i < cardHeight; ++i) {
        for (char c : cardLayouts[cardNumber - 1][i]) {
            if (c == '♠') {
                std::cout << suitSymbol;
            } else {
                std::cout << c;
            }
        }
        std::cout << std::endl;
    }
}

int main() {
    int cardNumber;
    std::string cardSuit;

    // Get user input
    std::cout << "Enter the card number (1-10): ";
    std::cin >> cardNumber;

    // Ensure valid card number
    while (cardNumber < 1 || cardNumber > 10) {
        std::cout << "Invalid card number. Please enter a number between 1 and 10: ";
        std::cin >> cardNumber;
    }

    std::cout << "Enter the card suit (Spades, Hearts, Diamonds, Clubs): ";
    std::cin >> cardSuit;

    // Get the suit symbol
    std::string suitSymbol = getSuitSymbol(cardSuit);

    // Ensure valid suit
    while (suitSymbol == "?") {
        std::cout << "Invalid card suit. Please enter one of the following: Spades, Hearts, Diamonds, Clubs: ";
        std::cin >> cardSuit;
        suitSymbol = getSuitSymbol(cardSuit);
    }

    // Print the card
    printCard(cardNumber, suitSymbol);

    return 0;
}
