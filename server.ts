import express, { Request, Response } from 'express';
import nunjucks from 'nunjucks';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = parseInt(process.env.PORT || '3000', 10);
const host = '0.0.0.0';

// Setup middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Static routes
app.use('/static', express.static(path.join(__dirname, 'static')));
app.use('/public', express.static(path.join(__dirname, 'public')));
app.use('/logo', express.static(path.join(__dirname, 'public/logo')));
app.use(express.static(path.join(__dirname, 'public')));

// Nunjucks configuration
const nunjucksEnv = nunjucks.configure(path.join(__dirname, 'templates'), {
  autoescape: true,
  express: app,
  noCache: process.env.NODE_ENV !== 'production'
});

// Configure custom url_for helper to match Flask's url_for
nunjucksEnv.addGlobal('url_for', function(endpoint: string, kwargs?: Record<string, any>) {
  const args = kwargs || {};
  switch (endpoint) {
    case 'static':
      return `/static/${args.filename || ''}`;
    case 'dashboard':
      return '/dashboard';
    case 'login':
      return '/login';
    case 'signup':
      return '/signup';
    case 'markets':
      return '/markets';
    case 'wallets':
      return '/wallets';
    case 'bot_trade':
      return '/bot-trade';
    case 'help_support':
      return '/help-and-support';
    case 'deposit_methods':
      return '/deposit';
    case 'withdraw_methods':
      return '/withdraw';
    case 'deposit_checkout':
      return `/deposit/checkout/${args.method_id}`;
    case 'withdraw_confirm':
      return `/withdraw/confirm/${args.method_id}`;
    case 'trading':
      return `/trading/${args.symbol}`;
    default:
      return `/${endpoint}`;
  }
});

// Custom format filter matching Jinja's {{ '%.2f'|format(method.minimum) }}
nunjucksEnv.addFilter('format', function(str: any, ...args: any[]) {
  if (typeof str === 'string' && str.includes('%.2f')) {
    const val = Number(args[0]) || 0;
    return val.toFixed(2);
  }
  if (args.length > 0) {
    const val = Number(args[0]) || 0;
    return val.toFixed(2);
  }
  return String(str);
});

// Mock / In-memory Data
const DEPOSIT_METHODS: Record<number, any> = {
  1: {
    title: 'USDT (TON)',
    currency: 'USDT',
    network: 'USDT (TON)',
    address: 'DEMO_ONLY_NOT_A_REAL_ADDRESS',
    minimum: '50.00 USD',
    maximum: '2000.00 USD',
    minimum_amount: 50,
    maximum_amount: 2000,
    rate: '1.00 USDT',
  },
  4: {
    title: 'Binance',
    currency: 'ETH',
    network: 'ETH',
    address: 'DEMO_ONLY_NOT_A_REAL_ADDRESS',
    minimum: '2000.00 USD',
    maximum: '1000000.00 USD',
    minimum_amount: 2000,
    maximum_amount: 1000000,
    rate: '0.00 ETH',
  },
  5: {
    title: 'Binance',
    currency: 'USDT',
    network: 'USDT',
    address: 'DEMO_ONLY_NOT_A_REAL_ADDRESS',
    minimum: '50.00 USD',
    maximum: '1000000.00 USD',
    minimum_amount: 50,
    maximum_amount: 1000000,
    rate: '0.00 USDT',
  },
};

const WITHDRAW_METHODS: Record<number, any> = {
  7: {
    currency: 'USDT',
    gateway: 'USDT (TRC 20)',
    address_label: 'Enter Your (TRC 20) Address',
    minimum: 5,
    rate: 1.0,
    rate_text: '1.00 USDT',
    fee_percent: 0,
  },
  8: {
    currency: 'USDT',
    gateway: 'USDT (BEP20)',
    address_label: 'Enter Your (BEP20) Address',
    minimum: 5,
    rate: 1.0,
    rate_text: '1.00 USDT',
    fee_percent: 0,
  },
  9: {
    currency: 'INR',
    gateway: 'Google Pay',
    address_label: 'Enter Your UPI ID',
    minimum: 5,
    rate: 0,
    rate_text: '0.00 INR',
    fee_percent: 0,
  },
};

const TRADING_ASSETS: Record<string, { name: string; price: number }> = {
  USDT: { name: 'TetherUS', price: 1.0002 },
  BTC: { name: 'Bitcoin / TetherUS', price: 79974.01 },
  ETH: { name: 'Ethereum / TetherUS', price: 2720.35 },
  ALGO: { name: 'ALGO / TetherUS', price: 0.09503 },
  XRP: { name: 'XRP / TetherUS', price: 1.4187 },
  ADA: { name: 'Cardano / TetherUS', price: 0.2209 },
  MATIC: { name: 'Polygon / TetherUS', price: 0.3794 },
  DOGE: { name: 'Dogecoin / TetherUS', price: 0.0911 },
};

// Routes
app.get('/', (req: Request, res: Response) => {
  res.render('index.html', { title: 'Hello' });
});

app.get('/login', (req: Request, res: Response) => {
  res.render('login.html');
});

app.post('/login', (req: Request, res: Response) => {
  res.redirect('/dashboard');
});

app.get('/signup', (req: Request, res: Response) => {
  res.render('signup.html');
});

app.post('/signup', (req: Request, res: Response) => {
  res.redirect('/dashboard');
});

app.get('/dashboard', (req: Request, res: Response) => {
  res.render('dashboard.html');
});

app.get('/markets', (req: Request, res: Response) => {
  res.render('markets.html');
});

app.get('/trading/:symbol', (req: Request, res: Response) => {
  const rawSymbol = Array.isArray(req.params.symbol) ? req.params.symbol[0] : req.params.symbol;
  const symbol = (rawSymbol || '').toUpperCase();
  const asset = TRADING_ASSETS[symbol];
  if (!asset) {
    return res.status(404).send('Asset not found');
  }
  res.render('trading.html', { symbol, asset });
});

app.get('/bot-trade', (req: Request, res: Response) => {
  res.render('bot-trade.html');
});

app.get('/wallets', (req: Request, res: Response) => {
  res.render('wallets.html');
});

app.get('/help-and-support', (req: Request, res: Response) => {
  res.render('help-support.html');
});

app.get('/deposit', (req: Request, res: Response) => {
  res.render('deposit-methods.html');
});

app.get('/withdraw', (req: Request, res: Response) => {
  res.render('withdraw-methods.html');
});

app.get('/withdraw/confirm/:methodId', (req: Request, res: Response) => {
  const rawId = Array.isArray(req.params.methodId) ? req.params.methodId[0] : req.params.methodId;
  const methodId = parseInt(rawId || '0', 10);
  const method = WITHDRAW_METHODS[methodId];
  if (!method) {
    return res.status(404).send('Withdraw method not found');
  }
  res.render('withdraw-confirm.html', { method });
});

app.get('/deposit/checkout/:methodId', (req: Request, res: Response) => {
  const rawId = Array.isArray(req.params.methodId) ? req.params.methodId[0] : req.params.methodId;
  const methodId = parseInt(rawId || '0', 10);
  const method = DEPOSIT_METHODS[methodId];
  if (!method) {
    return res.status(404).send('Deposit method not found');
  }
  res.render('deposit-checkout.html', { method });
});

app.get('/api/ready', (req: Request, res: Response) => {
  res.json({ ready: true });
});

app.listen(port, host, () => {
  console.log(`TradeXPro running on http://${host}:${port}`);
});
