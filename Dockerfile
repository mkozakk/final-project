# 1. Wybieramy obraz bazowy z Pythonem
FROM python:3.11-slim

# 2. Ustawiamy katalog roboczy w kontenerze
WORKDIR /app

# 3. Kopiujemy plik z wymaganiami
COPY requirements.txt .

# 4. Instalujemy zależności
RUN pip install --no-cache-dir -r requirements.txt

# 5. Kopiujemy resztę aplikacji
COPY . .

# 6. Eksponujemy port, na którym działa FastAPI
EXPOSE 8000

# 7. Polecenie startowe uruchamiające serwer Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
