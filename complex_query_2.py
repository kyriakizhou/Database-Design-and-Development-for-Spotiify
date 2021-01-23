#User story 4
print("\n")
print("User Story 4:")
print("As a subscriber, ")
print("I want to see the playlists of all of my friends, ")
print("so that I can see what my friends like.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def viewPlaylist(email):
    print("\n")
    print("This is a complex query that uses a JOIN on the friends table")
    print("in order to get the playlists of all the friends for a user")

    query = '''
        SELECT f.email2, p.name
          FROM Playlist AS p
               JOIN Friends AS f on p.email = f.email2
         WHERE f.email1=%s
        '''
    print(query)


    cur.execute(query, (email, ))
    rows = cur.fetchall()
    table = PrettyTable(['friend1_id', 'friend2_id'])
    if (len(rows) == 0): print("No friends found!")
    for row in rows:
        table.add_row(row)

    print("This is the result of finding all the playlists for the friends of the user with email abc@123.com")
    print(table)

viewPlaylist("abc@123.com") # hard coded in
print("\n")