def input_validation():

  user_input = input()

  try:
      int_input = int(user_input)
      return int_input
  except ValueError:
      return user_input


def get_info():
  input = input_validation()
  connection = make_connection()
  result = []

  cursor = connection.cursor()
  cursor.execute("SELECT * FROM table")
  
  for i[0] in cursor.description:
    cursor.execute(f'SELECT * FROM table WHERE {i} = {input}')
    result.append(cursor.fetchall())

  for row in result:
    print(row)

  cursor.close()
  connection.close()
  return
