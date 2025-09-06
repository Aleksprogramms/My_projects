#!/usr/bin/env python

"""
Utility classes for the document analysis lecture at the University of Konstanz.
"""
__author__      = "Maximilian T. Fischer"
__copyright__   = "Copyright 2020, DBVIS"

from wordcloud import WordCloud
import matplotlib.pyplot as plt

import os
import xml.etree.ElementTree as ET
import pandas as pd

FILEPATH_LOREM_IPSUM = 'data/lorem_ipsum.txt'
FILEPATH_DEBATES_XML = 'data/debates/'
FILEPATH_TV_CSV = 'data/tv/'

def read_lorem_ipsum_text():
    """Read in lorem ipsum text"""
    f = open(FILEPATH_LOREM_IPSUM, 'r');
    content = f.read()
    return content

def read_xml():
    """Read in xml files"""
    for i in os.listdir(FILEPATH_DEBATES_XML):
        tree = ET.parse(FILEPATH_DEBATES_XML + i)
        root = tree.getroot()
        return ET.dump(root)

# //TODO
def read_scv():
    for i in os.listdir(FILEPATH_TV_CSV):
        file = pd.read_csv(FILEPATH_TV_CSV + i)
        
    return file
    
def create_word_cloud(wordFrequencies, title):
    print(title + ':')
    wordcloud = WordCloud(width=800, height=400, max_words=None, min_font_size=0.01, max_font_size=100,  
                      background_color='white', random_state=42, 
                      #relative_scaling=1.0,
                      prefer_horizontal=1.0,
                      stopwords = [],
                      color_func=lambda *args, **kwargs: (30,30,30)).generate_from_frequencies(wordFrequencies)
    plt.figure(figsize=(16,6))
    plt.axis("off")
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.show()


print(read_scv())