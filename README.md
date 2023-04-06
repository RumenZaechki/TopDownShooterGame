# [CS50x(2020) Final Project:](https://cs50.harvard.edu/x/2023/project/) TopDownShooterGame

## Description:

As the title suggests, this is a Top-Down Shooter Game, inspired by Space Invaders. It was made using Lua with [Löve2D](https://love2d.org/) framework.

You're basically controlling a spaceship, trying to destroy the other enemy spaceships or meteors.

### Control keys:
- W, A, S, D: Move.
- Space: Shoot.
- M: Mute music.

### Content:
- [assets](/assets): Contains all the images and sounds used in the game.
- [background.lua](/background.lua): Contains the logic for loading, and scaling the bakground.
- [bullets.lua](/bullets.lua): Contains the logic for the bullets implementation: creation, removal, cooldown.
- [collision.lua](/collision.lua): Contains a single method for checking whether two objects collide.
- [enemies.lua](/enemies.lua): Contains the logic for enemies implementation: creation, removal.
- [main.lua](/main.lua): This is the main file which runs the game.
- [menu.lua](/menu.lua): Contains the logic for loading, updating and drawing the menu, along with all the other dependencies.
- [player.lua](/player.lua): Contains the player logic: initialization, animations and movement.
- [sounds.lua](/sounds.lua): Contains the methods for loading the different sounds and updating(muting) them.