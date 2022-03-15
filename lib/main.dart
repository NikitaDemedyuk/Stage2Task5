import 'dart:io';
import 'dart:math';

class PlayerMoveIndexException implements Exception {
  String getErrorMessage() {
    return '\nIncorrect index\n';
  }
}

enum RockPaperScissors {
  rock,
  paper,
  scissors
}

RockPaperScissors? selectAttribute(final int? playerChoice) {
  final RockPaperScissors? playerMove;
  switch (playerChoice) {
    case 1: {
      playerMove = RockPaperScissors.rock;
      break;
    }
    case 2: {
      playerMove = RockPaperScissors.paper;
      break;
    }
    case 3: {
      playerMove = RockPaperScissors.scissors;
      break;
    }
    default: {
      playerMove = null;
    }
  }
  return playerMove;
}

int createRandomNum() {
  final randomNum =  Random().nextInt(2) + 1;
  return randomNum;
}

void makeGameLogic(RockPaperScissors? playerChoice, RockPaperScissors? computerChoice) {
  if (playerChoice?.index == computerChoice?.index) {
      stdout.write("\nIt was a tie!\n");
  } else if  ((playerChoice?.index == 2 && computerChoice?.index == 1) ||
              (playerChoice?.index == 1 && computerChoice?.index == 0) ||
              (playerChoice?.index == 0 && computerChoice?.index == 2)) {
      stdout.write("\nYou win! Computer lose...\n");
  }  else {
      stdout.write("\nComputer win! You lose...\n");
  }
}

int main() {
  bool flagGameContinue = true;
  stdout.write("Start!\n");
  while (flagGameContinue) {
    stdout.write("--------------------------------------------------\n");
    stdout.write('Select:\n1 - Rock, 2 - Paper, 3 - Scissors\nEnter: ');
    final int playerIndex;
    try {
      playerIndex = int.parse(stdin.readLineSync() ?? '0');
      if (playerIndex < 1 || playerIndex > 3) {
        throw PlayerMoveIndexException();
      }
    } on PlayerMoveIndexException catch(e) {
      stdout.write(e.getErrorMessage());
      return 0;
    }

    final RockPaperScissors? playerMove = selectAttribute(playerIndex);
    final RockPaperScissors? computerMove = selectAttribute(createRandomNum());

    stdout.write("\nYour choice: ${playerMove?.name} \nComputer choice: ${computerMove?.name} \n");
    makeGameLogic(playerMove, computerMove);

    stdout.write("--------------------------------------------------\n");
    stdout.write('Select:\n1 - Exit, 2 - Play game\nEnter: ');
    final int? gameContinue = int.parse(stdin.readLineSync() ?? '0');
    switch (gameContinue) {
      case 1: {
        flagGameContinue = false;
        break;
      }
      default: {
        flagGameContinue = true;
        break;
      }
    }
  }
  stdout.write('\nEnd game\n');
  return 0;
}