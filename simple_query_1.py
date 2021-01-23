# User Story 1
print("User Story 1:")
print("As a subscriber, ")
print("I want to search a song, ")
print("so that I can find more details about it. \n")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

# Search song function: 
def searchSong(song):
    print("The query matches the input song's title with table Song's title column. Then the query select corresponding row with information of song's title, genre, and duration. \n")
    print("Our Query:")
    query = '''
    SELECT title, genre, duration  
      FROM Song
     WHERE title = %s
    '''
    print(query % song, "\n")
    cur.execute(query, (song, )) 
    table = PrettyTable(['title', 'genre', 'duration(in seconds)'])         

    print("Search Result:")
    rows = cur.fetchall()
    if (len(rows) == 0): print("The song is currently not avaliable! We will work on it!")
    else: print("Search song with a title of", song, "\n")
    for row in rows:
        table.add_row(row)

    print(table)

searchSong("YEAH RIGHT")  # hard coded in
print("\n")