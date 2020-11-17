import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart';

class yourRecord {
  int plrwins = 0;
  int botwins = 0;
  int draws = 0;

  yourRecord(this.plrwins, this.botwins, this.draws);

  int get plrWinCount {
    return plrwins;
  }

  int get botWinCount {
    return botwins;
  }

  int get drawsCount {
    return draws;
  }

  updateScore(int plrWins, int botWins, int newDraws) {
    plrwins += plrWins;
    botwins += botWins;
    draws += newDraws;
  }
}

  String getPlayerMove() {
    print("Papel, Gunting, Bato! What's your Pick?");
    String selection = stdin.readLineSync().toUpperCase();

    switch (selection.toLowerCase()) {
      case "bato":
        return "Bato";
        break;
      case "papel":
        return "Papel";
        break;
      case "gunting":
        return "Gunting";
        break;
      default:
        return "Quit";
        break;
    }
  }

  yourRecord yourRecordNew = yourRecord(0, 0, 0);

  String getComputerMove() {
    Random rand = new Random();
    int move = rand.nextInt(3);

    switch (move) {
      case 0:
        return "Bato";
        break;
      case 1:
        return "Papel";
        break;
      case 2:
        return "Gunting";
        break;
      default:
        break;
    }
  }

  String whoWon(String playerMove, String computerMove) {
    if (playerMove == computerMove) {
      yourRecordNew.updateScore(0,0,1);
      return "It's Tie!";
    } else if (playerMove == "Bato" && computerMove == "Gunting") {
      yourRecordNew.updateScore(1,0,0);
      return "Congartulations, You Won!";
    } else if (playerMove == "Gunting" && computerMove == "Papel") {
      yourRecordNew.updateScore(1,0,0);
      return "Congartulations, You Won!";
    } else if (playerMove == "Papel" && computerMove == "Bato") {
      yourRecordNew.updateScore(1,0,0);
      return "Congartulations, You Won!";
    } else {
      yourRecordNew.updateScore(0,1,0);
      return "Bot Wins! Better Luck Next Time.";
    }
  }

  String toEmoji(selection) {
    switch (selection) {
      case "Bato":
        return ('${Emojis.brick}');
        break;
      case "Papel":
        return ('${Emojis.newspaper}');
        break;
      case "Gunting":
        return ('${Emojis.scissors}');
        break;
      default:
        return "Quit";
        break;
    }
  }

  void main() {
    while (true) {
      var PW = yourRecordNew.plrWinCount;
      var BW = yourRecordNew.botWinCount;
      var DC = yourRecordNew.drawsCount;

      print("-------------------"
          "\nCurrent Play Record \n  You: $PW Wins \n  Bot: $BW Wins \n  $DC Draws \n"
          "-------------------");

      String playerMove = getPlayerMove();
      if (playerMove == "Quit") {
        return;
      }

      String computerMove = getComputerMove();
      var playerMoveEmoji = toEmoji(playerMove);
      var computerMoveEmoji = toEmoji(computerMove);
      print("You: $playerMoveEmoji : Bot: $computerMoveEmoji");
      print(whoWon(playerMove, computerMove));
    }
  }
