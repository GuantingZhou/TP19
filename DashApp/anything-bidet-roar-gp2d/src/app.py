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
values = ['Low', 'Moderate', 'High', 'Very High', 'Extreme']

# create a new column and use np.select to assign values to it using our lists as arguments
activity_data_wt['Severity'] = np.select(conditions1, values)

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
df.rename(columns = {'Activity':'Drink'}, inplace=True)

df_calorie = df.loc[df['Drink Quantity']==1]
df_calorie = df_calorie[['Drink','Number of Standard Drinkings']]
df_calorie


from dash import Dash, dcc, html, Input, Output
app = Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

server = app.server

def dropdown1():
    return html.Div([dcc.Dropdown(id="dropdown1",
                                  options=[{'label': i, 'value': i} for i in activity_data_wt["Your Weight"].unique()],
                                  value="Average Weight", style={"width": "50%"}, clearable=False)]
                    ,className="dropdown")

def dropdown2():
    return html.Div([dcc.Dropdown(id="dropdown2",
                                  options=[{'label': i, 'value': i} for i in df["Drink Quantity"].unique()],
                                  value=1, style={"width": "30%"}, clearable=False)]
                    ,className="dropdown")

def radioitem1():
    return html.Div([dcc.RadioItems(id="radioitem1",
                    options=[{'label': i, 'value': i} for i in df["Drink"].unique()], 
                    value="Full/Mid-strength Beer",
                    inputStyle={"margin-right": "20px","margin-left": "20px", "font-size":'50px'})])

def graph1():
      return dcc.Graph(id="graph1")

def graph2():
      return dcc.Graph(id="graph2")

def graph3():
    return dcc.Graph(id="graph3")

def graph4():
    return dcc.Graph(id="graph4")

def graph_swimming():
    return dcc.Graph(id="graph_swimming")

def graph_walking():
    return dcc.Graph(id="graph_walking")

def graph_cycling():
    return dcc.Graph(id="graph_cycling")

def graph_dancing():
    return dcc.Graph(id="graph_dancing")

def graph_climbing():
    return dcc.Graph(id="graph_climbing")

def graph_children():
    return dcc.Graph(id="graph_children")

def graph_others():
    return dcc.Graph(id="graph_others")

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}
tab_height = '5vh'

app.layout = dbc.Container([dbc.Row([dbc.Col(html.Div([html.H2("Understanding Your Drinking Level", style={
                                      'textAlign': 'center','backgroundColor': colors['background'],'color': colors['text']},
                                                               className="heading")]))]),
                            dbc.Row([
                                dbc.Col(html.Div([graph1(), html.Br()]),width=8),
                                dbc.Col(html.Div([graph2(), html.Br()]),width=4)
                                ]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),

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
                            
                            dbc.Row([dbc.Col(html.Div([html.H2("Activities For Burning Calories", style={
                                      'textAlign': 'center','backgroundColor': colors['background'],'color': colors['text']},
                                                               className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(html.Div([html.H5('Select Your Weight-Choose Nearest Value', className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(dropdown1())]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                           
                            dbc.Row([dbc.Col(html.Div([html.H5('Select Your Favourite Activity', className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dcc.Tabs(id="tabs-selector",
                                     value="tab-1",
                                     className="custom-tabs-container",
                                     colors={"border": "blue","primary": "gold","background": "lightblue"},
                                     style={'width': '100%','font-size': '100%','height': 'tab_height'},
                                     children=[
                                                dcc.Tab(label="Swimming",
                                                        value="tab-1",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_swimming(), 
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Walking",
                                                        value="tab-2",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_walking(),
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Cycling",
                                                        value="tab-3",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_cycling(),
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Exercise/Dancing",
                                                        value="tab-4",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_dancing(),
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Hiking/Climbing",
                                                        value="tab-5",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_climbing(),
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Activities with Children",
                                                        value="tab-6",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_children(),
                                                                            html.Br()]),
                                                                 ]),
                                                dcc.Tab(label="Others",
                                                        value="tab-7",
                                                        className="custom-tab",
                                                        style={'padding': '0','line-height': tab_height},
                                                        selected_style={'padding': '0','line-height': tab_height},
                                                        children=[html.Div([graph_others(),
                                                                            html.Br()]),
                                                                 ]),
                                       ])
                                    ])


@app.callback([Output('graph1', 'figure'),
               Output('graph2', 'figure'),
               Output('graph3', 'figure'),
               Output('graph4', 'figure'),
               Output('graph_swimming', 'figure'),
               Output('graph_walking', 'figure'),
               Output('graph_cycling', 'figure'),
               Output('graph_dancing', 'figure'),
               Output('graph_climbing', 'figure'),
               Output('graph_children', 'figure'),
               Output('graph_others', 'figure')],
              [Input('dropdown1', 'value'),
              Input('dropdown2', 'value'), 
              Input('radioitem1', 'value')])

def update_graph(dropdown1, dropdown2, radioitem1):
    df_swimming = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Swimming' )] 
    df_walking = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Walking' )] 
    df_cycling = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Cycling' )] 
    df_dancing = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Exercise or Dancing' )] 
    df_climbing = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Climbing or Hiking' )] 
    df_children = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Activities with Children' )] 
    df_others = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown1)  
                                   & (activity_data_wt["activity_type"] == 'Other Activities' )] 
    df_energy1 = df[(df["Drink Quantity"] == dropdown2)]
    df_energy2 = df[(df["Drink"] == radioitem1)]
    

    fig1 = px.scatter(df, x="Drink Quantity", y="Number of Standard Drinkings",
                  color="Risk Level", size = "Number of Standard Drinkings", #symbol= "Number of Standard Drinkings",
                 facet_col="Drink", title = "Standard Drinkings for Various Quantity of Drinkings ") # size = "Number of Standard Drinkings",
    
    fig1.update_layout(legend=dict(
     orientation="h",yanchor="bottom", y=1.06,
     xanchor="right",x= 1.01 ))

    fig1.update_layout(template = 'plotly_dark', title = dict(x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 20),
                  font = dict(size = 11, family = 'Verdana'),
               hovermode = 'closest',
               width  = 880, height = 500)
    fig1.for_each_annotation(lambda a: a.update(text=a.text.split("=")[1]))

    fig2 = px.bar(df_calorie, x="Drink", y="Number of Standard Drinkings", text_auto=True)
    fig2.update_layout(template = 'plotly_dark', title = dict(text ="Standard Drink Number for Each Quantity" ,x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 20),
               font = dict(size = 10, family = 'Verdana'),
               hovermode = 'closest',
               width  = 415, height = 500)

    fig3 = px.bar(df_energy1, x="Drink", y="Calorie", color ="Calorie Level")
    fig3.update_layout(template = 'plotly_dark', title = dict(text ="Calorie Intake For Drinking Alcohols" ,x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 20),
               font = dict(size = 10, family = 'Verdana'),
               hovermode = 'closest',
               width  = 500, height = 500)
    fig3.update_layout(legend=dict(
         orientation="h",
        yanchor="bottom",
        y= 0.9,
        xanchor="right",
        x= 1.01 ))
    

    fig4 = px.scatter_3d(df_energy2, 
        x='Drink Quantity', y='Number of Standard Drinkings', z='Calorie in Alcohol',
        color="Calorie Level", labels={
                     "Drink Quantity": "Drink Quantity",
                     "Number of Standard Drinkings": "Standard Drinks",
                     "Calorie in Alcohol": "Calorie"
                 },
                title="Manually Specified Labels")

    fig4.update_layout(template = 'plotly_dark', title = dict(text =
    "Calorie Intake by Drinking Quantity & Standard Drinks " ,x = 0.5, y = 0.95),
               title_font= dict(family = 'Arial', size = 20),
               font = dict(size = 10, family = 'Verdana'),
               hovermode = False,
               width  = 850, height = 500)
    fig4.update_layout(
    margin=dict(l=20, r=30, t=20, b=20))

    fig_swimming = px.bar(df_swimming, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Swimming or Water Sports Activities for Burning Calories in One Hour",
                         color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_swimming.update_layout(template = 'plotly_dark',
              title = dict(x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_walking = px.bar(df_walking, y="activity", x="Burnt Calorie",color = 'Severity', 
                          title="Walking Activities for Burning Calories in One Hour",
                         color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_walking.update_layout(template = 'plotly_dark',
              title = dict(x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_cycling = px.bar(df_cycling, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Cycling Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_cycling.update_layout(template = 'plotly_dark',
              title = dict(
              x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_dancing = px.bar(df_dancing, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Dancing Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_dancing.update_layout(template = 'plotly_dark',
              title = dict(
              x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_climbing = px.bar(df_climbing, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Climbing or Hiking Activities for Burning Calories in One Hour",
                         color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_climbing.update_layout(template = 'plotly_dark',
              title = dict(
              x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_children = px.bar(df_children, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Activities with Children for Burning Calories in One Hour",
                         color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_children.update_layout(template = 'plotly_dark',
              title = dict(
              x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)
    
    fig_others = px.bar(df_others, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Other Activities for Burning Calories in One Hour",
                       color_discrete_map={'Low':'green', 'Moderate':'light blue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})

    fig_others.update_layout(template = 'plotly_dark',
              title = dict(
              x = 0.5, y = 0.95),
              title_font= dict(family = 'Arial', size = 20),
              font = dict(size = 10, family = 'Verdana'),
              hovermode = False,
              width  = 1295, height = 500)

    return fig1, fig2, fig3, fig4, fig_swimming, fig_walking, fig_cycling, fig_dancing, fig_climbing, fig_children, fig_others

    
if __name__ == '__main__':
    app.run_server(port = 8050)

# %%
