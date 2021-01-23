# User Story 3
print("User Story 3:")
print("As a subscriber, ")
print("I want to view all songs in an album, ")
print("so that I can hear them all. \n")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def songInAlbum(album):
    print("The query matches the input album name with name column of Album table. The query joins the Album table with the Song table, and select the id, title, and duration information of the song that lives in the input album. \n")
    print("Our Query:")
    query = '''
    SELECT s.song_id, s.title, s.duration  
      FROM Song AS s
           JOIN Album AS a ON s.album_id = a.album_id
     WHERE a.name = %s
    '''
    print(query % album, "\n")
    cur.execute(query, (album, ))
    rows = cur.fetchall()
    table = PrettyTable(['song_id', 'title', 'duration (in seconds)'])

    if (len(rows) == 0): print("There's no documented song under this album!")
    else: print("Album", album, "includes songs: ")
    print("\n")
    for row in rows:
      table.add_row(row)

    print(table) 

songInAlbum("BALLADS 1") # hard coded in
print("\n")