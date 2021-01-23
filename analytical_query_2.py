# User Story 9
print("User Story 9:")
print("As a podcast creator, ")
print("I want to get a gender ratio of my listeners, ")
print("so that I can understand my user groups.")

# Global Setup
import psycopg2 as pg2
from prettytable import PrettyTable
con = pg2.connect(database='spotify', user='isdb')  
con.autocommit = True
cur = con.cursor()

def totalAudience(title):
  total = -1
  query = '''
    SELECT count(l.email)
      FROM Listens AS l
           JOIN Podcast AS p ON l.podcast_id = p.podcast_id
    WHERE p.title = %s '''

  cur.execute(query, (title, ))
  rows = cur.fetchall()
  for row in rows:
    for n in row:
      total = n
  return total

def podcastGenderRatio(title):
  total = totalAudience(title)
  print("The query matches input podcast title with the title column of Podcats table. It joins Listens and Subscriber tables to get all listeners of the podcast and the gender info of each listender. It then groups by gender to display the gender distribution for the podcast with the input podcast title. \n")
  print("Our Query:")
  query = '''
    SELECT s.gender, COUNT(s. gender)
      FROM Subscriber AS s
      JOIN Listens AS l on s.email = l.email
      JOIN Podcast AS p on l.podcast_id = p.podcast_id
     WHERE p.title = %s
     GROUP BY s.gender
    '''
  print(query % title, "\n")
  cur.execute(query, (title, ))
  rows = cur.fetchall()
  table = PrettyTable(['gender', 'count'])

  for row in rows:
    gender = row[0]
    number = row[1]
    table.add_row(row)
  print("Gender distribution table summary: ")
  print(table, "\n")

  if (gender == 'M'):
    maleRatio = number / total
    femaleRatio = 1 - maleRatio
  elif (gender == 'F'):
    femaleRatio = number / total, 2
    maleRatio = 1 - femaleRatio, 2
  print("Analysis: for this podcast, male vs female is {:0.2f} vs {:0.2f}".format(maleRatio, femaleRatio))
    

print("\n") 
podcastGenderRatio("#1517 - Mariana Van Zeller") # hard coded in
print("\n") 
