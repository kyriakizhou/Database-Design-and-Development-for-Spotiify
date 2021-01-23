# User Story 8
print("User Story 8:")
print("As a Podcast Creator, ")
print("I want my audience to be able to comment on my content, ")
print("so that I can receive verbal feedback about my content.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def insertIntoComments(comment_id, email, podcast_id, comment, rating):

    print("\n")
    print("This is a simple query that inserts into the comment table a new comment")

    query = '''
        INSERT INTO Comments (comment_id, email, podcast_id, comment, rating)
               VALUES ((%s),(%s),(%s),(%s),(%s));
        '''
    print(query)


    
    cur.execute(query, (comment_id, email, podcast_id, comment, rating ))

def displayComments():
    print("This is a simple query that shows new comment in the comment table along with the rest of the comments")

    query = '''
    SELECT *
    FROM Comments
    '''
    print(query)

    print("All Comments:")
    cur.execute(query)          
    rows = cur.fetchall()
    table = PrettyTable(['comment_id', 'subscriber_email', 'podcast_id', 'comment', 'rating'])
    for row in rows:
        table.add_row(row)
    print(table)

print("\n")
print('THIS IS BEFORE THE NEW COMMENT IS ADDED BY USER abc')
print("\n")
displayComments()
insertIntoComments("86", "abc@123.com", 22, "I loved it", 5)
print("\n")
print('THIS IS AFTER THE NEW COMMENT IS ADDED BY USER abc')
print("\n")
displayComments()
print("\n")