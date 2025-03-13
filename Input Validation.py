def input_validation():
  user_input = input().strip()

  try:
      int_input = int(user_input)
      return int_input
  except ValueError:
      return f"%{user_input.lower()}%"


def get_info():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM table LIMIT 1")
    column_names = [desc[0] for desc in cursor.description]
    
    for column in column_names:
      query = f"SELECT * FROM table WHERE {column.lower()} LIKE %s"
      cursor.execute(query, (user_input,))
      result.append(cursor.fetchall())
  
    if result:
      for row in result:
        print(row)
    else:
      print("No matching records found.")

  except:
    print("An error occurred")

  finally:
    cursor.close()
    connection.close()
    
  return

#will likely need to customize one per table for efficiency
#have a list of column names prepared and combine them into one query
