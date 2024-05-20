Title: Notes
Width: 800
Size: 600
use tk

OnDisplay: @color

[@color]
ConfigButton 1 bg='#f96869', fg='#ffffee'
end
[/@color]

BackGround: app/res/bg.png

Buttons.nb: 2
Button1: Set Password
Button1.id: 0
0.x: 600
0.y: 100

Button2: Cancel
Button2.id: 1
1.x: 600
1.y: 160
1.link: home.ch

Input.nb: 1
Input1.id: 2
2.x: 574
2.y: 50

Text.nb: 1
Text1: Password
Text1.id: 3
3.x: 600

entry.width: 200
entry.size: 30

button.width: 200
button.size: 50

0.link: app/scripts/form_passw_lock.gcs