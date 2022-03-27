sx, sy = guiGetScreenSize()
gui = {}

gui[1] = guiCreateWindow(sx / 2 - 150, sy / 2 - 95, 300, 190, "Helikopter", false)
gui[2] = guiCreateLabel(20, 30, 260, 45, "Hey! Vice City'de bir binadaki patlamanın\nhikayesini hatırlıyor musunuz?\nBelki tekrar ederiz?", false, gui[1])
gui[3] = guiCreateButton(20, 80, 260, 40, "Başlat!", false, gui[1])
gui[4] = guiCreateButton(20, 130, 260, 40, "Kapat", false, gui[1])

guiSetVisible(gui[1], false)