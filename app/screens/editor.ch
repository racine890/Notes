#Edit values. They're not like win32 ones
Edit.BeginX: 350
#Edit.EndX: 1140
Edit.BeginY: 300
#Edit.EndY: 1000
Edit.Width: 700
Edit.Size: 450

BackGround: app/res/bg.png

#At loading, execute this function
Onload: @create

#This is commented because it's not production version
#If you export this as standalone, please uncomment this part.
#If your app is installed, load it on display
OnDisplay: @loadInstalled

#Function to create the ToolBar
[@create]
SetVar *updated 0
evaluate ["File"]
SetVar *Big LASTRESULT
evaluate [["Save", "Close"]]
SetVar *Sub LASTRESULT
evaluate [["@save", "@close"]]
SetVar *Act LASTRESULT
ToolBar *Big *Sub *Act
[/@create]

#Function to load the param file
[@loadInstalled]
evaluate self.page.st.config(insertbackground='#61FEEB')
SetEditText var *fcontents
end
[/@loadInstalled]

#Function to save File. It handle exception on fileName to save or saveAs
[@save]
GetEditText
SetVar *newContent LASTRESULT
execute app/scripts/db_insNote.gcs 1
MessageBox Saved! Note saved!
end
[/@save]

#Just to quit app
[@close]
load home.ch
[/@close]

[events]
Control.s: @save
Control.S: @saveAs
Control.q: @close
Control.Q: @close
[/events]

#DYNAMIC PART OF THEME BUTTON
edit_text_color: white
edit_background: black
#END