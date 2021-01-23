#User story 5
print("\n")
print("User Story 5:")
print("As an Artist, ")
print("I want to know where my listeners are from, ")
print("so that I can see where my music is most enjoyed.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def viewPlaylist(name):

    print("\n")
    print("This is a complex query that uses multiple JOIN's on the tables between creator and subscriber")
    print("in order to get the regions of all the subscribers who have listened to any song by the artist:")

    query = '''
        SELECT s.region, COUNT(s.region)
          FROM Subscriber AS s
               JOIN Streams AS s2 ON s.email = s2.email
               JOIN Song AS s3 ON s2.song_id = s3.song_id
               JOIN Album AS a ON s3.album_id = a.album_id
               JOIN Creates AS c ON a.album_id = c.album_id
               JOIN Artist AS a2 ON c.artist_id = a2.artist_id
               JOIN Creator AS c2 ON a2.artist_id = c2.creator_id
         WHERE c2.name = %s
         GROUP BY s.region
        '''

    print(query)
    
    cur.execute(query, (name, ))
    rows = cur.fetchall()
    table = PrettyTable(['name', 'region'])
    if (len(rows) == 0): print("No listeners found!")
    for row in rows:
        table.add_row(row)

    print("This is the result of finding all the subscribers and where they are from for the artist Joji.")
    print(table)

viewPlaylist("Joji") # hard coded in
print("\n")