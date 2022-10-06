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

activity_data_wt = pd.melt(activity_data, id_vars=['activity','activity_type'], 
                            value_vars=['130lb', '155lb', '180lb', '205lb', 'Average Weight'],
                            var_name='Your Weight', value_name='Burnt Calorie')

# create a list of our conditions
conditions = [
    (activity_data_wt['Burnt Calorie'] <= 300),
    (activity_data_wt['Burnt Calorie'] > 300) & (activity_data_wt['Burnt Calorie'] <= 600),
    (activity_data_wt['Burnt Calorie'] > 600) & (activity_data_wt['Burnt Calorie'] <= 900),
    (activity_data_wt['Burnt Calorie'] > 900) & (activity_data_wt['Burnt Calorie'] <= 1200),
    (activity_data_wt['Burnt Calorie'] >1200 )]

# create a list of the values we want to assign for each condition
values = ['Low', 'Moderate', 'High', 'Very High', 'Extreme']

# create a new column and use np.select to assign values to it using our lists as arguments
activity_data_wt['Severity'] = np.select(conditions, values)


from dash import Dash, dcc, html, Input, Output
app = Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

server = app.server

def dropdown():
    return html.Div([dcc.Dropdown(id="dropdown",
                                  options=[{'label': i, 'value': i} for i in activity_data_wt["Your Weight"].unique()],
                                  value="Average Weight", style={"width": "50%"}, clearable=False)]
                    ,className="dropdown")


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

app.layout = dbc.Container([
                            dbc.Row([dbc.Col(html.Div([html.H2("Activities For Burning Calories", style={
                                      'textAlign': 'center','backgroundColor': colors['background'],'color': colors['text']},
                                                               className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(html.Div([html.H5('Select Your Weight-Choose Nearest Value', className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(dropdown())]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dbc.Row([dbc.Col(html.Div([html.H5('Select Your Favourite Activity', className="heading")]))]),
                            dbc.Row([dbc.Col(html.Div([html.P(" ")]))]),
                            dcc.Tabs(id="tabs-selector",
                                     value="tab-1",
                                     className="custom-tabs-container",
                                     colors={"border": "black","primary": "gold","background": "cornsilk"},
                                     style={'width': '100%','font-size': '80%','height': 'tab_height'},
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
                                     ]),
                                    ])


@app.callback([Output('graph_swimming', 'figure'),
               Output('graph_walking', 'figure'),
               Output('graph_cycling', 'figure'),
               Output('graph_dancing', 'figure'),
               Output('graph_climbing', 'figure'),
               Output('graph_children', 'figure'),
               Output('graph_others', 'figure')],
              [Input('dropdown', 'value')]) # , Input('tabs', 'value')
                                     
def update_graph(dropdown):
    df_swimming = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Swimming' )] 
    df_walking = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Walking' )] 
    df_cycling = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Cycling' )] 
    df_dancing = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Exercise or Dancing' )] 
    df_climbing = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Climbing or Hiking' )] 
    df_children = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Activities with Children' )] 
    df_others = activity_data_wt[(activity_data_wt["Your Weight"] == dropdown)  
                                   & (activity_data_wt["activity_type"] == 'Other Activities' )] 
    
    fig_swimming = px.bar(df_swimming, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Swimming or Water Sports Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_walking = px.bar(df_walking, y="activity", x="Burnt Calorie",color = 'Severity', 
                          title="Walking Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_cycling = px.bar(df_cycling, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Cycling Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_dancing = px.bar(df_dancing, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Dancing Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_climbing = px.bar(df_climbing, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Climbing or Hiking Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_children = px.bar(df_children, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Activities with Children for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    fig_others = px.bar(df_others, y="activity", x="Burnt Calorie", color = 'Severity',
                          title="Other Activities for Burning Calories in One Hour",
                        color_discrete_map={'Low':'green', 'Moderate':'lightblue', 
                                             'High':'brown','Very High':'darkcyan','Extreme':'Red'})
    return fig_swimming, fig_walking, fig_cycling, fig_dancing, fig_climbing, fig_children, fig_others

    
if __name__ == '__main__':
    app.run_server(debug = False)

