#!/usr/bin/env python
# coding: utf-8

# In[23]:

import pathlib
import pandas as pd
import dash
from dash import Dash, dcc, html, Input, Output, State, no_update
import dash_bootstrap_components as dbc
import plotly.express as px
import numpy as np


PATH = pathlib.Path(__file__).parent
DATA_PATH = PATH.joinpath("data").resolve()
activity_data = pd.read_csv(DATA_PATH.joinpath('activity_data.csv'))
calorie_data = pd.read_csv(DATA_PATH.joinpath('calorie_drinking.csv'))

activity_data_wt = pd.melt(activity_data, id_vars=['activity','activity_type'], 
                            value_vars=['130lb', '155lb', '180lb', '205lb', 'Average Weight'],
                            var_name='Your Weight', value_name='Burnt Calorie')

# create a list of our conditions
conditions1 = [
    (activity_data_wt['Burnt Calorie'] <= 300),
    (activity_data_wt['Burnt Calorie'] > 300) & (activity_data_wt['Burnt Calorie'] <= 600),
    (activity_data_wt['Burnt Calorie'] > 600) & (activity_data_wt['Burnt Calorie'] <= 900),
    (activity_data_wt['Burnt Calorie'] > 900) & (activity_data_wt['Burnt Calorie'] <= 1200),
    (activity_data_wt['Burnt Calorie'] >1200 )]

# create a list of the values we want to assign for each condition
values1 = ['Low', 'Moderate', 'High', 'Very High', 'Extreme']

# create a new column and use np.select to assign values to it using our lists as arguments
activity_data_wt['Severity'] = np.select(conditions1, values1)

conditions2 = [
    (calorie_data['Number of Standard Drinkings'] <= 5),
    (calorie_data['Number of Standard Drinkings'] > 5) & (calorie_data['Number of Standard Drinkings'] <= 10),
    (calorie_data['Number of Standard Drinkings'] > 10) & (calorie_data['Number of Standard Drinkings'] <= 20),
    (calorie_data['Number of Standard Drinkings'] > 20) & (calorie_data['Number of Standard Drinkings'] <= 27),
    (calorie_data['Number of Standard Drinkings'] >27)]

# create a list of the values we want to assign for each condition
values2 = ['Minimum Risk', 'Low Risk', 'Life-Time Risk ', 'Severe Life-Time Risk', 'Life-Time and Single Occasion Risk']

calorie_data['Risk Level'] = np.select(conditions2, values2)

df = calorie_data
df = df.loc[df['Activity'].isin(['Full/Mid-strength Beer','Low-strength Beer', 'Glass Wine','Bottle Wine'])]
df['Calorie'] = df['Drink Quantity'] * df['Calorie in Alcohol']
df.rename(columns = {'Activity':'Drink Type'}, inplace=True)

df_calorie = df.loc[df['Drink Quantity']==1]
df_calorie = df_calorie[['Drink Type','Number of Standard Drinkings']]
df_calorie


from dash import Dash, dcc, html, Input, Output
app = Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

server = app.server


def dropdown2():
    return html.Div([dcc.Dropdown(id="dropdown2",
                                  options=[{'label': i, 'value': i} for i in df["Drink Quantity"].unique()],
                                  value=1, style={"width": "30%"}, clearable=False)]
                    ,className="dropdown")

def radioitem1():
    return html.Div([dcc.RadioItems(id="radioitem1",
                    options=[{'label': i, 'value': i} for i in df["Drink Type"].unique()], 
                    value="Full/Mid-strength Beer",
                    inputStyle={"margin-right": "20px","margin-left": "20px", "font-size":'50px'})])

def graph3():
    return dcc.Graph(id="graph3",style={'width': '95vh', 'height': '95vh'})

def graph4():
    return dcc.Graph(id="graph4", style={'width': '95vh', 'height': '95vh'})

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}
tab_height = '5vh'

app.layout = dbc.Container([
                            dbc.Row([dbc.Col(html.Div([html.H2("Understanding Your Calorie Intake By Drinking Alcohols", style={
                                      'textAlign': 'center','backgroundColor': colors['background'],'color': colors['text']},
                                                               className="heading")]))]),
                            
                            dbc.Row([
                                dbc.Col([dbc.Row([dbc.Col(html.Div([html.H5('Select Your Drinks Quantiy', className="heading")]))]),
                                         dbc.Row([dbc.Col(dropdown2())]), 
                                         dbc.Row([dbc.Col(html.Div([html.P(" ")]))])
                                         ],width=4),
                                dbc.Col([dbc.Row([dbc.Col(html.Div([html.H5('Select Your Favourite Drinks', className="heading")]))]),
                                        dbc.Row([dbc.Col(radioitem1())]),
                                        dbc.Row([dbc.Col(html.Div([html.P(" ")]))]) 
                                        ],width=8)
                                        ]),
                            
                            dbc.Row([
                                dbc.Col(html.Div([graph3(), html.Br()]),width=4),
                                dbc.Col(html.Div([graph4(), html.Br()]),width=8)
                                ]),
                            
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                                       ])
                                    


@app.callback([
               Output('graph3', 'figure'),
               Output('graph4', 'figure')],
              [Input('dropdown2', 'value'), 
              Input('radioitem1', 'value')])

def update_graph(dropdown2, radioitem1):
 
    df_energy1 = df[(df["Drink Quantity"] == dropdown2)]
    df_energy2 = df[(df["Drink Type"] == radioitem1)]
 
    fig3 = px.bar(df_energy1, x="Drink Type", y="Calorie", color ="Calorie Level",
                    color_discrete_map={'Low':'yellow', 'Moderate':'lightblue','High':'lightgreen',
                                        'Very High':'orange', 'Extreme':'brown'})
    fig3.update_layout(template = 'plotly_dark', title = dict(text ="Calorie Intake For Drinking Alcohols" ,x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 25),
               font = dict(size = 12, family = 'Verdana'),
               hovermode = 'closest',
               width  = 450, height = 650)
    fig3.update_layout(legend=dict(
         orientation="h",
        yanchor="bottom",
        y= 0.9,
        xanchor="right",
        x= 1.01 ))
    

    fig4 = px.scatter_3d(df_energy2, 
        y='Drink Quantity', x='Number of Standard Drinkings', z='Calorie', 
        color="Calorie Level", 
        color_discrete_map={'Low':'yellow', 'Moderate':'lightblue','High':'lightgreen',
                                        'Very High':'orange', 'Extreme':'brown'},
        labels={
                     "Drink Quantity": "Drink Quantity",
                     "Number of Standard Drinkings": "Standard Drinks",
                     "Calorie in Alcohol": "Calorie"
                 },
                title="Manually Specified Labels"
                )

    fig4.update_layout(template = 'plotly_dark', title = dict(text =
    "Calorie Intake by Drinking Quantity & Standard Drinks " ,x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 25),
               font = dict(size = 12, family = 'Verdana'),
               hovermode = 'closest',
               width  = 850, height = 650,
               margin=dict(l=30, r=0, t=20, b=20),
               scene_zaxis_type="log"
               )
    fig4.update_layout(legend=dict(
         orientation="h",
        yanchor="top",
        y= 0.0,
        xanchor="left",
        x= 0.15 ))


    return fig3, fig4

if __name__ == '__main__':
    app.run_server(port = 8050)

# %%

#['Low', 'Moderate', 'High', 'Very High', 'Extreme']
 # , color_discrete_map={'Low':'yellow', 'Moderate':'lightblue','High':'lightgreen','Very High':'red', 'Extreme':'brown'})