# User Story 10
print("User Story 10:")
print("As a podcast creator, ")
print("I want to get data summary about types of podcasts that’s most favored by the audience, ")
print("so that I can understand my user groups. \n")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def mostPopularTopic():
    print("The query ranks the most popular podcats topics based on all listeners' stream time. ")
    print("Our Query: ")
    query = '''
        SELECT p.topic, SUM(l.listen_time)
          FROM Podcast AS p
               JOIN Listens AS l ON p.podcast_id = l.podcast_id
         GROUP BY p.topic
         ORDER BY SUM(l.listen_time) DESC '''

    print(query, "\n")
    cur.execute(query)    
    rows = cur.fetchall()
    table = PrettyTable(['topic', 'total listen time (in seconds)'])
    print("Most to least favored topics (popularity ranked based on stream time):")
    for row in rows:
        table.add_row(row)
    print(table)

mostPopularTopic()
print("\n")