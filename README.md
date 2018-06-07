# Quark

## Kevin Lin, Qian Zhou, Victor Lin
## APCS2 pd01
## Final Project: Pinball

[Our Proposal](Quark/docs/proposal.pdf)

## Description
The classic pinball game in which the user controls the flippers located on the bottom of the gui. These flippers can flip within a range of 60 degrees, 30 above and 30 below the horizontal. This flip will bounce the ball upward, with a more powerful bounce when moving upwards.
Use those flippers to keep the moving ball within the field. There's a downward acceleration acting on the ball. The ball will (ideally) be bounced back by the walls, and may be accelerated by the red bumpers. The user gains points when he/she hits a bumper, and loses a "life"(5) when the ball falls into the hole between the flippers.

## Advantages of Use
PinBall is a game; subsequently, the user can spend his leisure time having fun using his eyes and hands.

## Instructions
1) pull repository
2) change directory to ./Game
3) open processing for Game.pde
4) press the play button once the window opens
5) play and HAVE FUN?!?! (Press S for left Flipper and K for right Flipper and SPACE to launch the ball)

## Coding
<p>We used two ArrayLists, one of Walls and one of Bumpers, each located at specific locations to create the field. In addition there are two Flippers with a fixed point and a movable end. </p>
<p>The Ball has variables regarding x and y posistions, and x and y velocities. The y velocity is altered a constant amount each round to account for acceleration.</p>
<p>To determine whether a ball is incontact with another object, the distance formula between two points is used if that object is a bumper, and the point-line distance formula, |Ax+By-C|/sqrt(A^2 + B^2) is used if that object is a line. The ball is reflected in most cases at an angle of reflection equal to the angle of incidence to the normal of the object.</p>


