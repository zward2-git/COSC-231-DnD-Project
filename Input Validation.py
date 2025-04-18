def input_validation():
  user_input = input().strip()

  try:
      int_input = int(user_input)
      return int_input
  except ValueError:
      return f"%{user_input.lower()}%"

'''
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
      results = cursor.fetchall()
  
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
'''

#will likely need to customize one per table for efficiency
#have a list of column names prepared and combine them into one query

def get_info_equipment():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'type', 'description', 'weight', 'cost', 'tags']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([f'%{user_input}%' for column in column_names])
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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

def get_info_armor_shields():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'type', 'name', 'AC', 'strength', 'stealth', 'weight', 'cost', 'don_time', 'doff_time']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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

def get_info_weapons():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'type', 'cost', 'damage', 'weight', 'properties']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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

def get_info_consumables():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'effect', 'duration', 'value', 'uses', 'restores', 'rarity']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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

def get_info_monsters():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'size', 'type', 'alignment', 'armor_class', 'armor_type', 'hit_points', 'hit_dice', 'hit_points_roll', 'speed_walk', 
                    'strength', 'dexterity', 'constitution', 'intelligence', 'wisdom', 'charisma', 'saving_throws', 'damage_vulnerabilities', 
                    'damage_resistances', 'damage_immunities', 'condition_immunities', 'darkvision', 'passive_perception', 'languages', 'challenge_rating',
                    'proficiency_bonus', 'xp', 'special_abilities', 'actions', 'legendary_actions', 'image_url']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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

def get_info_spells():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'level', 'school', 'casting_time', 'range', 'duration', 'description', 'components',
                    'concentration', 'ritual', 'attack_type', 'damage', 'higher_level', 'classes', 'subclasses']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
    if result:
      return results
    else:
      print("No matching records found.")

  except:
    print("An error occurred")

  finally:
    cursor.close()
    connection.close()

def get_info_magic_items():

  try:
    user_input = input_validation()
    connection = make_connection()
    result = []
  
    cursor = connection.cursor()
    column_names = ['id', 'name', 'category', 'rarity', 'description', 'image_url']
    
    #combine all queries into one
    query = " OR ".join(f'{column} LIKE %s' for column in column_names)
    full_query = f"SELECT * FROM table WHERE {query}"
    column_parameters = tuple([user_input] * len(column_names))
    
    cursor.execute(full_query, column_parameters)
    results = cursor.fetchall()
  
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
