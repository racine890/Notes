BackGround: app/res/bg.png

OnDisplay: @color

[@color]
ConfigButton 4 bg='#f96869', fg='#ffffee'
end
[/@color]

Buttons.nb: 3
Button1: Create File
Button1.id: 0
0.x: 600
0.y: 100

Button2: Create Folder
Button2.id: 1
1.x: 600
1.y: 160

Button3: Cancel
Button3.id: 4
4.x: 600
4.y: 220
4.link: home.ch

Input.nb: 1
Input1.id: 2
2.x: 574
2.y: 50

Text.nb: 1
Text1: Name
Text1.id: 3
3.x: 600

entry.width: 200
entry.size: 30

button.width: 200
button.size: 50

0.link: app/scripts/form_file_new_file.gcs
1.link: app/scripts/form_file_new_folder.gcs