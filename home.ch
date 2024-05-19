Title: Notes
Width: 800
Size: 600
use tk
AppIcon: app/res/file.png

OnDisplay: app/scripts/init.gcs

[events]
Button-1: @test
Double-Button-1: app/scripts/home_open_file.gcs
[/events]

Text.nb: 1
Text1: ...
Text1.id: 0
0.x: 650
0.y: 150

Text2: Root
Text2.id: 7
7.x: 650

Button.nb: 7
Button1: New
Button1.id: 1
Button2: Open
Button2.id: 2
Button3: Search
Button3.id: 3
Button4: About
Button4.id: 4
Button5: Delete
Button5.id: 5
Button6: Secure
Button6.id: 6
Button7: Back
Button7.id: 8

1.x: 650
2.x: 650
3.x: 650
4.x: 650
5.x: 650
6.x: 650
8.x: 650

1.y: 200
2.y: 250
3.y: 300
4.y: 350
5.y: 400
6.y: 450
8.y: 500

1.link: app/screens/form_file.ch
2.link: app/scripts/home_open_file.gcs
3.link: app/screens/form_search.ch
4.link: app/scripts/home_about_file.gcs
5.link: app/scripts/home_delete_file.gcs
6.link: app/screens/form_passw.ch
8.link: app/scripts/home_back.gcs

BackGround: app/res/bg.png

[@test]
if evaluate({LASTCLICKEDID} in {*canban.eventList}) then
	SetVar *choosen LASTCLICKEDID
	GetTableElement *choosen of *canban.eventList
	GetTableElement LASTCLICKEDID of *canban.eventList
	GetTableElement 1 of LASTRESULT
	CreateText 0 LASTRESULT
	end
end
[/@test]