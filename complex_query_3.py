#User story 6
print("User Story 6:")
print("As an Artist, ")
print("I want to find the artists who create similar music, ")
print("so that I can build a connection with other creators and learn from them.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def viewPlaylist(genre):
    print("\n")
    print("This is a complex query that uses multiple JOIN's on the tables between creator and song")
    print("in order to get the songs and their genres that match the genre they want to see:")

    query = '''
        SELECT c.name, s.title
        FROM Creator as c
             JOIN Artist AS a ON c.creator_id = a.artist_id
             JOIN Creates AS c2 ON a.artist_id = c2.artist_id
             JOIN Album AS a2 ON c2.album_id = a2.album_id
             JOIN Song AS s ON a2.album_id = s.album_id
        WHERE s.genre = %s
        '''
    print(query)
    
    cur.execute(query, (genre, ))
    rows = cur.fetchall()
    table = PrettyTable(['artist_name', 'title'])
    if (len(rows) == 0): print("No artists in that genre!")
    for row in rows:
        table.add_row(row)

    print("This is the result of finding all the songs and their artists where the song genre is pop.")
    print(table)

viewPlaylist("pop") # hard coded in
print("\n")