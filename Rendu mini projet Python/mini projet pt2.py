#nous avons effectuer avec glory le travail sur mon ordinateur 
#le siens ne fonctionnait pas.
#Glory etant totalement novice au code j'ai essayer avec mes moyens de lui expliquer ce que nous avons écrit ensemble. 
import os
from moviepy.editor import *
from moviepy import *

script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)


images= "images_picsum"
audio=os.path.join("petite_musique.mp3")
diapo= "diaporama.mp4"
image2=[]

liste_images=[]
liste_images = os.listdir(images)
nbImages = len(liste_images)

for i in range(0, nbImages) :
    fichier = liste_images[i]
    if fichier.lower().endswith(('.jpg', '.jpeg', '.png')):
        chemin_image = os.path.join(images, fichier)
        image2.append(chemin_image)

if not os.path.exists(diapo):
    clips = []
    for img in image2:
        clip=ImageClip(img).with_duration(2)
        clips.append(clip)
#je n'ai pas pu faire fonctionner les lignes de codes suivantes 
    diapo= concatenate_videoclips(clips)
    
    audio_background= AudioFileClip(audio)
    diapo= diapo.with_audio(audio_background)
    diapo.write_videofile(diapo)
    
