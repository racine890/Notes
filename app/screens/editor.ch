#Edit values. They're not like win32 ones
Edit.BeginX: 350
#Edit.EndX: 1140
Edit.BeginY: 300
#Edit.EndY: 1000
Edit.Width: 700
Edit.Size: 450

BackGround: app/res/bg.png

Text.nb: 4
Text1: Save
Text1.id: 0
0.x: 0
0.y: 40

Text2: Close
Text2.id: 1
1.x: 60
1.y: 40

Text3: Export(txt)
Text3.id: 2
2.x: 130
2.y: 40

Text4: Export(html)
Text4.id: 3
3.x: 210
3.y: 40

#At loading, execute this function
OnDisplay: app/scripts/editor_create.gcs

#This is commented because it's not production version
#If you export this as standalone, please uncomment this part.
#If your app is installed, load it on display

[events]
Control.s: app/scripts/editor_save.gcs
Control.S: app/scripts/editor_save.gcs
Control.q: app/scripts/editor_close.gcs
Control.Q: app/scripts/editor_close.gcs
Key: @editMode
Button-1: @act
[/events]

[@act]
switch LASTCLICKEDID
if 7 then
	execute app/scripts/editor_save.gcs
	end
if 8 then
	execute app/scripts/editor_close.gcs
	end
if 9 then
	execute app/scripts/editor_export_txt.gcs
	end
if 10 then
	execute app/scripts/editor_export_html.gcs
	end
[/@act]

[@editMode]
compare *updated 0
if 5 then
	end
SetVar *updated 1
evaluate self.page.st.delete('1.0', 'end-1c')
evaluate self.page.st.insert('end', {*fcontents})
end
[/@editMode]

#END