from flask import Flask, abort, redirect, render_template, request, send_from_directory, url_for

app = Flask(__name__)

DEPOSIT_METHODS = {
    1: {
        "title": "USDT (TON)",
        "currency": "USDT",
        "network": "USDT (TON)",
        "address": "DEMO_ONLY_NOT_A_REAL_ADDRESS",
        "minimum": "50.00 USD",
        "maximum": "2000.00 USD",
        "minimum_amount": 50,
        "maximum_amount": 2000,
        "rate": "1.00 USDT",
    },
    4: {
        "title": "Binance",
        "currency": "ETH",
        "network": "ETH",
        "address": "DEMO_ONLY_NOT_A_REAL_ADDRESS",
        "minimum": "2000.00 USD",
        "maximum": "1000000.00 USD",
        "minimum_amount": 2000,
        "maximum_amount": 1000000,
        "rate": "0.00 ETH",
    },
    5: {
        "title": "Binance",
        "currency": "USDT",
        "network": "USDT",
        "address": "DEMO_ONLY_NOT_A_REAL_ADDRESS",
        "minimum": "50.00 USD",
        "maximum": "1000000.00 USD",
        "minimum_amount": 50,
        "maximum_amount": 1000000,
        "rate": "0.00 USDT",
    },
}

WITHDRAW_METHODS = {
    7: {
        "currency": "USDT",
        "gateway": "USDT (TRC 20)",
        "address_label": "Enter Your (TRC 20) Address",
        "minimum": 5,
        "rate": 1.0,
        "rate_text": "1.00 USDT",
        "fee_percent": 0,
    },
    8: {
        "currency": "USDT",
        "gateway": "USDT (BEP20)",
        "address_label": "Enter Your (BEP20) Address",
        "minimum": 5,
        "rate": 1.0,
        "rate_text": "1.00 USDT",
        "fee_percent": 0,
    },
    9: {
        "currency": "INR",
        "gateway": "Google Pay",
        "address_label": "Enter Your UPI ID",
        "minimum": 5,
        "rate": 0,
        "rate_text": "0.00 INR",
        "fee_percent": 0,
    },
}

TRADING_ASSETS = {
    "USDT": {"name": "TetherUS", "price": 1.0002},
    "BTC": {"name": "Bitcoin / TetherUS", "price": 79974.01},
    "ETH": {"name": "Ethereum / TetherUS", "price": 2720.35},
    "ALGO": {"name": "ALGO / TetherUS", "price": 0.09503},
    "XRP": {"name": "XRP / TetherUS", "price": 1.4187},
    "ADA": {"name": "Cardano / TetherUS", "price": 0.2209},
    "MATIC": {"name": "Polygon / TetherUS", "price": 0.3794},
    "DOGE": {"name": "Dogecoin / TetherUS", "price": 0.0911},
}

@app.route("/public/<path:filename>")
def public_file(filename):
    return send_from_directory("public", filename)

@app.route("/logo/<path:filename>")
def logo_file(filename):
    return send_from_directory("public/logo", filename)

@app.route("/")
def hello_world():
    return render_template("index.html", title="Hello")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        return redirect(url_for("dashboard"))
    return render_template("login.html")

@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        return redirect(url_for("dashboard"))
    return render_template("signup.html")

@app.route("/dashboard")
def dashboard():
    return render_template("dashboard.html")

@app.route("/markets")
def markets():
    return render_template("markets.html")

@app.route("/trading/<symbol>")
def trading(symbol):
    symbol = symbol.upper()
    asset = TRADING_ASSETS.get(symbol)
    if asset is None:
        abort(404)
    return render_template("trading.html", symbol=symbol, asset=asset)

@app.route("/bot-trade")
def bot_trade():
    return render_template("bot-trade.html")

@app.route("/wallets")
def wallets():
    return render_template("wallets.html")

@app.route("/help-and-support")
def help_support():
    return render_template("help-support.html")

@app.route("/deposit")
def deposit_methods():
    return render_template("deposit-methods.html")
    
@app.route("/withdraw")
def withdraw_methods():
    return render_template("withdraw-methods.html")

@app.route("/withdraw/confirm/<int:method_id>")
def withdraw_confirm(method_id):
    method = WITHDRAW_METHODS.get(method_id)
    if method is None:
        abort(404)
    return render_template("withdraw-confirm.html", method=method)

@app.route("/deposit/checkout/<int:method_id>")
def deposit_checkout(method_id):
    method = DEPOSIT_METHODS.get(method_id)
    if method is None:
        abort(404)
    return render_template("deposit-checkout.html", method=method)

@app.route("/api/ready")
def readiness():
    return {"ready": True}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
