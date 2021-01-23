# User Story 2
print("User Story 2:")
print("As a subscriber, ")
print("I want to see all my playlists'titles, ")
print("so that I know what playlists I have created in the past. \n")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def viewPlaylist(email):
    print("The query matches the email column of table Playlist with the input email, and it selects the ids and names of the playlists built by the user with the input email. \n")
    print("Our Query:")
    query = '''
        SELECT p.playlist_id, p.name 
          FROM Playlist AS p
         WHERE p.email = %s
        '''
    print(query % email, "\n")
    cur.execute(query, (email, ))
    rows = cur.fetchall()
    table = PrettyTable(['playlist_id', 'name'])

    if (len(rows) == 0): print("You haven't created any playlist yet!")
    else: print("Playlist created under email", email,": \n")
    for row in rows:
        table.add_row(row)

    print(table) 


viewPlaylist("abc@123.com") # hard coded in
print("\n")