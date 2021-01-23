# User Story 7
print("User Story 7:")
print("As an Artist, ")
print("I want my listeners to be able to review my songs, ")
print("so that I know what they truly feel when actually listening to my songs.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

# Search song function: 
def searchSong(song):

    print("\n")
    print("This is a simple query that selects the review and rating (out of 5) from the review table")
    print("in order to see all the reviews for any song (Note that each user is only allowed one review per song):")

    query = '''
    SELECT review, rating
      FROM Reviews AS r
     WHERE song_id = %s
    '''

    print(query)
    
    cur.execute(query, (song, ))          

    print("Search Result:")
    rows = cur.fetchall()
    table = PrettyTable(['review', 'rating'])

    if (len(rows) == 0): print("No Reviews for this song yet!")
    for row in rows:
        table.add_row(row)

    print("This is the result of finding all the reviews and their ratings where the song is Maybe Maybe.")
    print(table)

searchSong("41") # hard coded in
print("\n")