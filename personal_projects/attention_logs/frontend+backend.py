from flask import Flask, request, render_template, redirect, url_for 
from datetime import datetime
from pathlib import Path
import atexit, signal, sys
import pandas as pd 
# Excel Settings
SAVE_DIR = Path("data")              
COLUMNS  = ["date", "time", "name", "fname"]

app = Flask(__name__)
SAVE_DIR.mkdir(parents=True, exist_ok=True)


session_start = datetime.now().strftime("%Y-%m-%d_%H-%M-%S") # Current date/time
log_file = SAVE_DIR / f"Unterricht_{session_start}.xlsx" # Path for log_files

all_data = []  #buffer for file saving

def save_now(): # Crash/Stop sabing
    if not all_data:
        return
    if True: 
        df = pd.DataFrame(all_data, columns=COLUMNS) 
        df.to_excel(log_file, index=False)
    
    print(f"[SAVE] Saved {len(all_data)} rows to {log_file}")

def handle_exit(*_):
    try:
        save_now()
    finally:
        sys.exit(0)

# Checker if server/program was stoped

atexit.register(save_now)
signal.signal(signal.SIGINT, handle_exit)   
signal.signal(signal.SIGTERM, handle_exit)  

# main for Flask

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        now = datetime.now()
        row = {
            "date": now.strftime("%Y-%m-%d"),
            "time": now.strftime("%H:%M:%S"),
            "name": request.form.get("name", "").strip(),
            "fname": request.form.get("fname", "").strip(),
        }
        all_data.append(row)
        return redirect(url_for("index"))
    return render_template("index.html", all_data=all_data, session_start=session_start, log_file=log_file)

# Settings for server start

if __name__ == "__main__":
    from waitress import serve
    app.run(host="0.0.0.0", port=5000, debug=True) #local
    serve(host="0.0.0.0", port=5000, debug=True) #cloudflare
