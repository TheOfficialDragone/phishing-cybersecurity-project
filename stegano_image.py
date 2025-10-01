# File 1: stegano_image.py
# Questo script codifica l'indirizzo IP del server C2 nell'immagine
from stegano import lsb

def encode_ip_to_image(image_path, ip, output_path):
    encoded_image = lsb.hide(image_path, ip)
    encoded_image.save(output_path)

def decode_ip_from_image(image_path):
    return lsb.reveal(image_path)

if __name__ == "__main__":
    ip = "10.211.55.5:5000"  # Indirizzo IP del server C2
    encode_ip_to_image("Gattino.png", ip, "encoded_image.png")

    print("IP codificato nell'immagine con successo!")

    # Per verificare:
    print("ip presente all'interno dell'immagine:",decode_ip_from_image("encoded_image.png"))