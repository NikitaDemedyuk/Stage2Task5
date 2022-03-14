import 'dart:io';
import 'dart:math';

class PlayerMoveIndexException {}

enum RockPaperScissors {
  rock,
  paper,
  scissors
}

RockPaperScissors selectAttribute(int playerChoice) {
  var playerMove;
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
  }
  return playerMove;
}

int createRandomNum() {
  final randomNum =  Random().nextInt(2) + 1;
  return randomNum;
}
void makeGameLogic(RockPaperScissors playerChoice, RockPaperScissors computerChoice) {
  if (playerChoice.index == computerChoice.index) {
    stdout.write("\nIt was a tie!\n");
  } else if ((playerChoice.index == 1 && computerChoice.index == 0) ||
              (playerChoice.index == 0 && computerChoice.index == 2) ||
              (playerChoice.index == 2 && computerChoice.index == 1)) {
      stdout.write("\nYou win! Computer lose...\n");
  }
  else if ((computerChoice.index == 1 && playerChoice.index == 0) ||
      (computerChoice.index == 0 && playerChoice.index == 2) ||
      (computerChoice.index == 2 && playerChoice.index == 1)) {
    stdout.write("\nComputer win! You lose...\n");
  }
}

int main() {
  stdout.write('Select:\n1 - Rock, 2 - Paper, 3 - Scissors\nEnter: ');
  final int playerIndex;
  try {
     playerIndex = int.parse(stdin.readLineSync() ?? '0');
      if (playerIndex < 1 || playerIndex > 3) {
        throw(PlayerMoveIndexException);
      }
  } catch (PlayerMoveIndexException) {
    stdout.write("\nIncorrect index\n");
    return 0;
  }
  final playerMove = selectAttribute(playerIndex);
  final computerMove = selectAttribute(createRandomNum());

  stdout.write("\nYour choice: ${playerMove.name} ${playerMove.index} \nComputer choice: ${computerMove.name}  ${computerMove.index}\n");
  makeGameLogic(playerMove, computerMove);
  return 0;
}