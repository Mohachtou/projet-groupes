import streamlit as st
from PIL import Image
import pandas as pd
import numpy as np
import streamlit as st
from streamlit_option_menu import option_menu
import streamlit.components.v1 as html
from  PIL import Image
import numpy as np
import pandas as pd
from st_aggrid import AgGrid
import plotly.express as px
import io 
import altair as alt
from urllib.error import URLError
headerSection=st.container()
mainSection=st.container()
LeftNav=st.sidebar

############## left side la bare du menu ##############

with st.sidebar:
    choose = option_menu("Café innatendu", ["Recherche", "Home", "Idée sauvegardées", "Mes analyse", "Paramètres"],
                         icons=['search', 'house', 'joystick', 'graph-up','gear-fill'],
                         menu_icon="app-indicator", default_index=0,
                         styles={
        "container": {"padding": "5!important", "background-color": "#fafafa"},
        "icon": {"color": "orange", "font-size": "25px"}, 
        "nav-link": {"font-size": "16px", "text-align": "left", "margin":"0px", "--hover-color": "#eee"},
        "nav-link-selected": {"background-color": "#02ab21"},
    }
    
    )
    st.button('Nouvelle Analyse', key=None, help=None, on_click=None, args=None, kwargs=None,  type="secondary", disabled=False)
    ###################################################################################################



####################### titre et bare de recherche#####################
if choose =='Recherche':
    title = st.text_input('', '', placeholder='Recherche')

    st.subheader('Vos dernières idées sauvegardeées')  
######################################## notre data sets il va verier #########
    with st.container():
        df = pd.DataFrame(
    np.random.randn(3, 5),
    )
    df.columns={'Sauve','idée générés','NB Vidéo similaire','Score d interét', 'Score conccurentiel'}
    df.reset_index(drop=True)
    st.table(df)
    st.button('Afficher plus')

#################################le nouveau datasets il vas variée###########
    st.subheader('Vos dernières Analyses')  
    df = pd.DataFrame(
    np.random.randn(3, 5), 
    )
    df.columns={'Nom de l etude','Date d analyse','idée générées','idées sauvegardées', 'Top intrêt'}
    df.reset_index(drop=True)
    st.table(df)
    
###########################################choooosee#######################
elif choose=='Home': 
    st.markdown(""" <style> .font {
    font-size:30px ; font-family: 'Cooper Black'; color: black;} 
    </style> """, unsafe_allow_html=True)
    st.header('Bonjour A byte of code')
    st.write('idées générer selon les tendances d aujourd hui et les mots clés de votre chaine')

     
    HEADER = {
    "User-Agent": 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'
}

Titles = []
liste = []
images = []

def videos_channels ():
    Id = input("")
    videos = scrapetube.get_channel(Id)
    url = "https://www.youtube.com/watch?v="
    
    for video in videos:
    
        url1 = url + str(video["videoId"]) + "/videos"
        response = requests.get(url1, headers=HEADER)
        soup = BeautifulSoup(response.text, "html.parser")

        thumbSoupMeta = soup.find("meta", property="og:image")
        videoImage = thumbSoupMeta["content"] if thumbSoupMeta else "NotFound"
        videoImage = '<img src="'+ videoImage + '" width="60" >'
        
        yt = YouTube(url1)
        Titles.append(yt.title)
        liste.append(url1)
        images.append(videoImage)
        data1 = pd.DataFrame({'Titres': Titles[:10]})
        data2 = pd.DataFrame({'url': liste[:10]})
        data3 = pd.DataFrame({'image': images[:10]})
        new_data = data1.join(data2)
        data = new_data.join(data3)
       
    return (HTML(data.to_html(escape=False,formatters=dict(images=images))))
    
base = videos_channels()
base
    
    
    
    col1, col2= st.columns(2)
    with col1:
     st.subheader('The javascript framework... without any javascripts')
     image = Image.open('javascript-vs-php.jpg')
     st.image(image, caption='Sunrise by the mountains')
     
    with col2:
        st.subheader('Vos dernières analyses')
elif choose =='Mes analyse':
    st.subheader('Programation jeux videos')
    
    st.markdown(""" <style> .font {
    font-size:30px ; font-family: 'Cooper Black'; color: black;} 
    </style> """, unsafe_allow_html=True)
    df=pd.DataFrame(
        np.random.randn(7,5),
    )
    df.columns={'Sauv', 'idée générée','Nb vidéo similaire','Score d intêret','Score concurentiel'}
    st.table(df)
    
elif choose=='Paramètres':
    st.header('Général')
    st.write('Vous pouvez changer les mots clés relatifs à votre chaine , et gérer votre espace de travail')
    title = st.text_input('', '', placeholder='A Byte of Code')
    st.write('Le nom par défaut utilisé correspondant à celui de la chaine liée espace de travail')
    st.subheader('mots clés relatifs à votre chaine')
    



