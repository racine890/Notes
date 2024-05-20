import tkinter as tk
import os
from ch2 import ch_data as chd

def update_text(text_widget):

	font_size = chd('font_size', 'Config.ch', alt=13)
	font = chd('font', 'Config.ch', alt='Helvetica')

	if not hasattr(text_widget, 'image_references'):
		text_widget.image_references = []

	text_widget.tag_configure("bold", font=("Helvetica", font_size, "bold"))
	text_widget.tag_configure("strike", overstrike=True)
	text_widget.tag_configure("h1", font=("Helvetica", font_size*2, "bold"), foreground=chd('title_color', 'Config.ch', alt='#A3FFAF', comment=True))
	text_widget.tag_configure("h2", font=("Helvetica", font_size+5, "bold"))
	text_widget.tag_configure("highlight", background=chd('highlight_color', 'Config.ch', alt='#860CAA', comment=True))

	content = text_widget.get("1.0", "end-1c")
	lines = content.split('\n')

	for line_number, line in enumerate(lines, start=1):
		if len(line)!=0 and line[0] == '.':
			text_widget.delete(str(line_number)+'.0', str(line_number)+'.1')
			text_widget.tag_add("h1", str(line_number)+'.0', str(line_number+1)+'.0')
		elif len(line)!=0 and line[0] == ',':
			text_widget.delete(str(line_number)+'.0', str(line_number)+'.1')
			text_widget.tag_add("h2", str(line_number)+'.0', str(line_number+1)+'.0')
		elif len(line)!=0 and line[0] == ';':
			text_widget.delete(str(line_number)+'.0', str(line_number)+'.1')
			text_widget.tag_add("highlight", str(line_number)+'.0', str(line_number+1)+'.0')
		elif len(line)!=0 and line[0] == '=':
			text_widget.delete(str(line_number)+'.0', str(line_number+1)+'.0')
			if os.path.exists(line[1:].strip()):
				image = tk.PhotoImage(file=line[1:].strip())
				text_widget.image_create(str(line_number)+'.0', image=image)
				text_widget.image_references.append(image)
				text_widget.insert(str(line_number)+'.1', '\n')

def find_in(el, collection):
	for one in collection:
		if one in el.lower():
			return True
	return False

def specialIcon(folderName):
	folderIcon = 'folder'
	if find_in(folderName, ('apple', 'mac', 'iphone')):
		folderIcon = 'folder-apple'
	elif find_in(folderName, ('backup', 'save', 'recover', 'sauvegarder')):
		folderIcon = 'folder-backup'
	elif find_in(folderName, ('code', 'web', 'html', 'balise')):
		folderIcon = 'folder-code'
	elif find_in(folderName, ('config', 'param', 'setting')):
		folderIcon = 'folder-config'
	elif find_in(folderName, ('php')):
		folderIcon = 'folder-php'
	elif find_in(folderName, ('python', 'py')):
		folderIcon = 'folder-python'
	elif find_in(folderName, ('ubuntu', 'linux', 'debian')):
		folderIcon = 'folder-ubuntu'
	elif find_in(folderName, ('windows', 'microsoft', 'win32')):
		folderIcon = 'folder-windows'
	return 'app/res/'+folderIcon+'.png'

def htmlParseFormat(text):
	ntext = '<style>h1{color: red;} span{background-color: yellow;}</style>'
	for line in text.split('\n'):
		nline = ''
		if len(line) != 0 and line[0] == '.':
			nline = '<h1>'+line[1:].strip()+'</h1>'
		elif len(line) != 0 and line[0] == ',':
			nline = '<h3>'+line[1:].strip()+'</h3>'
		elif len(line) != 0 and line[0] == '=':
			nline = '<img src="'+line[1:].strip()+'"/><br/>'
		elif len(line) != 0 and line[0] == ';':
			nline = '<span>'+line[1:].strip()+'</span><br/>'
		else:
			nline = line+'<br/>'
		ntext += nline
	return ntext