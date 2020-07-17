List<String> getSymbolsOfStock(String stockname) {
  List<String> symbols = [];
  var stock = STOCKS.firstWhere((stock) => stockname == stock['name']);
  if (stock['symbols_eur'] != Null && stock['symbols_eur'].length > 0) {
    symbols.addAll(stock['symbols_eur']);
  }
  if (stock['symbols_usd'] != Null && stock['symbols_usd'].length > 0) {
    symbols.addAll(stock['symbols_usd']);
  }
  return symbols;
}

const String USD = '\$';
const String EUR = '€';
const List<String> CURRENCIES = [EUR, USD];
const List<String> INDICES = [
  "EURO STOXX 50",
  "S&P 500",
  "CAC 40",
  "NASDAQ 100",
  "IBEX 35",
  "DOW JONES",
  "BEL 20",
  "FTSE 100",
  "AEX",
  "Switzerland 20",
  "OMX Stockholm 30",
  "TECDAX",
  "MOEX",
  "OMX Helsinki 25",
  "OMX Helsinki 15",
  "S&P 100",
  "SDAX",
  "DAX",
  "MDAX",
  "CAC Mid 60"
];

const List<String> COUNTRIES = [
  "France",
  "Germany",
  "Belgium",
  "Luxembourg",
  "Netherlands",
  "Russian Federation",
  "Russia",
  "Switzerland",
  "Austria",
  "China",
  "Ireland",
  "Mexico",
  "Spain",
  "Finland",
  "Bermuda",
  "United States",
  "Israel",
  "South Africa",
  "United Kingdom",
  "Sweden"
];

const List<String> INDUSTRIES = [
  "Internet",
  "Corporate Financials",
  "Other Specialty Retailers",
  "Technology",
  "Energy",
  "Homebuilding / Household Goods",
  "Home Furnishings",
  "Oil & Gas Drilling",
  "Media",
  "Auto, Truck & Motorcycle Parts",
  "Leisure & Recreation",
  "Agricultural Chemicals",
  "Personal Products",
  "Pharmaceuticals",
  "Diversified Trading & Distributing",
  "Airport Services",
  "Search engine",
  "Freight & Logistics Services",
  "Electronic Equipments & Parts",
  "Employment Services",
  "Cyclical Consumer Products",
  "Biotechnology & Medical Research",
  "Wireless Telecommunications Services",
  "Broadcasting",
  "Financials",
  "Personal & Household Products & Services",
  "Investment Banking & Brokerage Services",
  "Investment Trusts",
  "Utilities",
  "Ground Freight & Logistics",
  "Apparel & Accessories Retailers",
  "Industrial Conglomerates",
  "Metals & Mining",
  "Mineral Resources",
  "Consumer Cyclicals",
  "Sportswear",
  "Real estate",
  "Home Improvement Products & Services Retailers",
  "Integrated Mining",
  "Building materials",
  "Airlines",
  "Electric Utilities & IPPs",
  "Residential REITs",
  "Hotels & Entertainment Services",
  "Professional & Commercial Services",
  "Construction & Engineering",
  "Transport Infrastructure",
  "Networking equipment",
  "Department Stores",
  "Construction",
  "Personal Services",
  "IT Services & Consulting",
  "Integrated Telecommunications Services",
  "Specialized REITs",
  "Transportation",
  "Lighting",
  "Computer & Electronics Retailers",
  "Fishing & Farming",
  "Medical Equipment, Supplies & Distribution",
  "Electric power",
  "Paper Packaging",
  "Food Processing",
  "Home Furnishings Retailers",
  "Multiline Utilities",
  "Containers & Packaging",
  "Automotive",
  "Investment Management & Fund Operators",
  "Household Products",
  "Thermal energy",
  "Engineering & Construction",
  "Communications & Networking",
  "Real Estate Operations",
  "Transport machine building",
  "Gas",
  "Specialty Chemicals",
  "Auto Vehicles, Parts & Service Retailers",
  "Beverages",
  "Toiletries",
  "Commercial REITs",
  "Oil & Gas Exploration and Production",
  "Oil & Gas",
  "Construction Supplies & Fixtures",
  "Electrical Components & Equipment",
  "Electric utility",
  "Telecommunications Services",
  "Medication",
  "Banking Services",
  "Heavy Machinery & Vehicles",
  "Fossil Fuels",
  "Auto & Truck Manufacturers",
  "Footwear",
  "Applied Resources",
  "Semiconductor Equipment & Testing",
  "Insurance",
  "Appliances, Tools & Housewares",
  "Banking & Investment Services",
  "Aluminium",
  "Holding Companies",
  "Healthcare Services",
  "Oil",
  "Aluminum",
  "Life & Health Insurance",
  "Restaurants & Bars",
  "Computer Hardware",
  "Non-Alcoholic Beverages",
  "Agricultural Inputs",
  "Commercial Printing Services",
  "Multiline Insurance & Brokers",
  "Electric Utilities",
  "Pharmaceuticals & Medical Research",
  "Commodity Chemicals",
  "Food & Beverages",
  "Machinery, Equipment & Components",
  "Computers, Phones & Household Electronics",
  "Diversified Chemicals",
  "Toys & Juvenile Products",
  "Heavy Electrical Equipment",
  "Telecommunications equipment",
  "Regulated Gas",
  "Semiconductors & Semiconductor Equipment",
  "Environmental Services & Equipment",
  "Cyclical Consumer Services",
  "Industrial Machinery & Equipment",
  "Professional Information Services",
  "Food & Tobacco",
  "Real Estate Development & Operations",
  "Industrial Goods",
  "Passenger Transportation Services",
  "Managed Health care",
  "Industrial & Commercial Services",
  "Banks",
  "Textiles & Apparel",
  "Food Retail & Distribution",
  "Entertainment Production",
  "Banking",
  "Advanced Medical Equipment & Technology",
  "Semiconductors",
  "Food & Drug Retailing",
  "Specialty Retailers",
  "Tobacco",
  "Oil & Gas Related Equipment and Services",
  "Coal",
  "Reinsurance",
  "Property & Casualty Insurance",
  "Consumer Non-Cyclicals",
  "Distillers & Wineries",
  "Aerospace & Defense",
  "Independent Power Producers",
  "Natural Gas Utilities",
  "Steel",
  "Advertising & Marketing",
  "Marine Freight & Logistics",
  "Electricity",
  "Oil Related Services and Equipment",
  "Passenger Transportation, Ground & Sea",
  "Integrated Oil & Gas",
  "Paper & Forest Products",
  "Apparel & Accessories",
  "Real Estate",
  "Casinos & Gaming",
  "Healthcare",
  "Chemicals",
  "Specialty Mining & Metals",
  "Gold",
  "Paper Products",
  "Media & Publishing",
  "Software",
  "Water Utilities",
  "Healthcare Equipment & Supplies",
  "Cosmetics",
  "Real Estate Services",
  "Collective Investments",
  "Office Equipment",
  "Industrials",
  "Leisure Products",
  "retail",
  "Healthcare Facilities & Services",
  "Homebuilding",
  "Discount Stores",
  "Oil & Gas Transportation Services",
  "Mining",
  "Financial & Commodity Market Operators",
  "Diamonds",
  "Technology Equipment",
  "Brewers",
  "Marine Port Services",
  "Non-Paper Containers & Packaging",
  "Optician",
  "Construction Materials",
  "Phones & Handheld Devices",
  "Ticket distribution",
  "Hotels, Motels & Cruise Lines",
  "Conglomerate",
  "Automobiles & Auto Parts",
  "Diversified Retail",
  "Investment Banking & Investment Services",
  "Household Goods",
  "Residential & Commercial RETIs",
  "Tires & Rubber Products",
  "Air Freight & Courier Services",
  "Retailers",
  "Refining",
  "Manufacturing",
  "Tourism",
  "Internet Services",
  "Basic Materials",
  "Consumer Lending",
  "Hydroelectrical power",
  "Software & IT Services",
  "Healthcare Providers & Services",
  "Consumer Publishing",
  "Business Support Services",
  "FMCG",
  "Drug Retailers"
];

const List<Map<String, dynamic>> STOCKS = [
  {
    "name": "Red Hat Inc.",
    "symbols_eur": ["RHI.F"],
    "symbols_usd": ["RHT"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Xerox Corporation",
    "symbols_eur": ["XER1.F"],
    "symbols_usd": ["XRX"],
    "tags": ["Technology Equipment", "Technology", "Office Equipment"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Weyerhaeuser Company",
    "symbols_eur": ["WHC.F"],
    "symbols_usd": ["WY"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ameren Corporation",
    "symbols_eur": ["AE4.F"],
    "symbols_usd": ["AEE"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Travelers Companies Inc.",
    "symbols_eur": ["PA9.F"],
    "symbols_usd": ["TRV"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["S&P 500", "DOW JONES"],
    "country": "United States"
  },
  {
    "name": "ASR Nederland",
    "symbols_eur": ["A1.F"],
    "symbols_usd": [],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Aeroflot",
    "symbols_eur": ["AETG.F"],
    "symbols_usd": [],
    "tags": [
      "Transportation",
      "Passenger Transportation Services",
      "Industrials",
      "Airlines"
    ],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "ENCAVIS AG",
    "symbols_eur": ["CAP.F"],
    "symbols_usd": [],
    "tags": [
      "Independent Power Producers",
      "Utilities",
      "Electric Utilities & IPPs"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Peugeot SA",
    "symbols_eur": ["PEU.F"],
    "symbols_usd": ["PUGOY"],
    "tags": [
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Coty Inc.",
    "symbols_eur": ["CO3A.F"],
    "symbols_usd": ["COTY"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Intel Corporation",
    "symbols_eur": ["INL.F"],
    "symbols_usd": ["INTC"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Hypoport Finance AG",
    "symbols_eur": ["HYQ.F"],
    "symbols_usd": ["HYQ"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Isra Vision AG",
    "symbols_eur": ["ISR.F"],
    "symbols_usd": ["ISR"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Dominion Energy Inc.",
    "symbols_eur": ["DOD.F"],
    "symbols_usd": ["D"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Mettler-Toledo International Inc.",
    "symbols_eur": ["MTO.F"],
    "symbols_usd": ["MTD"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Dr. H\u00f6nle AG",
    "symbols_eur": ["HNL.F"],
    "symbols_usd": ["DRHNF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Rockwell Automation Inc.",
    "symbols_eur": ["RWL.F"],
    "symbols_usd": ["ROK"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Centene Corporation",
    "symbols_eur": ["QEN.F"],
    "symbols_usd": ["CNC"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "alstria office REIT-AG",
    "symbols_eur": ["AOX.F"],
    "symbols_usd": [],
    "tags": ["Residential & Commercial RETIs", "Financials", "Real Estate"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "BayWa AG vNa",
    "symbols_eur": ["BYW6.F"],
    "symbols_usd": ["BYW6"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Consumer Non-Cyclicals",
      "Fishing & Farming"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "The Bank of New York Mellon Corporation",
    "symbols_eur": ["BN9.F"],
    "symbols_usd": ["BK"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "IPG Photonics Corporation",
    "symbols_eur": ["IPF.F"],
    "symbols_usd": ["IPGP"],
    "tags": [
      "Electronic Equipments & Parts",
      "Technology",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Sampo Oyj",
    "symbols_eur": ["SMPA.F"],
    "symbols_usd": ["SAXPF"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Wynn Resorts, Limited",
    "symbols_eur": ["WYR.F"],
    "symbols_usd": ["WYNN"],
    "tags": [
      "Casinos & Gaming",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cigna Corporation",
    "symbols_eur": ["CGN.F"],
    "symbols_usd": ["CI"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Altria Group Inc.",
    "symbols_eur": ["PHM7.F"],
    "symbols_usd": ["MO"],
    "tags": [
      "Food & Tobacco",
      "Tobacco",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "EOG Resources Inc.",
    "symbols_eur": ["EO5.F"],
    "symbols_usd": ["EOG"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Abbott Laboratories",
    "symbols_eur": ["ABL.F"],
    "symbols_usd": ["ABT"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "AIXTRON SE",
    "symbols_eur": ["AIXA.F"],
    "symbols_usd": ["AIXXF"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Quanta Services Inc.",
    "symbols_eur": ["QAA.F"],
    "symbols_usd": ["PWR"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cancom SE",
    "symbols_eur": ["COK.F"],
    "symbols_usd": ["CCCMF"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "TOTAL SA",
    "symbols_eur": ["TOTB.F"],
    "symbols_usd": ["TTFNF"],
    "tags": ["Integrated Oil & Gas", "Fossil Fuels", "Oil & Gas", "Energy"],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Polyus",
    "symbols_eur": ["P6J1.F"],
    "symbols_usd": ["OPYGY", "PLZL.ME"],
    "tags": ["Gold", "Mineral Resources", "Metals & Mining", "Basic Materials"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Quest Diagnostics Inc.",
    "symbols_eur": ["QDI.F"],
    "symbols_usd": ["DGX"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The J. M. Smucker Company",
    "symbols_eur": ["JM2.F"],
    "symbols_usd": ["SJM"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Stora Enso Oyj R",
    "symbols_eur": ["ENUR.F"],
    "symbols_usd": ["SEOJF"],
    "tags": [
      "Paper & Forest Products",
      "Paper Products",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Huntington Ingalls Industries Inc.",
    "symbols_eur": ["HI4.F"],
    "symbols_usd": ["HII"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Sartorius AG",
    "symbols_eur": ["SRT3.F"],
    "symbols_usd": ["SUVPF"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Medication",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Swatch Group AG",
    "symbols_eur": ["UHR.F"],
    "symbols_usd": [],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Centrica PLC",
    "symbols_eur": ["CENB.F"],
    "symbols_usd": ["CPYYY"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "United Internet AG",
    "symbols_eur": ["UTDI.F"],
    "symbols_usd": ["UDIRF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "GEA Group AG",
    "symbols_eur": ["G1A.F"],
    "symbols_usd": ["GEAGY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Waters Corporation",
    "symbols_eur": ["WAZ.F"],
    "symbols_usd": ["WAT"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Flutter Entertainment PLC",
    "symbols_eur": ["PPB.F"],
    "symbols_usd": ["PDYPY"],
    "tags": [
      "Casinos & Gaming",
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services"
    ],
    "indices": ["FTSE 100"],
    "country": "Ireland"
  },
  {
    "name": "UCB SA",
    "symbols_eur": ["UNC.F"],
    "symbols_usd": ["UCBJF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Southern Company",
    "symbols_eur": ["SOT.F"],
    "symbols_usd": ["SO"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Monster Beverage Corporation",
    "symbols_eur": ["MOB.F"],
    "symbols_usd": ["MNST"],
    "tags": [
      "Beverages",
      "Non-Alcoholic Beverages",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Tatneft",
    "symbols_eur": ["TTFB.F"],
    "symbols_usd": ["OAOFY", "TATN.ME"],
    "tags": ["Fossil Fuels", "Oil & Gas", "Energy"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "The Goldman Sachs Group Inc.",
    "symbols_eur": ["GOS.F"],
    "symbols_usd": ["GS-PK"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Banking & Brokerage Services"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Wm Morrison Supermarkets PLC",
    "symbols_eur": ["WZP.F"],
    "symbols_usd": ["MRWSF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Severstal",
    "symbols_eur": ["RTS2.F"],
    "symbols_usd": ["SVJTY", "CHMF.ME"],
    "tags": ["Steel", "Mining"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Dentyply Sirona Inc.",
    "symbols_eur": ["DY2.F"],
    "symbols_usd": ["XRAY"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Colgate-Palmolive Company",
    "symbols_eur": ["CPA.F"],
    "symbols_usd": ["CL"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Synchrony Financial",
    "symbols_eur": ["SFE.F"],
    "symbols_usd": ["SYF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Consumer Lending",
      "Banking Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Harley-Davidson Inc.",
    "symbols_eur": ["HAR.F"],
    "symbols_usd": ["HOG"],
    "tags": [
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Henkel AG & Co. KGaA Vz",
    "symbols_eur": ["HEN3.F"],
    "symbols_usd": ["HENKY"],
    "tags": ["FMCG", "Specialty Chemicals", "Chemicals", "Basic Materials"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Leggett & Platt Inc.",
    "symbols_eur": ["LP1.F"],
    "symbols_usd": ["LEG"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Household Goods",
      "Home Furnishings"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Republic Services Inc.",
    "symbols_eur": ["RPU.F"],
    "symbols_usd": ["RSG"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Stabilus SA",
    "symbols_eur": ["STM.F"],
    "symbols_usd": [],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrial Machinery & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["SDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "3i Group PLC",
    "symbols_eur": ["IGQ5.F"],
    "symbols_usd": ["TGOPY"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Qualcomm Inc.",
    "symbols_eur": ["QCI.F"],
    "symbols_usd": ["QCOM"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Sanofi",
    "symbols_eur": ["SNW.F"],
    "symbols_usd": ["SNYNF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Bunzl PLC",
    "symbols_eur": ["BUZ1.F"],
    "symbols_usd": ["BZLFF"],
    "tags": [
      "Diversified Trading & Distributing",
      "Industrial & Commercial Services",
      "Industrials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Sofina Soci\u00e9t\u00e9 Anonyme",
    "symbols_eur": ["8FS.F"],
    "symbols_usd": ["SFNXF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Tapestry Inc.",
    "symbols_eur": ["CO.F"],
    "symbols_usd": ["TPR"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Smith & Nephew PLC",
    "symbols_eur": ["NPWA.F"],
    "symbols_usd": ["SNN"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "NXP Semiconductors N.V.",
    "symbols_eur": ["VNX.F"],
    "symbols_usd": ["NXPI"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100"],
    "country": "Netherlands"
  },
  {
    "name": "Illumina Inc.",
    "symbols_eur": ["ILU.F"],
    "symbols_usd": ["ILMN"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Garmin Ltd.",
    "symbols_eur": ["GEY.F"],
    "symbols_usd": ["GRMN"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500"],
    "country": "Switzerland"
  },
  {
    "name": "Tesla Inc.",
    "symbols_eur": ["TL0.F"],
    "symbols_usd": ["TSLA"],
    "tags": [
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Fortinet Inc.",
    "symbols_eur": ["FO8.F"],
    "symbols_usd": ["FTNT"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Reckitt Benckiser Group PLC",
    "symbols_eur": ["3RB.F"],
    "symbols_usd": ["RBGLY"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Aalberts Industries",
    "symbols_eur": ["AACA.F"],
    "symbols_usd": ["AALBF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrial Machinery & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Northern Trust Corporation",
    "symbols_eur": ["NT4.F"],
    "symbols_usd": ["NTRS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Nordstrom Inc.",
    "symbols_eur": ["NRD.F"],
    "symbols_usd": ["JWN"],
    "tags": [
      "Diversified Retail",
      "Department Stores",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Moody's Corporation",
    "symbols_eur": ["DUT.F"],
    "symbols_usd": ["MCO"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "VeriSign Inc.",
    "symbols_eur": ["VRS.F"],
    "symbols_usd": ["VRSN"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Exxon Mobil Corporation",
    "symbols_eur": ["XONA.F"],
    "symbols_usd": ["XOM"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Aviva PLC",
    "symbols_eur": ["5V51.F"],
    "symbols_usd": ["AVVIY"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "ING Groep N.V.",
    "symbols_eur": ["INN1.F"],
    "symbols_usd": ["ISG"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["AEX", "BEL 20"],
    "country": "Netherlands"
  },
  {
    "name": "MorphoSys AG",
    "symbols_eur": ["MOR.F"],
    "symbols_usd": ["MOR"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Grand City Properties SA",
    "symbols_eur": ["GYC.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "The Western Union Company",
    "symbols_eur": ["W3U.F"],
    "symbols_usd": ["WU"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Atlas Copco AB",
    "symbols_eur": ["ACO2.F"],
    "symbols_usd": ["ATLKY"],
    "tags": ["Industrials"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Linde PLC",
    "symbols_eur": ["LIN.F"],
    "symbols_usd": ["LIN"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["DAX", "S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Schneider Electric S.E.",
    "symbols_eur": ["SND.F"],
    "symbols_usd": ["SBGSF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Renault SA",
    "symbols_eur": ["RNL.F"],
    "symbols_usd": ["RNSDF"],
    "tags": [
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Intertek Group PLC",
    "symbols_eur": ["IT1.F"],
    "symbols_usd": ["IKTSF"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Verisk Analytics Inc.",
    "symbols_eur": ["VA7A.F"],
    "symbols_usd": ["VRSK"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "RATIONAL AG",
    "symbols_eur": ["RAA.F"],
    "symbols_usd": ["RTLLF"],
    "tags": [
      "Cyclical Consumer Products",
      "Appliances, Tools & Housewares",
      "Household Goods",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "thyssenkrupp AG",
    "symbols_eur": ["TKA.F"],
    "symbols_usd": ["TYEKF"],
    "tags": [
      "Metals & Mining",
      "Conglomerate",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Willis Towers Watson Public Limited Company",
    "symbols_eur": ["WTY.F"],
    "symbols_usd": ["WLTW"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Adobe Inc.",
    "symbols_eur": ["ADB.F"],
    "symbols_usd": ["ADBE"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Dialog Semiconductor PLC",
    "symbols_eur": ["DLG.F"],
    "symbols_usd": ["DLGNF"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "United Kingdom"
  },
  {
    "name": "Realty Income Corporation",
    "symbols_eur": ["RY6.F"],
    "symbols_usd": ["UHT"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ArcelorMittal",
    "symbols_eur": ["ARRD.F"],
    "symbols_usd": ["MT"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["CAC 40", "AEX", "IBEX 35"],
    "country": "Luxembourg"
  },
  {
    "name": "Acerinox SA",
    "symbols_eur": ["ACE1.F"],
    "symbols_usd": ["ANIOY"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Norilsk Nickel",
    "symbols_eur": ["NNIC.F"],
    "symbols_usd": ["GMKN.ME", "NILSY"],
    "tags": ["Metals & Mining", "Mineral Resources"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Coca-Cola HBC AG",
    "symbols_eur": ["CCKC.F"],
    "symbols_usd": ["CCHGY"],
    "tags": [
      "Beverages",
      "Non-Alcoholic Beverages",
      "Food & Beverages",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "Switzerland"
  },
  {
    "name": "Philip Morris International Inc.",
    "symbols_eur": ["4I1.F"],
    "symbols_usd": ["PM"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "Netherlands"
  },
  {
    "name": "Archer-Daniels-Midland Company",
    "symbols_eur": ["ADM.F"],
    "symbols_usd": ["ADM"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Noble Energy Inc.",
    "symbols_eur": ["NB6.F"],
    "symbols_usd": ["NBL"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "KeyCorp",
    "symbols_eur": ["KEY.F"],
    "symbols_usd": ["KEY-PI"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "salesforce.com Inc.",
    "symbols_eur": ["FOO.F"],
    "symbols_usd": ["CRM"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Flowserve Corporation",
    "symbols_eur": ["FWV.F"],
    "symbols_usd": ["FLS"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Banco Santander (Brasil) SA",
    "symbols_eur": ["DBSA.F"],
    "symbols_usd": ["BSAC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Netflix Inc.",
    "symbols_eur": ["NFC.F"],
    "symbols_usd": ["NFLX"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Rightmove PLC",
    "symbols_eur": ["3JDA.F"],
    "symbols_usd": ["RTMVY"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Cisco Systems Inc.",
    "symbols_eur": ["CIS.F"],
    "symbols_usd": ["CSCO"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "SunTrust Banks Inc.",
    "symbols_eur": ["SUU.F"],
    "symbols_usd": ["STI"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Take-Two Interactive Software Inc.",
    "symbols_eur": ["TKE.F"],
    "symbols_usd": ["TTWO"],
    "tags": [
      "Cyclical Consumer Products",
      "Leisure Products",
      "Toys & Juvenile Products",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "TE Connectivity Ltd.",
    "symbols_eur": ["9TC.F"],
    "symbols_usd": ["TEL"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "Switzerland"
  },
  {
    "name": "Jefferies Financial Group Inc.",
    "symbols_eur": ["LN3.F"],
    "symbols_usd": ["JEF"],
    "tags": ["Financials", "Holding Companies"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "LEG Immobilien AG",
    "symbols_eur": ["LEG.F"],
    "symbols_usd": ["LEGIF"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Royal Caribbean Cruises Ltd.",
    "symbols_eur": ["RC8.F"],
    "symbols_usd": ["RCL"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Zoetis Inc.",
    "symbols_eur": ["ZOE.F"],
    "symbols_usd": ["ZTS"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "DCC PLC",
    "symbols_eur": ["DCC.F"],
    "symbols_usd": ["DCCPF"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["FTSE 100"],
    "country": "Ireland"
  },
  {
    "name": "Legrand SA",
    "symbols_eur": ["LRC.F"],
    "symbols_usd": ["LGRDY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "CEWE Stiftung & Co. KGaA",
    "symbols_eur": ["CWC.F"],
    "symbols_usd": [],
    "tags": [
      "Industrial & Commercial Services",
      "Commercial Printing Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Ralph Lauren Corporation",
    "symbols_eur": ["PRL.F"],
    "symbols_usd": ["RL"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "NIKE Inc.",
    "symbols_eur": ["NKE.F"],
    "symbols_usd": ["NKE"],
    "tags": [
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Footwear",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Evraz PLC",
    "symbols_eur": ["EVZ.F"],
    "symbols_usd": ["EVRZF"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "Russian Federation"
  },
  {
    "name": "DowDuPont Inc.",
    "symbols_eur": ["6D81.F"],
    "symbols_usd": ["DD"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 100", "DOW JONES"],
    "country": "United States"
  },
  {
    "name": "United Utilities Group PLC",
    "symbols_eur": ["UUEC.F"],
    "symbols_usd": ["UUGRY"],
    "tags": ["Utilities", "Water Utilities"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "NVIDIA Corporation",
    "symbols_eur": ["NVD.F"],
    "symbols_usd": ["NVDA"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Abiomed Inc.",
    "symbols_eur": ["AIO.F"],
    "symbols_usd": ["ABMD"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Valero Energy Corporation",
    "symbols_eur": ["V1L.F"],
    "symbols_usd": ["VLO"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Adecco Group AG",
    "symbols_eur": ["ADI1.F"],
    "symbols_usd": ["AHEXY"],
    "tags": [
      "Industrial & Commercial Services",
      "Employment Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Public Service Enterprise Group Inc.",
    "symbols_eur": ["PSE.F"],
    "symbols_usd": ["PEG"],
    "tags": [
      "Environmental Services & Equipment",
      "Financials",
      "Industrial & Commercial Services",
      "Specialized REITs",
      "Real Estate",
      "Industrials",
      "Residential & Commercial RETIs",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "BT Group PLC",
    "symbols_eur": ["BTQ.F"],
    "symbols_usd": ["BT"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Air Liquide SA",
    "symbols_eur": ["AIL.F"],
    "symbols_usd": ["AIQUF"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "International Flavors & Fragrances Inc.",
    "symbols_eur": ["IFF.F"],
    "symbols_usd": ["IFF"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "M&T Bank Corporation",
    "symbols_eur": ["MTZ.F"],
    "symbols_usd": ["MTB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Conagra Brands Inc.",
    "symbols_eur": ["CAO.F"],
    "symbols_usd": ["CAG"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ResMed Inc.",
    "symbols_eur": ["RMEA.F"],
    "symbols_usd": ["RMD"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "BP PLC",
    "symbols_eur": [],
    "symbols_usd": ["BSU", "BP"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Omnicom Group Inc.",
    "symbols_eur": ["OCN.F"],
    "symbols_usd": ["OMC"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fresenius SE & Co. KGaA",
    "symbols_eur": ["FRE.F"],
    "symbols_usd": ["FSNUY"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Evonik Industries AG",
    "symbols_eur": ["EVK.F"],
    "symbols_usd": ["EVKIF"],
    "tags": ["Basic Materials", "Diversified Chemicals", "Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Norfolk Southern Corporation",
    "symbols_eur": ["NFS.F"],
    "symbols_usd": ["NSC"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Siemens Gamesa Renewable Energy SA",
    "symbols_eur": ["GTQ1.F"],
    "symbols_usd": ["GCTAF"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["IBEX 35"],
    "country": "Germany"
  },
  {
    "name": "BioMarin Pharmaceutical Inc.",
    "symbols_eur": ["BM8.F"],
    "symbols_usd": ["BMRN"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Ontex Group NV",
    "symbols_eur": ["OT7.F"],
    "symbols_usd": ["OTEX"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Cadence Design Systems Inc.",
    "symbols_eur": ["CDS.F"],
    "symbols_usd": ["CDNS"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Randstad N.V.",
    "symbols_eur": ["RSH.F"],
    "symbols_usd": ["RANJF"],
    "tags": [
      "Industrial & Commercial Services",
      "Employment Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Sika AG",
    "symbols_eur": ["SIKA.F"],
    "symbols_usd": ["SKFOF"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "W\u00e4rtsil\u00e4 Oyj Abp",
    "symbols_eur": ["MTA.F"],
    "symbols_usd": ["WRTBF"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Prologis Inc.",
    "symbols_eur": ["POJN.F"],
    "symbols_usd": ["PLD"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Wells Fargo & Company",
    "symbols_eur": ["NWT.F"],
    "symbols_usd": ["WFC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Publicis Groupe SA",
    "symbols_eur": ["PU4.F"],
    "symbols_usd": ["PGPEF"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Constellation Brands Inc.",
    "symbols_eur": ["CB1A.F"],
    "symbols_usd": ["STZ"],
    "tags": [
      "Distillers & Wineries",
      "Beverages",
      "Food & Beverages",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Just Eat PLC",
    "symbols_eur": ["J00.F"],
    "symbols_usd": ["JSTTY"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Occidental Petroleum Corporation",
    "symbols_eur": ["OPC.F"],
    "symbols_usd": ["OXY"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Banco Bilbao Vizcaya Argentaria SA",
    "symbols_eur": ["BOY.F"],
    "symbols_usd": ["BBVA"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["IBEX 35"],
    "country": "United States"
  },
  {
    "name": "Groupe Bruxelles Lambert SA",
    "symbols_eur": ["EAI.F"],
    "symbols_usd": ["GBLBF"],
    "tags": ["Basic Materials", "Diversified Chemicals", "Chemicals"],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Varian Medical Systems Inc.",
    "symbols_eur": ["VNM.F"],
    "symbols_usd": ["VAR"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "SL Green Realty Corp.",
    "symbols_eur": ["GEI.F"],
    "symbols_usd": ["SLG"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Novartis AG",
    "symbols_eur": ["NOT.F"],
    "symbols_usd": ["NVS"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "MERLIN Properties SOCIMI SA",
    "symbols_eur": ["MEQA.F"],
    "symbols_usd": ["MRPRF"],
    "tags": ["Real Estate"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "ConocoPhillips",
    "symbols_eur": ["YCP.F"],
    "symbols_usd": ["COP"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Est\u00e9e Lauder Companies Inc.",
    "symbols_eur": ["ELAA.F"],
    "symbols_usd": ["EL"],
    "tags": ["Cosmetics"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PFEIFFER VACUUM TECHNOLOGY AG",
    "symbols_eur": ["PFV.F"],
    "symbols_usd": ["PFV"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Sixt SE",
    "symbols_eur": ["SIX2.F"],
    "symbols_usd": ["SXT"],
    "tags": [
      "Industrials",
      "Passenger Transportation Services",
      "Transportation",
      "Passenger Transportation, Ground & Sea"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Ventas Inc.",
    "symbols_eur": ["VEN.F"],
    "symbols_usd": ["VTR"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Universal Health Services Inc.",
    "symbols_eur": ["UHS.F"],
    "symbols_usd": ["UHS"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Corning Inc.",
    "symbols_eur": ["GLW.F"],
    "symbols_usd": ["GLW"],
    "tags": [
      "Electronic Equipments & Parts",
      "Technology",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "WPP PLC",
    "symbols_eur": ["0WP.F"],
    "symbols_usd": ["WP"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Schroders PLC",
    "symbols_eur": ["PYX.F"],
    "symbols_usd": ["SHNWF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Helmerich & Payne Inc.",
    "symbols_eur": ["HPC.F"],
    "symbols_usd": ["HP"],
    "tags": [
      "Oil & Gas Drilling",
      "Oil & Gas Related Equipment and Services",
      "Fossil Fuels",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hannover R\u00fcck SE",
    "symbols_eur": ["HNR1.F"],
    "symbols_usd": ["HVRRY"],
    "tags": ["Insurance", "Financials", "Reinsurance"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Allegion PLC",
    "symbols_eur": ["60A.F"],
    "symbols_usd": ["ALLE"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "Eastman Chemical Company",
    "symbols_eur": ["EAC.F"],
    "symbols_usd": ["EMN"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deutsche Telekom AG",
    "symbols_eur": ["DTE.F"],
    "symbols_usd": ["DTEGF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["DAX", "TECDAX"],
    "country": "Germany"
  },
  {
    "name": "Amadeus IT Group SA",
    "symbols_eur": ["AI3A.F"],
    "symbols_usd": ["AMADF"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "JENOPTIK AG",
    "symbols_eur": ["JEN.F"],
    "symbols_usd": [],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Lukoil",
    "symbols_eur": ["LUK.F"],
    "symbols_usd": ["LUKOY", "LKOH.ME"],
    "tags": ["Energy"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Warehouses De Pauw",
    "symbols_eur": ["WPH.F"],
    "symbols_usd": ["WDPSF"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Fastenal Company",
    "symbols_eur": ["FAS.F"],
    "symbols_usd": ["FAST"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Amphenol Corporation",
    "symbols_eur": ["XPH.F"],
    "symbols_usd": ["APH"],
    "tags": [
      "Electronic Equipments & Parts",
      "Technology",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Foot Locker Inc.",
    "symbols_eur": ["WOO.F"],
    "symbols_usd": ["FL"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Compass Group PLC",
    "symbols_eur": ["XGR2.F"],
    "symbols_usd": ["CMPGY"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Ford Motor Company",
    "symbols_eur": ["FMC1.F"],
    "symbols_usd": ["F"],
    "tags": [
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Iberdrola SA",
    "symbols_eur": ["IBE1.F"],
    "symbols_usd": ["IBDRY"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Siemens AG",
    "symbols_eur": ["SIE.F"],
    "symbols_usd": ["SMAWF"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Barco N.V.",
    "symbols_eur": ["BC1N.F"],
    "symbols_usd": ["BCNAY"],
    "tags": [
      "Electronic Equipments & Parts",
      "Technology",
      "Technology Equipment"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Worldline SA",
    "symbols_eur": ["WO6.F"],
    "symbols_usd": ["WWLNF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["CAC Mid 60"],
    "country": "France"
  },
  {
    "name": "Cognizant Technology Solutions Corporation",
    "symbols_eur": ["COZ.F"],
    "symbols_usd": ["CTSH"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "DIC ASSET AG",
    "symbols_eur": ["DIC.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "IHS Markit Ltd.",
    "symbols_eur": ["0M3.F"],
    "symbols_usd": ["INFO"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Gazprom",
    "symbols_eur": ["GAZ.F"],
    "symbols_usd": ["OGZPY", "GAZP.ME"],
    "tags": ["Fossil Fuels", "Oil & Gas", "Energy"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "The Kroger Co.",
    "symbols_eur": ["KOG.F"],
    "symbols_usd": ["KR"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fortum Oyj",
    "symbols_eur": ["FOT.F"],
    "symbols_usd": ["FOJCF"],
    "tags": ["Utilities"],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Parker-Hannifin Corporation",
    "symbols_eur": ["PH.F"],
    "symbols_usd": ["PH"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "BAE Systems PLC",
    "symbols_eur": ["BSP.F"],
    "symbols_usd": ["BAESY"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "NiSource Inc.",
    "symbols_eur": ["NOU.F"],
    "symbols_usd": ["NI"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Aflac Inc.",
    "symbols_eur": ["AFL.F"],
    "symbols_usd": ["AFL"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Citizens Financial Group Inc.",
    "symbols_eur": ["1C5.F"],
    "symbols_usd": ["CFG"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deutsche Post AG",
    "symbols_eur": ["DPW.F"],
    "symbols_usd": ["DPSGY"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Transportation",
      "Air Freight & Courier Services"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Boston Scientific Corporation",
    "symbols_eur": ["BSX.F"],
    "symbols_usd": ["BSX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CBS Corporation",
    "symbols_eur": ["C5S1.F"],
    "symbols_usd": ["CBS"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Rentokil Initial PLC",
    "symbols_eur": ["RTO1.F"],
    "symbols_usd": ["RTOKY"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Siltronic AG",
    "symbols_eur": ["WAF.F"],
    "symbols_usd": ["SSLLF"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "IDEXX Laboratories Inc.",
    "symbols_eur": ["IX1.F"],
    "symbols_usd": ["IDXX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Sandvik AB",
    "symbols_eur": ["SVKB.F"],
    "symbols_usd": ["SDVKY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "MetLife Inc.",
    "symbols_eur": ["MWZ.F"],
    "symbols_usd": ["MET"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "BANKIA SA",
    "symbols_eur": ["FV02.F"],
    "symbols_usd": ["BNKXF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "V.F. Corporation",
    "symbols_eur": ["VFP.F"],
    "symbols_usd": ["VFC"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Eversource Energy",
    "symbols_eur": ["NWJ.F"],
    "symbols_usd": ["ES"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Anadarko Petroleum Corporation",
    "symbols_eur": ["AAZ.F"],
    "symbols_usd": ["APC"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Incyte Corporation",
    "symbols_eur": ["ICY.F"],
    "symbols_usd": ["INCY"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Stanley Black & Decker Inc.",
    "symbols_eur": ["SWF.F"],
    "symbols_usd": ["SWK"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Skandinaviska Enskilda Banken AB",
    "symbols_eur": ["SEBA.F"],
    "symbols_usd": ["SVKEF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Snap-on Inc.",
    "symbols_eur": ["SPU.F"],
    "symbols_usd": ["SNA"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ASML Holding N.V.",
    "symbols_eur": ["ASME.F"],
    "symbols_usd": ["ASMLF"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Continental AG",
    "symbols_eur": ["CON.F"],
    "symbols_usd": ["CTTAF"],
    "tags": [
      "Automotive",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals",
      "Auto, Truck & Motorcycle Parts"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Iron Mountain Inc.",
    "symbols_eur": ["I5M.F"],
    "symbols_usd": ["IRM"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Simon Property Group Inc.",
    "symbols_eur": ["SQI.F"],
    "symbols_usd": ["SPG"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Meli\u00e1 Hotels International",
    "symbols_eur": ["MEL.F"],
    "symbols_usd": ["SMIZF"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "State Street Corporation",
    "symbols_eur": ["ZYA.F"],
    "symbols_usd": ["STT"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Carrefour SA",
    "symbols_eur": ["CAR.F"],
    "symbols_usd": ["CRERF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "JOST Werke AG",
    "symbols_eur": ["JST.F"],
    "symbols_usd": [],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Pearson PLC",
    "symbols_eur": ["PES.F"],
    "symbols_usd": ["PSO"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Consumer Publishing"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Visa Inc.",
    "symbols_eur": ["3V64.F"],
    "symbols_usd": ["V"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Capri Holdings Limited",
    "symbols_eur": ["MKO.F"],
    "symbols_usd": ["CPRI"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Red El\u00e9ctrica Corporaci\u00f3n SA",
    "symbols_eur": ["RE21.F"],
    "symbols_usd": ["RDEIF"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Metro AG",
    "symbols_eur": ["B4B.F"],
    "symbols_usd": ["MTTWF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Alaska Air Group Inc.",
    "symbols_eur": ["ALK.F"],
    "symbols_usd": ["ALK"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The TJX Companies Inc.",
    "symbols_eur": ["TJX.F"],
    "symbols_usd": ["TJX"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "KBC Group NV",
    "symbols_eur": ["KDB.F"],
    "symbols_usd": ["KBCSF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Deutsche Beteiligungs AG",
    "symbols_eur": ["DBAN.F"],
    "symbols_usd": [],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "JPMorgan Chase & Co.",
    "symbols_eur": ["CMC.F"],
    "symbols_usd": ["JPM"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Hexagon AB",
    "symbols_eur": ["HXGC.F"],
    "symbols_usd": ["HXGBF"],
    "tags": [
      "Electronic Equipments & Parts",
      "Technology",
      "Technology Equipment"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Merck & Co. Inc.",
    "symbols_eur": ["6MK.F"],
    "symbols_usd": ["MRK"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Fiserv Inc.",
    "symbols_eur": ["FIV.F"],
    "symbols_usd": ["FISV"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Aurubis AG",
    "symbols_eur": ["NDA.F"],
    "symbols_usd": [],
    "tags": [
      "Metals & Mining",
      "Specialty Mining & Metals",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Vornado Realty Trust",
    "symbols_eur": ["VO7.F"],
    "symbols_usd": ["VNO"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Mets\u00e4 Board Oyj",
    "symbols_eur": ["MSRB.F"],
    "symbols_usd": ["MTSAF"],
    "tags": [
      "Paper & Forest Products",
      "Paper Products",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Vertex Pharmaceuticals Inc.",
    "symbols_eur": ["VX1.F"],
    "symbols_usd": ["VRTX"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Pioneer Natural Resources Company",
    "symbols_eur": ["PNK.F"],
    "symbols_usd": ["PXD"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Medtronic PLC",
    "symbols_eur": ["2M6.F"],
    "symbols_usd": ["MDT"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "The Walt Disney Company",
    "symbols_eur": ["WDP.F"],
    "symbols_usd": ["DIS"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "J.B. Hunt Transport Services Inc.",
    "symbols_eur": ["JB1.F"],
    "symbols_usd": ["JBHT"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Gilead Sciences Inc.",
    "symbols_eur": ["GIS.F"],
    "symbols_usd": ["GILD"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "RIB SOFTWARE AG",
    "symbols_eur": ["RIB.F"],
    "symbols_usd": ["RIB"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Best Buy Co. Inc.",
    "symbols_eur": ["BUY.F"],
    "symbols_usd": ["BBY"],
    "tags": [
      "Specialty Retailers",
      "Computer & Electronics Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "eBay Inc.",
    "symbols_eur": ["EBA.F"],
    "symbols_usd": ["EBAY"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bouygues SA",
    "symbols_eur": ["BYG.F"],
    "symbols_usd": ["BOUYF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "HP Inc.",
    "symbols_eur": ["7HP.F"],
    "symbols_usd": ["HPQ"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Federal Realty Investment Trust",
    "symbols_eur": [],
    "symbols_usd": ["FRT"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CompuGroup Medical SE",
    "symbols_eur": ["COP.F"],
    "symbols_usd": [],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "WestRock Company",
    "symbols_eur": ["WRK.F"],
    "symbols_usd": ["WRK"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fortive Corporation",
    "symbols_eur": ["F03.F"],
    "symbols_usd": ["FTV"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Booking Holdings Inc.",
    "symbols_eur": ["PCE1.F"],
    "symbols_usd": ["BKNG"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Copart Inc.",
    "symbols_eur": ["CO6.F"],
    "symbols_usd": ["CPRT"],
    "tags": [
      "Specialty Retailers",
      "Consumer Cyclicals",
      "Retailers",
      "Auto Vehicles, Parts & Service Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ocado Group PLC",
    "symbols_eur": ["0OC.F"],
    "symbols_usd": ["OCDGF"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "InterContinental Hotels Group PLC",
    "symbols_eur": ["IC1B.F"],
    "symbols_usd": ["ICHGF"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Svenska Cellulosa AB",
    "symbols_eur": ["SCA1.F"],
    "symbols_usd": ["SVCBY"],
    "tags": [
      "Paper & Forest Products",
      "Paper Products",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Givaudan SA",
    "symbols_eur": ["GIN.F"],
    "symbols_usd": ["GVDNY"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Cardinal Health Inc.",
    "symbols_eur": ["CLH.F"],
    "symbols_usd": ["CAH"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Food & Drug Retailing",
      "Drug Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Edison International",
    "symbols_eur": ["EIX.F"],
    "symbols_usd": ["EIX"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "LafargeHolcim Ltd",
    "symbols_eur": ["HLBN.F"],
    "symbols_usd": ["HCMLY"],
    "tags": ["Basic Materials", "Construction Materials", "Mineral Resources"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Church & Dwight Co. Inc.",
    "symbols_eur": ["CXU.F"],
    "symbols_usd": ["CHD"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal & Household Products & Services",
      "Household Products"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deere & Company",
    "symbols_eur": ["DCO.F"],
    "symbols_usd": ["DE"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Patrizia AG",
    "symbols_eur": ["PAT.F"],
    "symbols_usd": ["PAT"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Outokumpu Oyj",
    "symbols_eur": ["OUTA.F"],
    "symbols_usd": ["OUTFF"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Akzo Nobel N.V.",
    "symbols_eur": ["AKUP.F"],
    "symbols_usd": ["AKZOF"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Repsol SA",
    "symbols_eur": ["REP.F"],
    "symbols_usd": ["REPYF"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Mohawk Industries Inc.",
    "symbols_eur": ["MWK.F"],
    "symbols_usd": ["MHK"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Household Goods",
      "Home Furnishings"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ADO Properties SA",
    "symbols_eur": ["ADJ.F"],
    "symbols_usd": ["ADPPF"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "International Paper Company",
    "symbols_eur": ["INP.F"],
    "symbols_usd": ["IP"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Charles Schwab Corporation",
    "symbols_eur": ["SWG.F"],
    "symbols_usd": ["SCHW"],
    "tags": ["Financials"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cintas Corporation",
    "symbols_eur": ["CIT.F"],
    "symbols_usd": ["CTAS"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Marathon Petroleum Corporation",
    "symbols_eur": ["MPN.F"],
    "symbols_usd": ["MPC"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Swedbank AB",
    "symbols_eur": ["FRYA.F"],
    "symbols_usd": ["SWDBY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Telef\u00f3nica",
    "symbols_eur": ["TNE5.F"],
    "symbols_usd": ["TEF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Scout24 AG",
    "symbols_eur": ["G24.F"],
    "symbols_usd": [],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "AbbVie Inc.",
    "symbols_eur": ["4AB.F"],
    "symbols_usd": ["ABBV"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Nestl\u00e9 SA",
    "symbols_eur": ["NESN.F"],
    "symbols_usd": ["NESN"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "STMicroelectronics N.V.",
    "symbols_eur": ["SGM.F"],
    "symbols_usd": ["STMEF"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["CAC 40"],
    "country": "Switzerland"
  },
  {
    "name": "St. James's Place PLC",
    "symbols_eur": ["1IV.F"],
    "symbols_usd": ["STJPF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Phillips 66",
    "symbols_eur": ["R66.F"],
    "symbols_usd": ["PSX"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Nielsen Holdings PLC",
    "symbols_eur": ["NHL.F"],
    "symbols_usd": ["NLSN"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Banco de Sabadell SA",
    "symbols_eur": ["BDSB.F"],
    "symbols_usd": ["BNDSF"],
    "tags": [
      "Metals & Mining",
      "Technology",
      "Basic Materials",
      "Software",
      "Software & IT Services",
      "Mineral Resources",
      "Steel"
    ],
    "indices": ["IBEX 35"],
    "country": "United States"
  },
  {
    "name": "Getinge AB",
    "symbols_eur": ["GTN.F"],
    "symbols_usd": ["GNGBY"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Elisa Oyj",
    "symbols_eur": ["EIA.F"],
    "symbols_usd": ["ELMUY"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Aegon N.V.",
    "symbols_eur": ["AENF.F"],
    "symbols_usd": ["AEGOF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["AEX"],
    "country": "United States"
  },
  {
    "name": "FirstEnergy Corp.",
    "symbols_eur": ["FE7.F"],
    "symbols_usd": ["FE"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "LyondellBasell Industries N.V.",
    "symbols_eur": ["DLY.F"],
    "symbols_usd": ["LYB"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "AB SKF",
    "symbols_eur": ["SKFA.F"],
    "symbols_usd": ["SKUFF"],
    "tags": ["Manufacturing"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "W\u00fcstenrot & W\u00fcrttembergische AG",
    "symbols_eur": ["WUW.F"],
    "symbols_usd": ["WUW"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "American Tower Corporation",
    "symbols_eur": ["A0T.F"],
    "symbols_usd": ["AMT"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "argenx SE",
    "symbols_eur": ["1AE.F"],
    "symbols_usd": ["ARGX"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["BEL 20"],
    "country": "Netherlands"
  },
  {
    "name": "Ingersoll-Rand PLC",
    "symbols_eur": ["2IS.F"],
    "symbols_usd": ["IR"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrial Machinery & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "AvalonBay Communities Inc.",
    "symbols_eur": ["WV8.F"],
    "symbols_usd": ["AVB"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Unum Group",
    "symbols_eur": ["UUM.F"],
    "symbols_usd": ["UNM"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "W.W. Grainger Inc.",
    "symbols_eur": ["GWW.F"],
    "symbols_usd": ["GWW"],
    "tags": [
      "Financials",
      "Machinery, Equipment & Components",
      "Real Estate Operations",
      "Real Estate Development & Operations",
      "Industrial Goods",
      "Industrial Machinery & Equipment",
      "Real Estate",
      "Industrials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ashtead Group PLC",
    "symbols_eur": ["AHT.F"],
    "symbols_usd": ["AHT"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "BlackRock Inc.",
    "symbols_eur": ["BLQA.F"],
    "symbols_usd": ["BLK"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "TAKKT AG",
    "symbols_eur": ["TTK.F"],
    "symbols_usd": [],
    "tags": ["Technology Equipment", "Technology", "Office Equipment"],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Franklin Resources Inc.",
    "symbols_eur": ["FRK.F"],
    "symbols_usd": ["BEN"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Gartner Inc.",
    "symbols_eur": ["GGRA.F"],
    "symbols_usd": ["IT"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Laboratory Corporation of America Holdings",
    "symbols_eur": ["LAB.F"],
    "symbols_usd": ["LH"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "McKesson Corporation",
    "symbols_eur": ["MCK.F"],
    "symbols_usd": ["MCK"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Food & Drug Retailing",
      "Drug Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "MERCK Kommanditgesellschaft auf Aktien",
    "symbols_eur": ["MRK.F"],
    "symbols_usd": ["MKGAF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Chemicals",
      "Pharmaceuticals"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Everest Re Group, Ltd.",
    "symbols_eur": ["ERE.F"],
    "symbols_usd": ["RE"],
    "tags": ["Insurance", "Financials", "Reinsurance"],
    "indices": ["S&P 500"],
    "country": "Bermuda"
  },
  {
    "name": "Kellogg Company",
    "symbols_eur": ["KEL.F"],
    "symbols_usd": ["K"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "KLA-Tencor Corporation",
    "symbols_eur": ["KLA.F"],
    "symbols_usd": ["KLAC"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Software AG",
    "symbols_eur": ["SOW.F"],
    "symbols_usd": ["STWRY"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "The Boeing Company",
    "symbols_eur": ["BCO.F"],
    "symbols_usd": ["BA"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "H&R Block Inc.",
    "symbols_eur": ["HRB.F"],
    "symbols_usd": ["HRB"],
    "tags": [
      "Personal Services",
      "Consumer Non-Cyclicals",
      "Personal & Household Products & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Croda International PLC",
    "symbols_eur": ["6CMB.F"],
    "symbols_usd": ["COIHF"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Amgen Inc.",
    "symbols_eur": ["AMG.F"],
    "symbols_usd": ["AMGN"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "D\u00fcrr AG",
    "symbols_eur": ["DUE.F"],
    "symbols_usd": ["DUERF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Kering SA",
    "symbols_eur": ["PPX.F"],
    "symbols_usd": ["PPRUF"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "VTG AG",
    "symbols_eur": ["VT9.F"],
    "symbols_usd": [],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Texas Instruments Inc.",
    "symbols_eur": ["TII.F"],
    "symbols_usd": ["TXN"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "ANSYS Inc.",
    "symbols_eur": ["AKX.F"],
    "symbols_usd": ["ANSS"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Marks & Spencer",
    "symbols_eur": ["MA6.F"],
    "symbols_usd": ["MAKSY"],
    "tags": [
      "Specialty Retailers",
      "Other Specialty Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "NextEra Energy Inc.",
    "symbols_eur": ["FP3.F"],
    "symbols_usd": ["NEE"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Humana Inc.",
    "symbols_eur": ["HUM.F"],
    "symbols_usd": ["HUM"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Diamondback Energy Inc.",
    "symbols_eur": ["7DB.F"],
    "symbols_usd": ["FANG"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "AmerisourceBergen Corporation",
    "symbols_eur": ["ABG.F"],
    "symbols_usd": ["ABC"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Food & Drug Retailing",
      "Drug Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Welltower Inc.",
    "symbols_eur": ["HCW.F"],
    "symbols_usd": ["WELL"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hasbro Inc.",
    "symbols_eur": ["HAS.F"],
    "symbols_usd": ["HAS"],
    "tags": [
      "Cyclical Consumer Products",
      "Leisure Products",
      "Toys & Juvenile Products",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Mondi PLC",
    "symbols_eur": ["KYCA.F"],
    "symbols_usd": ["MONDY"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "AMETEK Inc.",
    "symbols_eur": ["AK1.F"],
    "symbols_usd": ["AME"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Herm\u00e8s International SCA",
    "symbols_eur": ["HMI.F"],
    "symbols_usd": ["HESAY"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "General Mills Inc.",
    "symbols_eur": ["GRM.F"],
    "symbols_usd": ["GIS"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PPG Industries Inc.",
    "symbols_eur": ["PPQ.F"],
    "symbols_usd": ["PPG"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hikma Pharmaceuticals PLC",
    "symbols_eur": ["H5P.F"],
    "symbols_usd": ["HKMPY"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Global Payments Inc.",
    "symbols_eur": ["GLO.F"],
    "symbols_usd": ["GPN"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Delta Air Lines Inc.",
    "symbols_eur": ["OYC.F"],
    "symbols_usd": ["DAL"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Autodesk Inc.",
    "symbols_eur": ["AUD.F"],
    "symbols_usd": ["ADSK"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Standard Life Aberdeen PLC",
    "symbols_eur": ["T3V2.F"],
    "symbols_usd": ["SLFPF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "London Stock Exchange Group PLC",
    "symbols_eur": ["LS4C.F"],
    "symbols_usd": ["LNSTY"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Real Estate Operations",
      "Real Estate Development & Operations",
      "Real Estate",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Sberbank of Russia",
    "symbols_eur": ["SBNC.F"],
    "symbols_usd": ["SBRCY", "SBER.ME"],
    "tags": ["Banking"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Admiral Group PLC",
    "symbols_eur": ["FLN.F"],
    "symbols_usd": [],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Orion Oyj",
    "symbols_eur": ["OFK.F"],
    "symbols_usd": ["ORINF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "General Motors Company",
    "symbols_eur": ["8GM.F"],
    "symbols_usd": ["GM"],
    "tags": [
      "Food & Tobacco",
      "Integrated Telecommunications Services",
      "Retailers",
      "Consumer Cyclicals",
      "Food & Beverages",
      "Consumer Non-Cyclicals",
      "Discount Stores",
      "Telecommunications Services",
      "Diversified Retail",
      "Food Processing"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Befesa SA",
    "symbols_eur": ["BFSA.F"],
    "symbols_usd": [],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "Illinois Tool Works Inc.",
    "symbols_eur": ["ILT.F"],
    "symbols_usd": ["ITW"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "FMC Corporation",
    "symbols_eur": ["FMQ.F"],
    "symbols_usd": ["FMC"],
    "tags": ["Basic Materials", "Diversified Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Seagate Technology PLC",
    "symbols_eur": ["STT.F"],
    "symbols_usd": ["STX"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "American International Group Inc.",
    "symbols_eur": ["AINN.F"],
    "symbols_usd": ["AIG"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Intuit Inc.",
    "symbols_eur": ["ITU.F"],
    "symbols_usd": ["INTU"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "CF Industries Holdings Inc.",
    "symbols_eur": ["C4F.F"],
    "symbols_usd": ["CF"],
    "tags": ["Basic Materials", "Chemicals", "Agricultural Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ageas SA/NV",
    "symbols_eur": ["FO4N.F"],
    "symbols_usd": ["AGESF"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Twitter Inc.",
    "symbols_eur": ["TWR.F"],
    "symbols_usd": ["TWTR"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Oracle Corporation",
    "symbols_eur": ["ORC.F"],
    "symbols_usd": ["ORCL"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Allianz SE",
    "symbols_eur": ["ALV.F"],
    "symbols_usd": ["AZSEY"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Symrise AG",
    "symbols_eur": ["SY1.F"],
    "symbols_usd": ["SYIEY"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "SAP SE",
    "symbols_eur": ["SAP.F"],
    "symbols_usd": ["SAP"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["DAX", "TECDAX"],
    "country": "Germany"
  },
  {
    "name": "GlaxoSmithKline PLC",
    "symbols_eur": ["GS7A.F"],
    "symbols_usd": ["GSK"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Aena SA",
    "symbols_eur": ["A44.F"],
    "symbols_usd": ["ANNSF"],
    "tags": [
      "Transport Infrastructure",
      "Industrials",
      "Airport Services",
      "Transportation"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "American Express Company",
    "symbols_eur": ["AEC1.F"],
    "symbols_usd": ["AXP"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Consumer Lending",
      "Banking Services"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "DaVita Inc.",
    "symbols_eur": ["TRL.F"],
    "symbols_usd": ["DVA"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Vulcan Materials Company",
    "symbols_eur": ["VMC.F"],
    "symbols_usd": ["VMC"],
    "tags": ["Basic Materials", "Construction Materials", "Mineral Resources"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "BASF SE",
    "symbols_eur": ["BAS.F"],
    "symbols_usd": ["BFFAF"],
    "tags": ["Basic Materials", "Diversified Chemicals", "Chemicals"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "LANXESS AG",
    "symbols_eur": ["LXS.F"],
    "symbols_usd": ["LNXSF"],
    "tags": ["Basic Materials", "Diversified Chemicals", "Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "WashTec AG",
    "symbols_eur": ["WSU.F"],
    "symbols_usd": ["WHTCF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "PAO TMK",
    "symbols_eur": ["N9E1.F"],
    "symbols_usd": ["TMKXY", "TRMK.ME"],
    "tags": ["Steel"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Cabot Oil & Gas Corporation",
    "symbols_eur": ["XCQ.F"],
    "symbols_usd": ["COG"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "DXC Technology Company",
    "symbols_eur": ["2XT.F"],
    "symbols_usd": ["DXC"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "DWS Group GmbH & Co. KGaA",
    "symbols_eur": ["DWS.F"],
    "symbols_usd": ["DWS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "News Corporation",
    "symbols_eur": ["NC0B.F", "NC0.F"],
    "symbols_usd": ["NWSA", "NWS"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Consumer Publishing"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Synopsys Inc.",
    "symbols_eur": ["SYP.F"],
    "symbols_usd": ["SNPS"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alexandria Real Estate Equities Inc.",
    "symbols_eur": ["A6W.F"],
    "symbols_usd": ["ARE"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alcon Inc.",
    "symbols_eur": ["2U3.F"],
    "symbols_usd": ["ALC"],
    "tags": [
      "Marine Freight & Logistics",
      "Freight & Logistics Services",
      "Industrials",
      "Transportation"
    ],
    "indices": ["Switzerland 20"],
    "country": "United States"
  },
  {
    "name": "C.H. Robinson Worldwide Inc.",
    "symbols_eur": ["CH1A.F"],
    "symbols_usd": ["CHRW"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fox Corporation",
    "symbols_eur": [],
    "symbols_usd": ["FOXA"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hargreaves Lansdown PLC",
    "symbols_eur": ["DMB.F"],
    "symbols_usd": ["HRGLY"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Deutsche Bank AG",
    "symbols_eur": ["DBK.F"],
    "symbols_usd": ["DB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Lincoln National Corporation",
    "symbols_eur": ["LCO.F"],
    "symbols_usd": ["LNC"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Wolters Kluwer N.V.",
    "symbols_eur": ["WOSB.F"],
    "symbols_usd": ["WTKWY"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Boston Properties Inc.",
    "symbols_eur": ["BO9.F"],
    "symbols_usd": ["BXP"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Beiersdorf AG",
    "symbols_eur": ["BEI.F"],
    "symbols_usd": ["BDRFY"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Duke Energy Corporation",
    "symbols_eur": ["D2MN.F"],
    "symbols_usd": ["DUK"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "T\u00e9cnicas Reunidas SA",
    "symbols_eur": ["T5R.F"],
    "symbols_usd": ["TNISF"],
    "tags": [
      "Oil Related Services and Equipment",
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Jack Henry & Associates Inc.",
    "symbols_eur": ["JHY.F"],
    "symbols_usd": ["JKHY"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deutsche Pfandbriefbank AG",
    "symbols_eur": ["PBB.F"],
    "symbols_usd": [],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Mondelez International Inc.",
    "symbols_eur": ["KTF.F"],
    "symbols_usd": ["MDLZ"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Koninklijke Philips N.V.",
    "symbols_eur": ["PHIA.F"],
    "symbols_usd": ["PHG"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Carl Zeiss Meditec AG",
    "symbols_eur": ["AFX.F"],
    "symbols_usd": ["CZMWF"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Diageo PLC",
    "symbols_eur": ["GUIA.F"],
    "symbols_usd": ["DEO"],
    "tags": [
      "Distillers & Wineries",
      "Beverages",
      "Food & Beverages",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Fluor Corporation",
    "symbols_eur": ["FLU.F"],
    "symbols_usd": ["FLR"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Dr\u00e4gerwerk AG & Co. KGaA Vz",
    "symbols_eur": ["DRW3.F"],
    "symbols_usd": ["DGWPF"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "BHP Group",
    "symbols_eur": ["BHP.F"],
    "symbols_usd": ["BHP"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Mattel Inc.",
    "symbols_eur": ["MTT.F"],
    "symbols_usd": ["MAT"],
    "tags": [
      "Cyclical Consumer Products",
      "Leisure Products",
      "Toys & Juvenile Products",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Intuitive Surgical Inc.",
    "symbols_eur": ["IUI1.F"],
    "symbols_usd": ["ISRG"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "E*TRADE Financial Corporation",
    "symbols_eur": ["ETRA.F"],
    "symbols_usd": ["ETFC"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Banking & Brokerage Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PVH Corp.",
    "symbols_eur": ["PVH.F"],
    "symbols_usd": ["PVH"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Teleflex Inc.",
    "symbols_eur": ["TBH.F"],
    "symbols_usd": ["TFX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Atmos Energy Corporation",
    "symbols_eur": ["AEO.F"],
    "symbols_usd": ["ATO"],
    "tags": ["Natural Gas Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cerner Corporation",
    "symbols_eur": ["CRE.F"],
    "symbols_usd": ["CERN"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Pinnacle West Capital Corporation",
    "symbols_eur": ["PWC.F"],
    "symbols_usd": ["PNW"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Outotec Oyj",
    "symbols_eur": ["M6Q.F"],
    "symbols_usd": ["OUKPY"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Wacker Neuson SE",
    "symbols_eur": ["WAC.F"],
    "symbols_usd": ["WKRCF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Dassault Syst\u00e8mes SE",
    "symbols_eur": ["DSY.F"],
    "symbols_usd": ["DASTY"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Deutsche Wohnen SE",
    "symbols_eur": ["DWNI.F"],
    "symbols_usd": ["DTCWY"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Heidelberger Druckmaschinen AG",
    "symbols_eur": ["HDD.F"],
    "symbols_usd": ["HDD"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Telef\u00f3nica Deutschland Holding AG",
    "symbols_eur": ["O2D.F"],
    "symbols_usd": ["TELDF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Nasdaq Inc.",
    "symbols_eur": ["NAQ.F"],
    "symbols_usd": ["NDAQ"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Public Storage",
    "symbols_eur": ["PUP.F"],
    "symbols_usd": ["PSA"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Rosneft",
    "symbols_eur": ["OJS1.F"],
    "symbols_usd": ["OJSCY", "ROSN.ME"],
    "tags": ["Energy", "Fossil Fuels", "Gas"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "ENCE Energ\u00eda y Celulosa SA",
    "symbols_eur": ["ENCA.F"],
    "symbols_usd": [],
    "tags": [
      "Paper & Forest Products",
      "Paper Products",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Aperam SA",
    "symbols_eur": ["7AA.F"],
    "symbols_usd": ["APEMY"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["BEL 20"],
    "country": "Luxembourg"
  },
  {
    "name": "Barratt Developments PLC",
    "symbols_eur": ["BDEV.F"],
    "symbols_usd": ["BDEV"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "E.ON SE",
    "symbols_eur": ["EOAN.F"],
    "symbols_usd": ["ENAKF"],
    "tags": ["Energy"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "NetApp Inc.",
    "symbols_eur": ["NTA.F"],
    "symbols_usd": ["NTAP"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Skanska AB",
    "symbols_eur": ["SKNB.F"],
    "symbols_usd": ["SKSBF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Macerich Company",
    "symbols_eur": ["M6G.F"],
    "symbols_usd": ["MAC"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bertrandt AG",
    "symbols_eur": ["BDT.F"],
    "symbols_usd": ["BDGXF"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Tesco PLC",
    "symbols_eur": ["TCO1.F"],
    "symbols_usd": ["TSCDY"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Avery Dennison Corporation",
    "symbols_eur": ["AV3.F"],
    "symbols_usd": ["AVY"],
    "tags": [
      "Containers & Packaging",
      "Basic Materials",
      "Applied Resources",
      "Non-Paper Containers & Packaging"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Swisscom AG",
    "symbols_eur": ["SWJA.F"],
    "symbols_usd": ["SWZCF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "HOCHTIEF AG",
    "symbols_eur": ["HOT.F"],
    "symbols_usd": ["HOCFY"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Thermo Fisher Scientific Inc.",
    "symbols_eur": ["TN8.F"],
    "symbols_usd": ["TMO"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Schaeffler AG",
    "symbols_eur": ["SHA.F"],
    "symbols_usd": [],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "EssilorLuxottica SA",
    "symbols_eur": ["ESL.F"],
    "symbols_usd": ["ESLOF"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Mechel PAO",
    "symbols_eur": ["MHSE.F"],
    "symbols_usd": ["MTL"],
    "tags": ["Coal", "Metals & Mining", "Mineral Resources"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "The AES Corporation",
    "symbols_eur": ["AES.F"],
    "symbols_usd": ["AES"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Microsoft Corporation",
    "symbols_eur": ["MSF.F"],
    "symbols_usd": ["MSFT"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500", "DOW JONES", "S&P 100", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Equifax Inc.",
    "symbols_eur": ["EFX.F"],
    "symbols_usd": ["EFX"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "F5 Networks Inc.",
    "symbols_eur": ["FFV.F"],
    "symbols_usd": ["FFIV"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "People's United Financial Inc.",
    "symbols_eur": ["PP21.F"],
    "symbols_usd": ["PBCT"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "STROEER SE & CO. KGAA",
    "symbols_eur": ["SAX.F"],
    "symbols_usd": ["SAX"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Regeneron Pharmaceuticals Inc.",
    "symbols_eur": ["RGO.F"],
    "symbols_usd": ["REGN"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ball Corporation",
    "symbols_eur": ["BL8.F"],
    "symbols_usd": ["BLL"],
    "tags": [
      "Containers & Packaging",
      "Basic Materials",
      "Applied Resources",
      "Non-Paper Containers & Packaging"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Molson Coors Brewing Company",
    "symbols_eur": ["NY7.F"],
    "symbols_usd": ["TAP-A"],
    "tags": [
      "Beverages",
      "Food & Beverages",
      "Brewers",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "NMC Health PLC",
    "symbols_eur": ["ON1.F"],
    "symbols_usd": ["NMMCF"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Equity Residential",
    "symbols_eur": [],
    "symbols_usd": ["EQR"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Imperial Brands PLC",
    "symbols_eur": ["ITBA.F"],
    "symbols_usd": ["IMBBF"],
    "tags": [
      "Food & Tobacco",
      "Tobacco",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "DS Smith PLC",
    "symbols_eur": ["1KR.F"],
    "symbols_usd": ["DITHF"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Robert Half International Inc.",
    "symbols_eur": ["RHJ.F"],
    "symbols_usd": ["RHI"],
    "tags": [
      "Industrial & Commercial Services",
      "Employment Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Galapagos NV",
    "symbols_eur": ["GXE.F"],
    "symbols_usd": ["GLPG"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["AEX", "BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Land Securities Group PLC",
    "symbols_eur": ["LSU2.F"],
    "symbols_usd": ["LDSCY"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Agilent Technologies Inc.",
    "symbols_eur": ["AG8.F"],
    "symbols_usd": ["A"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PPL Corporation",
    "symbols_eur": ["PP9.F"],
    "symbols_usd": ["PPL"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Microchip Technology Inc.",
    "symbols_eur": ["MCP.F"],
    "symbols_usd": ["MCHP"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "CME Group Inc.",
    "symbols_eur": ["MX4A.F"],
    "symbols_usd": ["CME"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Experian PLC",
    "symbols_eur": ["J2B.F"],
    "symbols_usd": ["EXPGY"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["FTSE 100"],
    "country": "Ireland"
  },
  {
    "name": "Chipotle Mexican Grill Inc.",
    "symbols_eur": ["C9F.F"],
    "symbols_usd": ["CMG"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Atos SE",
    "symbols_eur": ["AXI.F"],
    "symbols_usd": ["AEXAY"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Biogen Inc.",
    "symbols_eur": ["IDP.F"],
    "symbols_usd": ["BIIB"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Daimler AG",
    "symbols_eur": ["DAI.F"],
    "symbols_usd": ["DDAIF"],
    "tags": [
      "Automotive",
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Honeywell International Inc.",
    "symbols_eur": ["ALD.F"],
    "symbols_usd": ["HON"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Informa PLC",
    "symbols_eur": ["IEA.F"],
    "symbols_usd": ["IFPJF"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Consumer Publishing"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Target Corporation",
    "symbols_eur": ["DYH.F"],
    "symbols_usd": ["TGT"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "ProSiebenSat.1 Media SE",
    "symbols_eur": ["PSM.F"],
    "symbols_usd": ["PBSFY"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "The Sage Group PLC",
    "symbols_eur": ["SGK1.F"],
    "symbols_usd": ["SGPYY"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Unibail-Rodamco-Westfield",
    "symbols_eur": ["1BR1.F"],
    "symbols_usd": ["UNBLF"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["CAC 40", "AEX"],
    "country": "France"
  },
  {
    "name": "Corteva Inc.",
    "symbols_eur": ["2X0.F"],
    "symbols_usd": ["CTVA"],
    "tags": ["Basic Materials", "Agricultural Inputs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Motorola Solutions Inc.",
    "symbols_eur": ["MTLA.F"],
    "symbols_usd": ["MSI"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Packaging Corporation of America",
    "symbols_eur": ["PAR.F"],
    "symbols_usd": ["PKG"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Henry Schein Inc.",
    "symbols_eur": ["HS2.F"],
    "symbols_usd": ["HSIC"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Celgene Corporation",
    "symbols_eur": ["CG3.F"],
    "symbols_usd": ["CELG"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Swiss Re AG",
    "symbols_eur": ["SR9.F"],
    "symbols_usd": ["SSREY"],
    "tags": ["Insurance", "Financials", "Reinsurance"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Adyen N.V.",
    "symbols_eur": ["1N8.F"],
    "symbols_usd": ["ADYYF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Cellnex Telecom SA",
    "symbols_eur": ["472.F"],
    "symbols_usd": ["CLNXF"],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Ackermans & van Haaren N.V.",
    "symbols_eur": ["B3K.F"],
    "symbols_usd": ["AVHNF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Cargotec Corporation",
    "symbols_eur": ["C1C.F"],
    "symbols_usd": ["CYJBY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Automatic Data Processing Inc.",
    "symbols_eur": ["ADP.F"],
    "symbols_usd": ["ADP"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bayerische Motoren Werke AG",
    "symbols_eur": ["BMW.F"],
    "symbols_usd": ["BMWYY"],
    "tags": [
      "Automotive",
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Accenture PLC",
    "symbols_eur": ["CSA.F"],
    "symbols_usd": ["ACN"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "Veolia Environnement SA",
    "symbols_eur": ["VVD.F"],
    "symbols_usd": ["VEOEY"],
    "tags": ["Utilities", "Water Utilities"],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Advanced Micro Devices Inc.",
    "symbols_eur": ["AMD.F"],
    "symbols_usd": ["AMD"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Talanx",
    "symbols_eur": ["TLX.F"],
    "symbols_usd": [],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "DTE Energy Company",
    "symbols_eur": ["DGY.F"],
    "symbols_usd": ["DTE"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Advance Auto Parts Inc.",
    "symbols_eur": ["AWN.F"],
    "symbols_usd": ["AAP"],
    "tags": [
      "Specialty Retailers",
      "Consumer Cyclicals",
      "Retailers",
      "Auto Vehicles, Parts & Service Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Salzgitter AG",
    "symbols_eur": ["SZG.F"],
    "symbols_usd": ["SZGPY"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "OSRAM Licht AG",
    "symbols_eur": ["OSR.F"],
    "symbols_usd": ["OSAGF"],
    "tags": ["Lighting", "Electrical Components & Equipment"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Johnson & Johnson",
    "symbols_eur": ["JNJ.F"],
    "symbols_usd": ["JNJ"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Compagnie G\u00e9n\u00e9rale des \u00e9tablissements Michelin",
    "symbols_eur": ["MCH.F"],
    "symbols_usd": ["MGDDF"],
    "tags": [
      "Tires & Rubber Products",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Kohl's Corporation",
    "symbols_eur": ["KHP.F"],
    "symbols_usd": ["KSS"],
    "tags": [
      "Diversified Retail",
      "Department Stores",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "T. Rowe Price Group Inc.",
    "symbols_eur": ["TR1.F"],
    "symbols_usd": ["TROW"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Wacker Chemie AG",
    "symbols_eur": ["WCH.F"],
    "symbols_usd": ["WKCMF"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Under Armour Inc.",
    "symbols_eur": ["U9R.F", "U9RA.F"],
    "symbols_usd": ["UAA", "UA"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Vivendi SA",
    "symbols_eur": ["VVU.F"],
    "symbols_usd": ["VIVEF"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Entertainment Production",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Total System Services Inc.",
    "symbols_eur": ["TTY.F"],
    "symbols_usd": ["TSS"],
    "tags": ["Integrated Oil & Gas", "Fossil Fuels", "Oil & Gas", "Energy"],
    "indices": ["S&P 500"],
    "country": "France"
  },
  {
    "name": "KONE Oyj",
    "symbols_eur": ["KC4.F"],
    "symbols_usd": ["KNYJF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Heavy Electrical Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Rolls-Royce Holdings PLC",
    "symbols_eur": ["RRU.F"],
    "symbols_usd": ["RYCEF"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "AstraZeneca PLC",
    "symbols_eur": ["ZEG.F"],
    "symbols_usd": ["AZN"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["FTSE 100", "OMX Stockholm 30"],
    "country": "United Kingdom"
  },
  {
    "name": "Nordea Bank Abp",
    "symbols_eur": ["04Q.F"],
    "symbols_usd": ["NRDBY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["OMX Helsinki 25", "OMX Stockholm 30"],
    "country": "Finland"
  },
  {
    "name": "Rh\u00f6n-Klinikum AG",
    "symbols_eur": ["RHK.F"],
    "symbols_usd": ["RHK"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "TechnipFMC PLC",
    "symbols_eur": ["1T1.F"],
    "symbols_usd": ["FTI"],
    "tags": [
      "Oil Related Services and Equipment",
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy"
    ],
    "indices": ["CAC 40", "S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Raymond James Financial Inc.",
    "symbols_eur": ["RJF.F"],
    "symbols_usd": ["RJF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Banking & Brokerage Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Micron Technology Inc.",
    "symbols_eur": ["MTE.F"],
    "symbols_usd": ["MU"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "LKQ Corporation",
    "symbols_eur": ["LKQ1.F"],
    "symbols_usd": ["LKQ"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "easyJet PLC",
    "symbols_eur": ["EJT1.F"],
    "symbols_usd": ["ESYJY"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Autoliv Inc.",
    "symbols_eur": ["LIVS.F"],
    "symbols_usd": ["ALV"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Mid-America Apartment Communities Inc.",
    "symbols_eur": ["M2K.F"],
    "symbols_usd": ["MAA"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Viscofan SA",
    "symbols_eur": ["VIS.F"],
    "symbols_usd": ["VSCFF"],
    "tags": [
      "Containers & Packaging",
      "Basic Materials",
      "Applied Resources",
      "Non-Paper Containers & Packaging"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Legal & General Group PLC",
    "symbols_eur": ["LGI.F"],
    "symbols_usd": ["LGGNY"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Persimmon PLC",
    "symbols_eur": ["OHP.F"],
    "symbols_usd": ["PSMMY"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "The Williams Companies Inc.",
    "symbols_eur": ["WMB.F"],
    "symbols_usd": ["WMB"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Zalando SE",
    "symbols_eur": ["ZAL.F"],
    "symbols_usd": ["ZLDSF"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Dollar General Corporation",
    "symbols_eur": ["7DG.F"],
    "symbols_usd": ["DG"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Hershey Company",
    "symbols_eur": ["HSY.F"],
    "symbols_usd": ["HSY"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Roche Holding AG",
    "symbols_eur": ["RHO.F"],
    "symbols_usd": ["RHHVF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Southwest Airlines Co.",
    "symbols_eur": ["SWN.F"],
    "symbols_usd": ["LUV"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Hartford Financials Group Inc.",
    "symbols_eur": ["HFF.F"],
    "symbols_usd": ["HIG"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Paychex Inc.",
    "symbols_eur": ["PCX.F"],
    "symbols_usd": ["PAYX"],
    "tags": [
      "Industrial & Commercial Services",
      "Employment Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Gap Inc.",
    "symbols_eur": ["GAP.F"],
    "symbols_usd": ["GPS"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Mediaset Espa\u00f1a Comunicaci\u00f3n SA",
    "symbols_eur": ["RWW.F"],
    "symbols_usd": ["MDIUY"],
    "tags": [
      "Cyclical Consumer Services",
      "Broadcasting",
      "Media & Publishing",
      "Consumer Cyclicals"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "AT&T Inc",
    "symbols_eur": ["SOBA.F"],
    "symbols_usd": ["T"],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "DISH Network Corporation",
    "symbols_eur": ["EOT.F"],
    "symbols_usd": ["DISH"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Allergan PLC",
    "symbols_eur": ["A60.F"],
    "symbols_usd": ["AGN"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "Newell Brands Inc.",
    "symbols_eur": ["NWL.F"],
    "symbols_usd": ["NWL"],
    "tags": [
      "Cyclical Consumer Products",
      "Appliances, Tools & Housewares",
      "Household Goods",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Rio Tinto Group",
    "symbols_eur": ["RIOA.F"],
    "symbols_usd": ["RTNTF"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Torchmark Corporation",
    "symbols_eur": ["TMJ.F"],
    "symbols_usd": ["TMK"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "BNP Paribas SA",
    "symbols_eur": ["BNP.F"],
    "symbols_usd": ["BNPQF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "SSAB AB",
    "symbols_eur": ["SKWA.F"],
    "symbols_usd": ["SSAAY"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Dover Corporation",
    "symbols_eur": ["DOV.F"],
    "symbols_usd": ["DOV"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hologic Inc.",
    "symbols_eur": ["HO1.F"],
    "symbols_usd": ["HOLX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "O'Reilly Automotive Inc.",
    "symbols_eur": ["OM6.F"],
    "symbols_usd": ["ORLY"],
    "tags": [
      "Specialty Retailers",
      "Consumer Cyclicals",
      "Retailers",
      "Auto Vehicles, Parts & Service Retailers"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fidelity National Information Services Inc.",
    "symbols_eur": ["ZGY.F"],
    "symbols_usd": ["FIS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Magnitogorsk Iron and Steel Works",
    "symbols_eur": ["MHQ.F"],
    "symbols_usd": ["MAGN.ME"],
    "tags": ["Coal", "Metals & Mining", "Mineral Resources"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Apache Corporation",
    "symbols_eur": ["APA.F"],
    "symbols_usd": ["APA"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Applied Materials Inc.",
    "symbols_eur": ["AP2.F"],
    "symbols_usd": ["AMAT"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Commerzbank AG",
    "symbols_eur": ["CBK.F"],
    "symbols_usd": ["CRZBY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "NEXT PLC",
    "symbols_eur": ["NXG.F"],
    "symbols_usd": ["NXGPF"],
    "tags": [
      "Specialty Retailers",
      "Other Specialty Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Nokia Corporation",
    "symbols_eur": ["NOA3.F"],
    "symbols_usd": ["NOK"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "NN Group N.V.",
    "symbols_eur": ["2NN.F"],
    "symbols_usd": ["NNGPF"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Rocket Internet SE",
    "symbols_eur": ["RKET.F"],
    "symbols_usd": ["RCKZF"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "UDR Inc.",
    "symbols_eur": ["UF0.F"],
    "symbols_usd": ["UDR"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fuchs Petrolub SE",
    "symbols_eur": ["FPE.F"],
    "symbols_usd": ["FUPEF"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Hewlett Packard Enterprise Company",
    "symbols_eur": ["2HP.F"],
    "symbols_usd": ["HPE"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PUMA SE",
    "symbols_eur": ["PUM.F"],
    "symbols_usd": ["PMMAF"],
    "tags": [
      "Textiles & Apparel",
      "Sportswear",
      "Footwear",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Waste Management Inc.",
    "symbols_eur": ["UWS.F"],
    "symbols_usd": ["WM"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "British American Tobacco p.l.c.",
    "symbols_eur": ["BATS.F"],
    "symbols_usd": ["BTAFF"],
    "tags": [
      "Food & Tobacco",
      "Tobacco",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Grenke AG",
    "symbols_eur": ["GLJ.F"],
    "symbols_usd": ["GKSGF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Corporate Financials"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Capital One Financial Corporation",
    "symbols_eur": ["CFX.F"],
    "symbols_usd": ["COF"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Consumer Lending",
      "Banking Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Severn Trent PLC",
    "symbols_eur": ["SVT1.F"],
    "symbols_usd": ["STRNY"],
    "tags": ["Utilities", "Water Utilities"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Tele2 AB",
    "symbols_eur": ["NCYD.F"],
    "symbols_usd": ["TLTZY"],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Lennar Corporation",
    "symbols_eur": ["LNN.F"],
    "symbols_usd": ["LEN"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Carnival Corporation",
    "symbols_eur": ["CVC1.F"],
    "symbols_usd": ["CCL"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Discovery Inc.",
    "symbols_eur": ["DC6.F", "DC6C.F"],
    "symbols_usd": ["DISCA", "DISCK"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Union Pacific Corporation",
    "symbols_eur": ["UNP.F"],
    "symbols_usd": ["UNP"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Edwards Lifesciences Corporation",
    "symbols_eur": ["EWL.F"],
    "symbols_usd": ["EW"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "RTL Group SA",
    "symbols_eur": ["RRTL.F"],
    "symbols_usd": ["RGLXY"],
    "tags": [
      "Cyclical Consumer Services",
      "Broadcasting",
      "Media & Publishing",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "HCP Inc.",
    "symbols_eur": ["HC5.F"],
    "symbols_usd": ["HCP"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Micro Focus International PLC",
    "symbols_eur": ["M7Q7.F"],
    "symbols_usd": ["MFGP"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Perrigo Company PLC",
    "symbols_eur": ["PIG.F"],
    "symbols_usd": ["PRGO"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "VINCI SA",
    "symbols_eur": ["SQU.F"],
    "symbols_usd": ["VCISY"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "T-Mobile US Inc.",
    "symbols_eur": ["TM5.F"],
    "symbols_usd": ["TMUS"],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Ross Stores Inc.",
    "symbols_eur": ["RSO.F"],
    "symbols_usd": ["ROST"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Compagnie de Saint-Gobain SA",
    "symbols_eur": ["GOB.F"],
    "symbols_usd": ["CODGF"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Construction Supplies & Fixtures",
      "Homebuilding / Household Goods"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "AutoZone Inc.",
    "symbols_eur": ["AZ5.F"],
    "symbols_usd": ["AZO"],
    "tags": [
      "Specialty Retailers",
      "Consumer Cyclicals",
      "Retailers",
      "Auto Vehicles, Parts & Service Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Tyson Foods Inc.",
    "symbols_eur": ["TF7A.F"],
    "symbols_usd": ["TSN"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Wirecard AG",
    "symbols_eur": ["WDI.F"],
    "symbols_usd": ["WRCDF"],
    "tags": ["Financials"],
    "indices": ["DAX", "TECDAX"],
    "country": "Germany"
  },
  {
    "name": "HelloFresh SE",
    "symbols_eur": ["HFG.F"],
    "symbols_usd": ["HLFFF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "ONEOK Inc.",
    "symbols_eur": ["ONK.F"],
    "symbols_usd": ["OKE"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "McCormick & Company Inc.",
    "symbols_eur": ["MCX.F"],
    "symbols_usd": ["MKC"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Orange Belgium SA",
    "symbols_eur": ["MOS.F"],
    "symbols_usd": ["OCBI"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Check Point Software Technologies Ltd.",
    "symbols_eur": ["CPW.F"],
    "symbols_usd": ["CHKP"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100"],
    "country": "Israel"
  },
  {
    "name": "HollyFrontier Corporation",
    "symbols_eur": ["HL8.F"],
    "symbols_usd": ["HFC"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Indra Sistemas SA",
    "symbols_eur": ["IDA.F"],
    "symbols_usd": ["ISMAY"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Enag\u00e1s SA",
    "symbols_eur": ["EG4.F"],
    "symbols_usd": ["ENGGF"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "KLOECKNER & CO SE",
    "symbols_eur": ["KCO.F"],
    "symbols_usd": ["KCO"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "NORMA Group SE",
    "symbols_eur": ["NOEJ.F"],
    "symbols_usd": ["NOEJF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "The Royal Bank of Scotland Group PLC",
    "symbols_eur": ["RYS1.F"],
    "symbols_usd": ["RBS"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Adler Real Estate AG",
    "symbols_eur": ["ADL.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "AB Electrolux (publ)",
    "symbols_eur": ["ELX.F"],
    "symbols_usd": ["ELUXY"],
    "tags": [],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Johnson Matthey PLC",
    "symbols_eur": ["JMT2.F"],
    "symbols_usd": ["JMPLY"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Brenntag AG",
    "symbols_eur": ["BNR.F"],
    "symbols_usd": ["BNTGY"],
    "tags": ["Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Evergy Inc.",
    "symbols_eur": ["3E7.F"],
    "symbols_usd": ["EVRG"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Zurich Insurance Group AG",
    "symbols_eur": ["ZFI1.F"],
    "symbols_usd": ["ZFSVF"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Stericycle Inc.",
    "symbols_eur": ["SY9.F"],
    "symbols_usd": ["SRCL"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Etn. Fr. Colruyt NV",
    "symbols_eur": ["EFC1.F"],
    "symbols_usd": ["CUYTF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Fortune Brands Home & Security Inc.",
    "symbols_eur": ["2FB.F"],
    "symbols_usd": ["FBHS"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Construction Supplies & Fixtures",
      "Homebuilding / Household Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "L'Or\u00e9al SA",
    "symbols_eur": ["LOR.F"],
    "symbols_usd": ["LRLCF"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "United Continental Holdings Inc.",
    "symbols_eur": ["UAL1.F"],
    "symbols_usd": ["UAL"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CORESTATE Capital Holding SA",
    "symbols_eur": ["CCAP.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate",
      "Real Estate Services",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "Tiffany & Co.",
    "symbols_eur": ["TIF.F"],
    "symbols_usd": ["TIF"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Novatek",
    "symbols_eur": ["N1O.F"],
    "symbols_usd": ["NOVKY", "NVTK.ME"],
    "tags": ["Gas", "Energy", "Fossil Fuels"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Arthur J. Gallagher & Co.",
    "symbols_eur": ["GAH.F"],
    "symbols_usd": ["AJG"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Arconic Inc.",
    "symbols_eur": ["ALU2.F"],
    "symbols_usd": ["ARNC"],
    "tags": [
      "Metals & Mining",
      "Aluminum",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alexion Pharmaceuticals Inc.",
    "symbols_eur": ["AXP.F"],
    "symbols_usd": ["ALXN"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Vodafone Group PLC",
    "symbols_eur": ["VODI.F"],
    "symbols_usd": ["VOD"],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["NASDAQ 100", "FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Airbus SE",
    "symbols_eur": ["AIR.F"],
    "symbols_usd": ["EADSF"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["CAC 40", "EURO STOXX 50", "MDAX"],
    "country": "Netherlands"
  },
  {
    "name": "Mobile TeleSystems",
    "symbols_eur": ["MKY.F"],
    "symbols_usd": ["MBT", "MTSS.ME"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Bank of America Corporation",
    "symbols_eur": ["NCB.F"],
    "symbols_usd": ["BAC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "National Oilwell Varco Inc.",
    "symbols_eur": ["NO8.F"],
    "symbols_usd": ["NOV"],
    "tags": [
      "Oil Related Services and Equipment",
      "Oil & Gas Related Equipment and Services",
      "Fossil Fuels",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Western Digital Corporation",
    "symbols_eur": ["WDC.F"],
    "symbols_usd": ["WDC"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Marriott International Inc.",
    "symbols_eur": ["MAQ.F"],
    "symbols_usd": ["MAR"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Xylem Inc.",
    "symbols_eur": ["XY6.F"],
    "symbols_usd": ["XYL"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "NRG Energy Inc.",
    "symbols_eur": ["NRA.F"],
    "symbols_usd": ["NRG"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "HCA Healthcare Inc.",
    "symbols_eur": ["2BH.F"],
    "symbols_usd": ["HCA"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Wabtec Corporation",
    "symbols_eur": ["WB2.F"],
    "symbols_usd": ["WAB"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Koninklijke Ahold Delhaize N.V.",
    "symbols_eur": ["AHOD.F"],
    "symbols_usd": ["AHODF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "NetEase Inc.",
    "symbols_eur": ["NEH.F"],
    "symbols_usd": ["NTES"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["NASDAQ 100"],
    "country": "China"
  },
  {
    "name": "Digital Realty Trust Inc.",
    "symbols_eur": ["FQI.F"],
    "symbols_usd": ["DLR"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "MGM Resorts International",
    "symbols_eur": ["MGG.F"],
    "symbols_usd": ["MGM"],
    "tags": [
      "Casinos & Gaming",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "SVB Financial Group",
    "symbols_eur": ["SV4.F"],
    "symbols_usd": ["SIVB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "International Business Machines Corporation",
    "symbols_eur": ["IBM.F"],
    "symbols_usd": ["IBM"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "The Home Depot Inc.",
    "symbols_eur": ["HDI.F"],
    "symbols_usd": ["HD"],
    "tags": [
      "Specialty Retailers",
      "Home Improvement Products & Services Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Extra Space Storage Inc.",
    "symbols_eur": ["FG8.F"],
    "symbols_usd": ["EXR"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "UnitedHealth Group Inc.",
    "symbols_eur": ["UNH.F"],
    "symbols_usd": ["UNH"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Magnit",
    "symbols_eur": ["5M71.F"],
    "symbols_usd": ["MGNT.ME"],
    "tags": ["Consumer Non-Cyclicals", "Food & Beverages", "Food Processing"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Aon PLC",
    "symbols_eur": ["9H6.F"],
    "symbols_usd": ["AON"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Juniper Networks Inc.",
    "symbols_eur": ["JNP.F"],
    "symbols_usd": ["JNPR"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Phoenix Group Holdings PLC",
    "symbols_eur": ["1BF.F"],
    "symbols_usd": ["PNXGF"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Marathon Oil Corporation",
    "symbols_eur": ["USS.F"],
    "symbols_usd": ["MRO"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Costco Wholesale Corporation",
    "symbols_eur": ["CTO.F"],
    "symbols_usd": ["COST"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Scottish Mortgage Investment Trust PLC",
    "symbols_eur": ["1IZ1.F"],
    "symbols_usd": ["STMZF"],
    "tags": ["Financials", "Collective Investments", "Investment Trusts"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Koninklijke Vopak N.V.",
    "symbols_eur": ["VPK5.F"],
    "symbols_usd": ["VOPKF"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Oil & Gas Transportation Services",
      "Energy"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Essity AB",
    "symbols_eur": ["ESW.F"],
    "symbols_usd": ["ESSYY"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Endesa SA",
    "symbols_eur": ["ENA.F"],
    "symbols_usd": ["ELEZF"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Hiscox Ltd",
    "symbols_eur": ["H2X3.F"],
    "symbols_usd": ["HCXLF"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["FTSE 100"],
    "country": "Bermuda"
  },
  {
    "name": "Comcast Corporation",
    "symbols_eur": ["CTP2.F"],
    "symbols_usd": ["CMCSA"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Sodexo SA",
    "symbols_eur": ["SJ7.F"],
    "symbols_usd": ["SDXOF"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "RSA Insurance Group PLC",
    "symbols_eur": ["SUA2.F"],
    "symbols_usd": ["RSNAY"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Telenet Group Holding NV",
    "symbols_eur": ["T4I.F"],
    "symbols_usd": ["TLGHY"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "National Grid PLC",
    "symbols_eur": ["NNGF.F"],
    "symbols_usd": ["NGG"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Halma PLC",
    "symbols_eur": ["H11.F"],
    "symbols_usd": ["HLMAF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Delivery Hero SE",
    "symbols_eur": ["DHER.F"],
    "symbols_usd": ["DLVHF"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Auto Trader Group PLC",
    "symbols_eur": ["AUTO.F"],
    "symbols_usd": ["AUTO"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Taylor Wimpey PLC",
    "symbols_eur": ["TWW.F"],
    "symbols_usd": ["TWODF"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "MSCI Inc.",
    "symbols_eur": ["3HM.F"],
    "symbols_usd": ["MSCI"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "British Land Company PLC",
    "symbols_eur": ["BLDA.F"],
    "symbols_usd": ["BTLCY"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Electronic Arts Inc.",
    "symbols_eur": ["ERT.F"],
    "symbols_usd": ["EA"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hess Corporation",
    "symbols_eur": ["AHC.F"],
    "symbols_usd": ["HES"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Glencore PLC",
    "symbols_eur": ["8GCA.F"],
    "symbols_usd": ["GLNCY"],
    "tags": ["Energy", "Fossil Fuels", "Coal"],
    "indices": ["FTSE 100"],
    "country": "Switzerland"
  },
  {
    "name": "Compagnie financiere Richemont SA",
    "symbols_eur": ["RITN.F"],
    "symbols_usd": ["CFRHF"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "S&P Global Inc.",
    "symbols_eur": ["MHL.F"],
    "symbols_usd": ["SPGI"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Kimco Realty Corporation",
    "symbols_eur": ["KIC.F"],
    "symbols_usd": ["KIM-PI"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hamborner REIT AG",
    "symbols_eur": ["HAB.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Smiths Group PLC",
    "symbols_eur": ["QS2A.F"],
    "symbols_usd": ["SMGZY"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "TAG Immobilien AG",
    "symbols_eur": ["TEG.F"],
    "symbols_usd": ["TAGOF"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Smurfit Kappa Group PLC",
    "symbols_eur": ["SK3.F"],
    "symbols_usd": ["SMFTF"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "Ireland"
  },
  {
    "name": "Pentair PLC",
    "symbols_eur": ["PNT.F"],
    "symbols_usd": ["PNR"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Hugo Boss AG",
    "symbols_eur": ["BOSS.F"],
    "symbols_usd": ["BOSSY"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Crown Castle International Corp",
    "symbols_eur": ["8CW.F"],
    "symbols_usd": ["CCI"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Hanesbrands Inc.",
    "symbols_eur": ["HN9.F"],
    "symbols_usd": ["HBI"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "FleetCor Technologies Inc.",
    "symbols_eur": ["07G.F"],
    "symbols_usd": ["FLT"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Credit Suisse Group AG",
    "symbols_eur": ["CSX.F"],
    "symbols_usd": ["CS"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Expedia Group Inc.",
    "symbols_eur": ["E3X1.F"],
    "symbols_usd": ["EXPE"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Polymetal International",
    "symbols_eur": ["PM6.F"],
    "symbols_usd": ["AUCOY", "POLY.ME"],
    "tags": ["Gold", "Mineral Resources", "Metals & Mining", "Basic Materials"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Deutsche B\u00f6rse AG",
    "symbols_eur": ["DB1.F"],
    "symbols_usd": ["DBOEY"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Hennes & Mauritz",
    "symbols_eur": ["HMSB.F"],
    "symbols_usd": ["HMRZF"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Equinix Inc. (REIT)",
    "symbols_eur": ["EQN2.F"],
    "symbols_usd": ["EQIX"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "UBS Group AG",
    "symbols_eur": ["0UB.F"],
    "symbols_usd": ["UBS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "SEGRO PLC",
    "symbols_eur": ["S4VC.F"],
    "symbols_usd": ["ESGRO"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "JSC PhosAgro",
    "symbols_eur": ["P6SG.F"],
    "symbols_usd": ["PHOJY", "PHOR.ME"],
    "tags": ["Chemicals", "Diversified Chemicals", "Basic Materials"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "JUNGHEINRICH AG",
    "symbols_eur": ["JUN3.F"],
    "symbols_usd": [],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "United Company RUSAL",
    "symbols_eur": ["R6L.F"],
    "symbols_usd": ["RUAL.ME"],
    "tags": ["Aluminium"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Ameriprise Financial Inc.",
    "symbols_eur": ["A4S.F"],
    "symbols_usd": ["AMP"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "PACCAR Inc",
    "symbols_eur": ["PAE.F"],
    "symbols_usd": ["PCAR"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "First Republic Bank",
    "symbols_eur": ["81R.F"],
    "symbols_usd": ["FRC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fraport AG",
    "symbols_eur": ["FRA.F"],
    "symbols_usd": ["FPRUF"],
    "tags": [
      "Transport Infrastructure",
      "Industrials",
      "Airport Services",
      "Transportation"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Arista Networks Inc.",
    "symbols_eur": ["117.F"],
    "symbols_usd": ["ANET"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Consolidated Edison Inc.",
    "symbols_eur": ["EDC.F"],
    "symbols_usd": ["ED"],
    "tags": [
      "Residential REITs",
      "Financials",
      "Consumer Cyclicals",
      "Real Estate",
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Residential & Commercial RETIs",
      "Hotels & Entertainment Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deutsche EuroShop AG",
    "symbols_eur": ["DEQ.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Anglo American PLC",
    "symbols_eur": ["NGLD.F"],
    "symbols_usd": ["AGPPF"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Evotec SE",
    "symbols_eur": ["EVT.F"],
    "symbols_usd": ["EVTCY"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Emerson Electric Co.",
    "symbols_eur": ["EMR.F"],
    "symbols_usd": ["EMR"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Koninklijke KPN N.V.",
    "symbols_eur": ["KPN.F"],
    "symbols_usd": ["KKPNF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Baxter International Inc.",
    "symbols_eur": ["BTL.F"],
    "symbols_usd": ["BAX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Align Technology Inc.",
    "symbols_eur": ["AFW.F"],
    "symbols_usd": ["ALGN"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "International Consolidated Airlines Group SA",
    "symbols_eur": ["INR.F"],
    "symbols_usd": ["ICAGY"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["IBEX 35", "FTSE 100"],
    "country": "United States"
  },
  {
    "name": "Kinder Morgan Inc.",
    "symbols_eur": ["2KD.F"],
    "symbols_usd": ["KMI"],
    "tags": [
      "Fossil Fuels",
      "Oil & Gas Related Equipment and Services",
      "Energy",
      "Oil & Gas Transportation Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Novolipetsk Steel",
    "symbols_eur": ["N7MG.F"],
    "symbols_usd": ["NLMK.ME"],
    "tags": ["Steel"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Yandex N.V.",
    "symbols_eur": ["YDX.F"],
    "symbols_usd": ["YNDX", "YNDX.ME"],
    "tags": ["Search engine", "Internet"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Fresenius Medical Care AG & Co. KGaA St",
    "symbols_eur": ["FME.F"],
    "symbols_usd": ["FMS"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Nektar Therapeutics",
    "symbols_eur": ["ITH.F"],
    "symbols_usd": ["NKTR"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "HeidelbergCement AG",
    "symbols_eur": ["HEI.F"],
    "symbols_usd": ["HLBZF"],
    "tags": [
      "Building materials",
      "Mineral Resources",
      "Construction Materials",
      "Basic Materials"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "TripAdvisor Inc.",
    "symbols_eur": ["T6A.F"],
    "symbols_usd": ["TRIP"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Inmobiliaria Colonial, SOCIMI SA",
    "symbols_eur": [],
    "symbols_usd": ["COL.MC"],
    "tags": [
      "Real Estate Operations",
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name":
        "LVMH Mo\u00ebt Hennessy - Louis Vuitton, Soci\u00e9t\u00e9 Europ\u00e9enne",
    "symbols_eur": ["MOH.F"],
    "symbols_usd": ["LVMHF"],
    "tags": [
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Textiles & Apparel",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "YUM! Brands Inc.",
    "symbols_eur": ["TGR.F"],
    "symbols_usd": ["YUM"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Burberry Group PLC",
    "symbols_eur": ["BB2.F"],
    "symbols_usd": ["BURBY"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Lloyds Banking Group PLC",
    "symbols_eur": ["LLD2.F"],
    "symbols_usd": ["LYG"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Starbucks Corporation",
    "symbols_eur": ["SRB.F"],
    "symbols_usd": ["SBUX"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Campbell Soup Company",
    "symbols_eur": ["CSC.F"],
    "symbols_usd": ["CPB"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "American Electric Power Company Inc.",
    "symbols_eur": ["AEP.F"],
    "symbols_usd": ["AEP"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Mapfre SA",
    "symbols_eur": ["CMAB.F"],
    "symbols_usd": ["MPFRY"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Anheuser-Busch InBev SA/NV",
    "symbols_eur": ["1NBA.F"],
    "symbols_usd": ["BUD"],
    "tags": [
      "Beverages",
      "Food & Beverages",
      "Brewers",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Standard Chartered PLC",
    "symbols_eur": ["STD.F"],
    "symbols_usd": ["SCBFF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Associated British Foods PLC",
    "symbols_eur": ["ABF.F"],
    "symbols_usd": ["ABF"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Vossloh AG",
    "symbols_eur": ["VOS.F"],
    "symbols_usd": ["VOSSF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "LEONI AG",
    "symbols_eur": ["LEO.F"],
    "symbols_usd": ["LNNNY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Newmont Goldcorp Corporation",
    "symbols_eur": ["NMM.F"],
    "symbols_usd": ["NEM"],
    "tags": ["Metals & Mining", "Mineral Resources", "Basic Materials", "Gold"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Celanese Corporation",
    "symbols_eur": ["DG3.F"],
    "symbols_usd": ["CE"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Aroundtown SA",
    "symbols_eur": ["AT1.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["MDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "United Technologies Corporation",
    "symbols_eur": ["UTC1.F"],
    "symbols_usd": ["UTX"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Harris Corporation",
    "symbols_eur": ["HRS.F"],
    "symbols_usd": ["HRS"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Liberty Global PLC",
    "symbols_eur": ["1LG.F", "1LGC.F"],
    "symbols_usd": ["LBTYA", "LBTYK"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Baker Hughes, a GE Company",
    "symbols_eur": ["68V.F"],
    "symbols_usd": ["BHGE"],
    "tags": [
      "Oil Related Services and Equipment",
      "Oil & Gas Related Equipment and Services",
      "Fossil Fuels",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "United Parcel Service Inc.",
    "symbols_eur": ["UPAB.F"],
    "symbols_usd": ["UPS"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Concho Resources Inc.",
    "symbols_eur": ["KIJ.F"],
    "symbols_usd": ["CXO"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Citigroup Inc.",
    "symbols_eur": ["TRVC.F"],
    "symbols_usd": ["C"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "M\u00fcnchener R\u00fcckversicherungs-Gesellschaft AG",
    "symbols_eur": ["MUV2.F"],
    "symbols_usd": ["MURGY"],
    "tags": ["Insurance", "Financials", "Reinsurance"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Hormel Foods Corporation",
    "symbols_eur": ["HO7.F"],
    "symbols_usd": ["HRL"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "TransDigm Group Inc.",
    "symbols_eur": ["T7D.F"],
    "symbols_usd": ["TDG"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alliance Data Systems Corporation",
    "symbols_eur": ["LID.F"],
    "symbols_usd": ["ADS"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "SGL CARBON SE",
    "symbols_eur": ["SGL.F"],
    "symbols_usd": [],
    "tags": [
      "Metals & Mining",
      "Specialty Mining & Metals",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "JD.com Inc.",
    "symbols_eur": ["013A.F"],
    "symbols_usd": ["JD"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["NASDAQ 100"],
    "country": "China"
  },
  {
    "name": "Lonza Group Ltd",
    "symbols_eur": ["LO3.F"],
    "symbols_usd": ["LZAGF"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "CRH PLC",
    "symbols_eur": ["CRG.F"],
    "symbols_usd": ["CRH"],
    "tags": ["Basic Materials", "Construction Materials", "Mineral Resources"],
    "indices": ["FTSE 100"],
    "country": "Ireland"
  },
  {
    "name": "Halliburton Company",
    "symbols_eur": ["HAL.F"],
    "symbols_usd": ["HAL"],
    "tags": [
      "Oil Related Services and Equipment",
      "Oil & Gas Related Equipment and Services",
      "Fossil Fuels",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Schlumberger Limited",
    "symbols_eur": ["SCL.F"],
    "symbols_usd": ["SLB"],
    "tags": [
      "Oil Related Services and Equipment",
      "Oil & Gas Related Equipment and Services",
      "Fossil Fuels",
      "Energy"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Surgutneftegas",
    "symbols_eur": ["SGNV.F"],
    "symbols_usd": ["SNGS.ME", "SGTPY"],
    "tags": ["Oil & Gas", "Fossil Fuels", "Energy"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Medigene AG",
    "symbols_eur": ["MDG1.F"],
    "symbols_usd": ["MDGEF"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Duke Realty Corporation",
    "symbols_eur": ["DUR.F"],
    "symbols_usd": ["DRE"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Procter & Gamble Company",
    "symbols_eur": ["PRG.F"],
    "symbols_usd": ["PG"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "United Rentals Inc.",
    "symbols_eur": ["UR3.F"],
    "symbols_usd": ["URI"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Essex Property Trust Inc.",
    "symbols_eur": ["EXP.F"],
    "symbols_usd": ["ESS"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Caterpillar Inc.",
    "symbols_eur": ["CAT1.F"],
    "symbols_usd": ["CAT"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "VTB Bank",
    "symbols_eur": ["KYM1.F"],
    "symbols_usd": ["VTBR.ME"],
    "tags": ["Banking"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "MTU Aero Engines AG",
    "symbols_eur": ["MTX.F"],
    "symbols_usd": ["MTUAF"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Intercontinental Exchange Inc.",
    "symbols_eur": ["IC2.F"],
    "symbols_usd": ["ICE"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Financial & Commodity Market Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "WEC Energy Group Inc.",
    "symbols_eur": ["WIC.F"],
    "symbols_usd": ["WEC"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bilfinger SE",
    "symbols_eur": ["GBF.F"],
    "symbols_usd": ["BFLBY"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Analog Devices Inc.",
    "symbols_eur": ["ANL.F"],
    "symbols_usd": ["ADI"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "CIE Automotive SA",
    "symbols_eur": ["CAD.F"],
    "symbols_usd": [],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "PayPal Holdings Inc.",
    "symbols_eur": ["2PP.F"],
    "symbols_usd": ["PYPL"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "L Brands Inc.",
    "symbols_eur": ["LTD.F"],
    "symbols_usd": ["LB"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "RusHydro",
    "symbols_eur": ["RG2A.F"],
    "symbols_usd": ["RSHYY"],
    "tags": ["Hydroelectrical power", "Electric utility"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Svenska Handelsbanken AB",
    "symbols_eur": ["SVHH.F"],
    "symbols_usd": ["SVNLY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Macy's Inc",
    "symbols_eur": ["FDO.F"],
    "symbols_usd": ["M"],
    "tags": [
      "Diversified Retail",
      "Department Stores",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "General Electric Company",
    "symbols_eur": ["GEC.F"],
    "symbols_usd": ["GE"],
    "tags": [],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "AXA SA",
    "symbols_eur": ["AXAA.F"],
    "symbols_usd": ["AXAHF"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["CAC 40", "EURO STOXX 50"],
    "country": "France"
  },
  {
    "name": "Kimberly-Clark Corporation",
    "symbols_eur": ["KMY.F"],
    "symbols_usd": ["KMB"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Apartment Investment and Management Company",
    "symbols_eur": ["AIV1.F"],
    "symbols_usd": ["AIV"],
    "tags": [
      "Financials",
      "Residential REITs",
      "Residential & Commercial RETIs",
      "Real Estate"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CTS Eventim AG & Co. KGaA",
    "symbols_eur": ["EVD.F"],
    "symbols_usd": [],
    "tags": ["Ticket distribution"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "SHOP APOTHEKE EUROPE N.V.",
    "symbols_eur": ["SAE.F"],
    "symbols_usd": ["SAE"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Food & Drug Retailing",
      "Drug Retailers"
    ],
    "indices": ["SDAX"],
    "country": "Netherlands"
  },
  {
    "name": "J Sainsbury PLC",
    "symbols_eur": ["SUY1.F"],
    "symbols_usd": ["JSAIY"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "CaixaBank SA",
    "symbols_eur": ["48CA.F"],
    "symbols_usd": ["CAIXY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Maxim Integrated Products Inc.",
    "symbols_eur": ["MXI.F"],
    "symbols_usd": ["MXIM"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Genuine Parts Company",
    "symbols_eur": ["GPT.F"],
    "symbols_usd": ["GPC"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Qorvo Inc.",
    "symbols_eur": ["2QO.F"],
    "symbols_usd": ["QRVO"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "X5 Retail Group",
    "symbols_eur": ["PJP.F"],
    "symbols_usd": ["FIVE.ME"],
    "tags": ["retail"],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "D.R. Horton Inc.",
    "symbols_eur": ["HO2.F"],
    "symbols_usd": ["DHI"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "adidas AG",
    "symbols_eur": ["ADS.F"],
    "symbols_usd": ["ADDDF"],
    "tags": [
      "Cyclical Consumer Products",
      "Sportswear",
      "Textiles & Apparel",
      "Consumer Cyclicals",
      "Footwear",
      "Toiletries"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Nordex SE",
    "symbols_eur": ["NDX1.F"],
    "symbols_usd": ["NRDXF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Heavy Electrical Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "Direct Line Insurance Group PLC",
    "symbols_eur": ["D1LN.F"],
    "symbols_usd": ["DIISY"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Ulta Beauty Inc.",
    "symbols_eur": ["34.F"],
    "symbols_usd": ["ULTA"],
    "tags": [
      "Specialty Retailers",
      "Other Specialty Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Rostelecom",
    "symbols_eur": ["RTL.F"],
    "symbols_usd": ["ROSYY", "RTKM.ME"],
    "tags": [
      "Integrated Telecommunications Services",
      "Telecommunications Services"
    ],
    "indices": ["MOEX"],
    "country": "Russia"
  },
  {
    "name": "Infineon Technologies AG",
    "symbols_eur": ["IFX.F"],
    "symbols_usd": ["IFNNF"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["DAX", "TECDAX"],
    "country": "Germany"
  },
  {
    "name": "Whirlpool Corporation",
    "symbols_eur": ["WHR.F"],
    "symbols_usd": ["WHR"],
    "tags": [
      "Cyclical Consumer Products",
      "Appliances, Tools & Housewares",
      "Household Goods",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Discover Financials",
    "symbols_eur": ["DC7.F"],
    "symbols_usd": ["DFS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Consumer Lending",
      "Banking Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Grifols SA",
    "symbols_eur": ["OZTA.F"],
    "symbols_usd": ["GIFLF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Heineken N.V.",
    "symbols_eur": ["4H5.F"],
    "symbols_usd": ["HINKF"],
    "tags": [
      "Beverages",
      "Food & Beverages",
      "Brewers",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "IQVIA Holdings Inc.",
    "symbols_eur": ["QTS.F"],
    "symbols_usd": ["IQV"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alfa Laval AB",
    "symbols_eur": ["AA9.F"],
    "symbols_usd": ["ALFVY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Huntington Bancshares Inc.",
    "symbols_eur": ["HU3.F"],
    "symbols_usd": ["HBANN"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cimarex Energy Co.",
    "symbols_eur": ["ENY.F"],
    "symbols_usd": ["XEC"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Borussia Dortmund GmbH & Co. Kommanditgesellschaft auf Aktien",
    "symbols_eur": ["BVB.F"],
    "symbols_usd": ["BORUF"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "FedEx Corporation",
    "symbols_eur": ["FDX.F"],
    "symbols_usd": ["FDX"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Transportation",
      "Air Freight & Courier Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Berkshire Hathaway Inc.",
    "symbols_eur": ["BRYN.F"],
    "symbols_usd": ["BRK-B"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "S\u00fcdzucker AG",
    "symbols_eur": ["SZU.F"],
    "symbols_usd": [],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "ITV PLC",
    "symbols_eur": ["IJ7.F"],
    "symbols_usd": ["ITVPF"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Invesco Ltd.",
    "symbols_eur": ["3IW.F"],
    "symbols_usd": ["IVZ"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The PNC Financials Group Inc.",
    "symbols_eur": ["PNP.F"],
    "symbols_usd": ["PNC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Umicore SA",
    "symbols_eur": ["NVJP.F"],
    "symbols_usd": ["UMICF"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Environmental Services & Equipment"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Albemarle Corporation",
    "symbols_eur": ["AMC.F"],
    "symbols_usd": ["ALB"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Sherwin-Williams Company",
    "symbols_eur": ["SJ3.F"],
    "symbols_usd": ["SHW"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Spirax-Sarco Engineering PLC",
    "symbols_eur": ["1LNB.F"],
    "symbols_usd": ["SPXSF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "innogy SE",
    "symbols_eur": ["IGY.F"],
    "symbols_usd": ["INNYY"],
    "tags": [
      "Utilities",
      "Electric Utilities & IPPs",
      "Energy",
      "Electric Utilities"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Cummins Inc.",
    "symbols_eur": ["CUM.F"],
    "symbols_usd": ["CMI"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Cooper Companies Inc.",
    "symbols_eur": ["CP6.F"],
    "symbols_usd": ["COO"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "UPM-Kymmene Oyj",
    "symbols_eur": ["RPL.F"],
    "symbols_usd": ["UPMKF"],
    "tags": [],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Soci\u00e9t\u00e9 G\u00e9n\u00e9rale SA",
    "symbols_eur": ["SGE.F"],
    "symbols_usd": ["SCGLF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Expeditors International of Washington Inc.",
    "symbols_eur": ["EW1.F"],
    "symbols_usd": ["EXPD"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Transportation",
      "Air Freight & Courier Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Host Hotels & Resorts Inc.",
    "symbols_eur": ["HMT.F"],
    "symbols_usd": ["HST"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "XING AG",
    "symbols_eur": ["O1BC.F"],
    "symbols_usd": ["O1BC"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["TECDAX", "SDAX"],
    "country": "Germany"
  },
  {
    "name": "HORNBACH HOLDING AG&CO.KGAA",
    "symbols_eur": ["HBH.F"],
    "symbols_usd": ["HBH"],
    "tags": [
      "Specialty Retailers",
      "Home Improvement Products & Services Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Exelon Corporation",
    "symbols_eur": ["PEO.F"],
    "symbols_usd": ["EXC"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Alphabet Inc.",
    "symbols_eur": ["ABEC.F", "ABEA.F"],
    "symbols_usd": ["GOOGL", "GOOG"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Mylan N.V.",
    "symbols_eur": ["6MY.F"],
    "symbols_usd": ["MYL"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United Kingdom"
  },
  {
    "name": "Lam Research Corporation",
    "symbols_eur": ["LAR.F"],
    "symbols_usd": ["LRCX"],
    "tags": [
      "Technology Equipment",
      "Semiconductor Equipment & Testing",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Naturgy Energy Group SA",
    "symbols_eur": ["GAN.F"],
    "symbols_usd": ["GASNF"],
    "tags": ["Regulated Gas"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Chevron Corporation",
    "symbols_eur": ["CHV.F"],
    "symbols_usd": ["CVX"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Sealed Air Corporation",
    "symbols_eur": ["SDA.F"],
    "symbols_usd": ["SEE"],
    "tags": [
      "Containers & Packaging",
      "Basic Materials",
      "Applied Resources",
      "Non-Paper Containers & Packaging"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Walgreens Boots Alliance Inc.",
    "symbols_eur": ["W8A.F"],
    "symbols_usd": ["WBA"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Food & Drug Retailing",
      "Drug Retailers"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Marsh & McLennan Companies Inc.",
    "symbols_eur": ["MSN.F"],
    "symbols_usd": ["MMC"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Entergy Corporation",
    "symbols_eur": ["ETY.F"],
    "symbols_usd": ["ETR"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Affiliated Managers Group Inc.",
    "symbols_eur": ["AFS.F"],
    "symbols_usd": ["AMG"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Management & Fund Operators"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "McDonald's Corporation",
    "symbols_eur": ["MDO.F"],
    "symbols_usd": ["MCD"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Bankinter SA",
    "symbols_eur": ["BAKA.F"],
    "symbols_usd": ["BKNIY"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Engie SA",
    "symbols_eur": ["GZF.F"],
    "symbols_usd": ["ENGIY"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "WellCare Health Plans Inc.",
    "symbols_eur": ["UWQ.F"],
    "symbols_usd": ["WCG"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Vonovia SE",
    "symbols_eur": ["VNA.F"],
    "symbols_usd": ["VNNVF"],
    "tags": [
      "Real Estate Development & Operations",
      "Real Estate",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Solvay SA",
    "symbols_eur": ["SOL.F"],
    "symbols_usd": ["SOBS"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Industria de Dise\u00f1o Textil SA",
    "symbols_eur": ["IXD1.F"],
    "symbols_usd": ["IDEXF"],
    "tags": [
      "Specialty Retailers",
      "Apparel & Accessories Retailers",
      "Consumer Cyclicals",
      "Retailers"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Unilever PLC",
    "symbols_eur": ["UNVB.F"],
    "symbols_usd": ["UL"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal Products",
      "Personal & Household Products & Services"
    ],
    "indices": ["AEX", "FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "AB Volvo",
    "symbols_eur": ["VOL4.F"],
    "symbols_usd": ["VOLAF"],
    "tags": ["Automotive"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "QIAGEN N.V.",
    "symbols_eur": ["QIA.F"],
    "symbols_usd": ["QGEN"],
    "tags": [
      "Healthcare",
      "Biotechnology & Medical Research",
      "Pharmaceuticals & Medical Research"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Netherlands"
  },
  {
    "name": "Assurant Inc.",
    "symbols_eur": ["AIZ.F"],
    "symbols_usd": ["AIZ"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Gerresheimer AG",
    "symbols_eur": ["GXI.F"],
    "symbols_usd": ["GRRMF"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "PerkinElmer Inc.",
    "symbols_eur": ["PKN.F"],
    "symbols_usd": ["PKI"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Accor SA",
    "symbols_eur": ["ACR1.F"],
    "symbols_usd": ["ACCYY"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Siemens Healthineers AG",
    "symbols_eur": ["SHL.F"],
    "symbols_usd": ["SMMNY"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Axel Springer SE",
    "symbols_eur": ["SPR.F"],
    "symbols_usd": ["AXELF"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Consumer Publishing"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Ferguson PLC",
    "symbols_eur": ["24W5.F"],
    "symbols_usd": ["FERGY"],
    "tags": ["Building materials"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "The Interpublic Group of Companies Inc.",
    "symbols_eur": ["IPG.F"],
    "symbols_usd": ["IPG"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Advertising & Marketing",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Telia Company AB (publ)",
    "symbols_eur": ["ZWS.F"],
    "symbols_usd": ["TLSNY"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["OMX Helsinki 25", "OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Facebook Inc.",
    "symbols_eur": ["FB2A.F"],
    "symbols_usd": ["FB"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Norwegian Cruise Line Holdings Ltd.",
    "symbols_eur": ["1NC.F"],
    "symbols_usd": ["NCLH"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Loews Corporation",
    "symbols_eur": ["LTR.F"],
    "symbols_usd": ["L"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Lamb Weston Holdings Inc.",
    "symbols_eur": ["0L5.F"],
    "symbols_usd": ["LW"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Consumer Non-Cyclicals",
      "Fishing & Farming"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Skyworks Solutions Inc.",
    "symbols_eur": ["AWM.F"],
    "symbols_usd": ["SWKS"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "K+S AG",
    "symbols_eur": ["SDF.F"],
    "symbols_usd": ["KPLUY"],
    "tags": ["Basic Materials", "Chemicals", "Agricultural Chemicals"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Whitbread PLC",
    "symbols_eur": [],
    "symbols_usd": ["WHF4", "WTBDY"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Nemetschek SE",
    "symbols_eur": ["NEM.F"],
    "symbols_usd": ["NEMTF"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "HAPAG-LLOYD AG NA O.N",
    "symbols_eur": ["HLAG.F"],
    "symbols_usd": [],
    "tags": [
      "Marine Freight & Logistics",
      "Freight & Logistics Services",
      "Industrials",
      "Transportation"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Aptiv PLC",
    "symbols_eur": ["D7A.F"],
    "symbols_usd": ["APTV"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "HSBC Holdings PLC",
    "symbols_eur": ["HBC1.F"],
    "symbols_usd": ["HSBC"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "PulteGroup Inc.",
    "symbols_eur": ["PU7.F"],
    "symbols_usd": ["PHM"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Apple Inc.",
    "symbols_eur": ["APC.F"],
    "symbols_usd": ["AAPL"],
    "tags": [
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Phones & Handheld Devices",
      "Technology"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "freenet AG",
    "symbols_eur": ["FNTN.F"],
    "symbols_usd": ["FRTAF"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Barclays PLC",
    "symbols_eur": ["BCY2.F"],
    "symbols_usd": ["INPTF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Devon Energy Corporation",
    "symbols_eur": ["DY6.F"],
    "symbols_usd": ["DVN"],
    "tags": [
      "Oil & Gas Exploration and Production",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bechtle AG",
    "symbols_eur": ["BC8.F"],
    "symbols_usd": [],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Jacobs Engineering Group Inc.",
    "symbols_eur": ["JEG.F"],
    "symbols_usd": ["JEC"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Prudential Financial Inc.",
    "symbols_eur": ["PLL.F"],
    "symbols_usd": ["PRU"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Fifth Third Bancorp",
    "symbols_eur": ["FFH.F"],
    "symbols_usd": ["FITB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CenturyLink Inc.",
    "symbols_eur": ["CYT.F"],
    "symbols_usd": ["CTL"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "INDUS HOLDING AG",
    "symbols_eur": ["INH.F"],
    "symbols_usd": [],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Danone SA",
    "symbols_eur": ["BSN.F"],
    "symbols_usd": ["GPDNF"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Dollar Tree Inc.",
    "symbols_eur": ["DT3.F"],
    "symbols_usd": ["DLTR"],
    "tags": [
      "Discount Stores",
      "Diversified Retail",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "CenterPoint Energy Inc.",
    "symbols_eur": ["HOU.F"],
    "symbols_usd": ["CNP-PB"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Allstate Corporation",
    "symbols_eur": ["ALS.F"],
    "symbols_usd": ["ALL"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Covestro AG",
    "symbols_eur": ["1COV.F"],
    "symbols_usd": ["COVTY"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Martin Marietta Materials Inc.",
    "symbols_eur": ["MMX.F"],
    "symbols_usd": ["MLM"],
    "tags": ["Basic Materials", "Construction Materials", "Mineral Resources"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Symantec Corporation",
    "symbols_eur": ["SYM.F"],
    "symbols_usd": ["SYMC"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "YIT Oyj",
    "symbols_eur": ["YIT.F"],
    "symbols_usd": ["YITYF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Hamburger Hafen und Logistik AG",
    "symbols_eur": ["HHFA.F"],
    "symbols_usd": ["HHULY"],
    "tags": [
      "Transport Infrastructure",
      "Industrials",
      "Transportation",
      "Marine Port Services"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Hilton Worldwide Holdings Inc.",
    "symbols_eur": ["HI91.F"],
    "symbols_usd": ["HLT"],
    "tags": [
      "Cyclical Consumer Services",
      "Consumer Cyclicals",
      "Hotels & Entertainment Services",
      "Hotels, Motels & Cruise Lines"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "SGS SA",
    "symbols_eur": ["SUVN.F"],
    "symbols_usd": ["SGSOY"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Keysight Technologies Inc.",
    "symbols_eur": ["1KT.F"],
    "symbols_usd": ["KEYS"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Antofagasta PLC",
    "symbols_eur": ["FG1.F"],
    "symbols_usd": ["ANFGF"],
    "tags": [
      "Metals & Mining",
      "Specialty Mining & Metals",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Nokian Renkaat Oyj",
    "symbols_eur": ["NRE.F"],
    "symbols_usd": ["NKRKY"],
    "tags": [
      "Tires & Rubber Products",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Broadcom Inc.",
    "symbols_eur": ["1YD.F"],
    "symbols_usd": ["AVGO"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "IMCD N.V.",
    "symbols_eur": ["INX.F"],
    "symbols_usd": ["IMDZF"],
    "tags": ["Chemicals"],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Walmart Inc.",
    "symbols_eur": ["WMT.F"],
    "symbols_usd": ["WMT"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "The Progressive Corporation",
    "symbols_eur": ["PGV.F"],
    "symbols_usd": ["PGR"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Pernod Ricard SA",
    "symbols_eur": ["PER.F"],
    "symbols_usd": ["PDRDF"],
    "tags": [
      "Distillers & Wineries",
      "Beverages",
      "Food & Beverages",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Zions Bancorporation, National Association",
    "symbols_eur": ["ZB1.F"],
    "symbols_usd": ["ZION"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "TLG Immobilien AG",
    "symbols_eur": ["TLG.F"],
    "symbols_usd": ["TLMMF"],
    "tags": [
      "Real Estate",
      "Real Estate Services",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "DNA Oyj",
    "symbols_eur": ["24D.F"],
    "symbols_usd": [],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Mastercard Inc.",
    "symbols_eur": ["M4I.F"],
    "symbols_usd": ["MA"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "A. O. Smith Corporation",
    "symbols_eur": ["3SM.F"],
    "symbols_usd": ["AOS"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bristol-Myers Squibb Company",
    "symbols_eur": ["BRM.F"],
    "symbols_usd": ["BMY"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Comerica Inc.",
    "symbols_eur": ["CA3.F"],
    "symbols_usd": ["CMA"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "S&T AG",
    "symbols_eur": ["SANT.F"],
    "symbols_usd": ["SANT"],
    "tags": [
      "Computer Hardware",
      "Computers, Phones & Household Electronics",
      "Technology Equipment",
      "Technology"
    ],
    "indices": ["TECDAX", "SDAX"],
    "country": "Austria"
  },
  {
    "name": "RELX PLC",
    "symbols_eur": ["RDED.F"],
    "symbols_usd": ["RELX"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["AEX", "FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Morgan Stanley",
    "symbols_eur": ["DWD.F"],
    "symbols_usd": ["MS"],
    "tags": [
      "Financials",
      "Banking & Investment Services",
      "Investment Banking & Investment Services",
      "Investment Banking & Brokerage Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Geberit AG",
    "symbols_eur": ["GBRA.F"],
    "symbols_usd": ["GBERY"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Construction Supplies & Fixtures",
      "Homebuilding / Household Goods"
    ],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "KWS SAAT SE",
    "symbols_eur": ["KWS.F"],
    "symbols_usd": [],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Consumer Non-Cyclicals",
      "Fishing & Farming"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Kesko Oyj",
    "symbols_eur": ["KEK.F"],
    "symbols_usd": ["KKOYF"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Masco Corporation",
    "symbols_eur": ["MSQ.F"],
    "symbols_usd": ["MAS"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Construction Supplies & Fixtures",
      "Homebuilding / Household Goods"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Verizon Communications Inc.",
    "symbols_eur": ["BAC.F"],
    "symbols_usd": ["VZ"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Activision Blizzard Inc.",
    "symbols_eur": ["AIY.F"],
    "symbols_usd": ["ATVI"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Rheinmetall AG",
    "symbols_eur": ["RHM.F"],
    "symbols_usd": ["RNMBF"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "The Mosaic Company",
    "symbols_eur": ["02M.F"],
    "symbols_usd": ["MOS"],
    "tags": ["Basic Materials", "Chemicals", "Agricultural Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "3M Company",
    "symbols_eur": ["MMM.F"],
    "symbols_usd": ["MMM"],
    "tags": ["Industrial Conglomerates", "Industrials"],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "SAF Holland SA",
    "symbols_eur": ["SFQ.F"],
    "symbols_usd": ["SFQ"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Luxembourg"
  },
  {
    "name": "Roper Technologies Inc.",
    "symbols_eur": ["ROP.F"],
    "symbols_usd": ["ROP"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "American Water Works Company Inc.",
    "symbols_eur": ["AWC.F"],
    "symbols_usd": ["AWK"],
    "tags": ["Utilities", "Water Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ABB Ltd",
    "symbols_eur": ["ABJ.F"],
    "symbols_usd": ["ABB"],
    "tags": [
      "Machinery, Equipment & Components",
      "Heavy Electrical Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["Switzerland 20", "OMX Stockholm 30"],
    "country": "Switzerland"
  },
  {
    "name": "Bed Bath & Beyond Inc.",
    "symbols_eur": ["BBY.F"],
    "symbols_usd": ["BBBY"],
    "tags": [
      "Specialty Retailers",
      "Home Furnishings Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Ecolab Inc.",
    "symbols_eur": ["ECJ.F"],
    "symbols_usd": ["ECL"],
    "tags": ["Basic Materials", "Specialty Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "ABN AMRO Group N.V.",
    "symbols_eur": ["AB2.F"],
    "symbols_usd": ["ABMRF"],
    "tags": ["Banks", "Financials"],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Kinnevik AB",
    "symbols_eur": ["IV6C.F"],
    "symbols_usd": ["KNVKF"],
    "tags": ["Financials", "Holding Companies"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Valeo SA",
    "symbols_eur": ["VSA2.F"],
    "symbols_usd": ["VLEEY"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "SMA Solar Technology AG",
    "symbols_eur": ["S92.F"],
    "symbols_usd": ["S92"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "RWE AG",
    "symbols_eur": ["RWE.F"],
    "symbols_usd": ["RWEOY"],
    "tags": ["Multiline Utilities", "Utilities", "Energy"],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "CMS Energy Corporation",
    "symbols_eur": ["CSG.F"],
    "symbols_usd": ["CMS-PB"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Becton, Dickinson and Company",
    "symbols_eur": ["BOX.F"],
    "symbols_usd": ["BDX"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ferrovial SA",
    "symbols_eur": ["UFG.F"],
    "symbols_usd": ["FRRVY"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "Rollins Inc.",
    "symbols_eur": ["RLS.F"],
    "symbols_usd": ["ROL"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "FLIR Systems Inc.",
    "symbols_eur": ["FL4.F"],
    "symbols_usd": ["FLIR"],
    "tags": [
      "Technology",
      "Communications & Networking",
      "Technology Equipment"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Deutsche Lufthansa AG",
    "symbols_eur": ["LHA.F"],
    "symbols_usd": ["DLAKY"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "BB&T Corporation",
    "symbols_eur": ["BBK.F"],
    "symbols_usd": ["BBT"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Danaher Corporation",
    "symbols_eur": ["DAP.F"],
    "symbols_usd": ["DHR"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Advanced Medical Equipment & Technology"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "ASSA ABLOY AB",
    "symbols_eur": ["ALZC.F"],
    "symbols_usd": ["ASAZY"],
    "tags": [
      "Cyclical Consumer Products",
      "Consumer Cyclicals",
      "Construction Supplies & Fixtures",
      "Homebuilding / Household Goods"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Akamai Technologies Inc.",
    "symbols_eur": ["AK3.F"],
    "symbols_usd": ["AKAM"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Royal Dutch Shell PLC",
    "symbols_eur": ["R6C.F"],
    "symbols_usd": ["RDS-A", "R6C3", "RDS-B"],
    "tags": ["Integrated Oil & Gas", "Fossil Fuels", "Oil & Gas", "Energy"],
    "indices": ["AEX", "FTSE 100"],
    "country": "Netherlands"
  },
  {
    "name": "Air Products and Chemicals Inc.",
    "symbols_eur": ["AP3.F"],
    "symbols_usd": ["APD"],
    "tags": ["Basic Materials", "Commodity Chemicals", "Chemicals"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Chubb Limited",
    "symbols_eur": ["AEX.F"],
    "symbols_usd": ["CB"],
    "tags": ["Insurance", "Financials", "Multiline Insurance & Brokers"],
    "indices": ["S&P 500"],
    "country": "Switzerland"
  },
  {
    "name": "Prudential PLC",
    "symbols_eur": ["PRU.F"],
    "symbols_usd": ["PUKPF"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Zimmer Biomet Holdings Inc.",
    "symbols_eur": ["ZIM.F"],
    "symbols_usd": ["ZBH"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Huhtam\u00e4ki Oyj",
    "symbols_eur": ["HUKI.F"],
    "symbols_usd": ["HOYFF"],
    "tags": [
      "Paper Packaging",
      "Containers & Packaging",
      "Applied Resources",
      "Basic Materials"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Cofinimmo SA",
    "symbols_eur": ["COF.F"],
    "symbols_usd": [],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Commercial REITs"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Proximus PLC",
    "symbols_eur": ["BX7.F"],
    "symbols_usd": ["BGAOY"],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["BEL 20"],
    "country": "Belgium"
  },
  {
    "name": "Volkswagen AG",
    "symbols_eur": ["VOW3.F"],
    "symbols_usd": ["VLKAF"],
    "tags": [
      "Automotive",
      "Automobiles & Auto Parts",
      "Auto & Truck Manufacturers",
      "Consumer Cyclicals"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Citrix Systems Inc.",
    "symbols_eur": ["CTX.F"],
    "symbols_usd": ["CTXS"],
    "tags": ["Software & IT Services", "Software", "Technology"],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "The Clorox Company",
    "symbols_eur": ["CXX.F"],
    "symbols_usd": ["CLX"],
    "tags": [
      "Consumer Non-Cyclicals",
      "Personal & Household Products & Services",
      "Household Products"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Bayer AG",
    "symbols_eur": ["BAYN.F"],
    "symbols_usd": ["BAYZF"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["DAX"],
    "country": "Germany"
  },
  {
    "name": "Fielmann AG",
    "symbols_eur": ["FIE.F"],
    "symbols_usd": ["FLMNF"],
    "tags": [
      "Optician",
      "Specialty Retailers",
      "Other Specialty Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "zooplus AG",
    "symbols_eur": ["ZO1.F"],
    "symbols_usd": ["ZLPSF"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "U.S. Bancorp",
    "symbols_eur": ["UB5.F"],
    "symbols_usd": ["USB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Raytheon Company",
    "symbols_eur": ["RTN1.F"],
    "symbols_usd": ["RTN"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "KOENIG & BAUER AG",
    "symbols_eur": ["SKB.F"],
    "symbols_usd": ["SKB"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Stryker Corporation",
    "symbols_eur": ["SYK.F"],
    "symbols_usd": ["SYK"],
    "tags": [
      "Healthcare Equipment & Supplies",
      "Healthcare",
      "Healthcare Services",
      "Medical Equipment, Supplies & Distribution"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Konecranes PLC",
    "symbols_eur": ["K34.F"],
    "symbols_usd": ["KNCRY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Johnson Controls International PLC",
    "symbols_eur": ["TYIA.F"],
    "symbols_usd": ["JCI"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "Sysco Corporation",
    "symbols_eur": ["SYY.F"],
    "symbols_usd": ["SYY"],
    "tags": [
      "Food & Drug Retailing",
      "Food Retail & Distribution",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Lowe's Companies Inc.",
    "symbols_eur": ["LWE.F"],
    "symbols_usd": ["LOW"],
    "tags": [
      "Specialty Retailers",
      "Home Improvement Products & Services Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Charter Communications Inc.",
    "symbols_eur": ["CQD.F"],
    "symbols_usd": ["CHTR"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Baidu Inc.",
    "symbols_eur": ["B1C.F"],
    "symbols_usd": ["BIDU"],
    "tags": ["Software & IT Services", "Internet Services", "Technology"],
    "indices": ["NASDAQ 100"],
    "country": "China"
  },
  {
    "name": "Sirius XM Holdings Inc.",
    "symbols_eur": ["RDO.F"],
    "symbols_usd": ["SIRI"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Consumer Cyclicals",
      "Broadcasting"
    ],
    "indices": ["NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Cincinnati Financial Corporation",
    "symbols_eur": ["CCJ.F"],
    "symbols_usd": ["CINF"],
    "tags": ["Property & Casualty Insurance", "Financials", "Insurance"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Metso Corporation",
    "symbols_eur": ["VLM.F"],
    "symbols_usd": ["MXCYY"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrial Machinery & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "DEUTZ AG",
    "symbols_eur": ["DEZ.F"],
    "symbols_usd": ["DEUZF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Viacom Inc.",
    "symbols_eur": ["VCXA.F"],
    "symbols_usd": ["VIAB"],
    "tags": [
      "Cyclical Consumer Services",
      "Media & Publishing",
      "Entertainment Production",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Capgemini SE",
    "symbols_eur": ["CGM.F"],
    "symbols_usd": ["CAPMF"],
    "tags": [
      "IT Services & Consulting",
      "Technology",
      "Software & IT Services"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Kingfisher PLC",
    "symbols_eur": ["KFI1.F"],
    "symbols_usd": ["KGFHY"],
    "tags": [
      "Specialty Retailers",
      "Home Improvement Products & Services Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Swiss Life Holding AG",
    "symbols_eur": ["SLW.F"],
    "symbols_usd": ["SWSDF"],
    "tags": ["Insurance", "Financials", "Life & Health Insurance"],
    "indices": ["Switzerland 20"],
    "country": "Switzerland"
  },
  {
    "name": "Fresnillo PLC",
    "symbols_eur": ["FNL.F"],
    "symbols_usd": ["FNLPF"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["FTSE 100"],
    "country": "Mexico"
  },
  {
    "name": "Koninklijke DSM N.V.",
    "symbols_eur": ["DSM2.F"],
    "symbols_usd": ["KDSKF"],
    "tags": [
      "Diversified Chemicals",
      "Apparel & Accessories",
      "Cyclical Consumer Products",
      "Basic Materials",
      "Consumer Cyclicals",
      "Textiles & Apparel",
      "Chemicals"
    ],
    "indices": ["AEX"],
    "country": "Netherlands"
  },
  {
    "name": "Boliden AB",
    "symbols_eur": ["BWJQ.F"],
    "symbols_usd": ["BDNNY"],
    "tags": [
      "Metals & Mining",
      "Specialty Mining & Metals",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "1&1 Drillisch AG",
    "symbols_eur": ["DRI.F"],
    "symbols_usd": [],
    "tags": [
      "Telecommunications Services",
      "Wireless Telecommunications Services"
    ],
    "indices": ["TECDAX", "MDAX"],
    "country": "Germany"
  },
  {
    "name": "Berkeley Group Holdings/The",
    "symbols_eur": ["BKG.F"],
    "symbols_usd": ["BKG"],
    "tags": [
      "Cyclical Consumer Products",
      "Homebuilding",
      "Consumer Cyclicals",
      "Homebuilding / Household Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "Eaton Corporation PLC",
    "symbols_eur": ["3EC.F"],
    "symbols_usd": ["ETN"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["S&P 500"],
    "country": "Ireland"
  },
  {
    "name": "The Kraft Heinz Company",
    "symbols_eur": ["KHNZ.F"],
    "symbols_usd": ["KHC"],
    "tags": [
      "Food & Tobacco",
      "Food & Beverages",
      "Food Processing",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "Freeport-McMoRan Inc.",
    "symbols_eur": ["FPMB.F"],
    "symbols_usd": ["FCX"],
    "tags": [
      "Metals & Mining",
      "Integrated Mining",
      "Mineral Resources",
      "Basic Materials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Telefonaktiebolaget LM Ericsson",
    "symbols_eur": ["ERCB.F"],
    "symbols_usd": ["ERIXF"],
    "tags": ["Telecommunications equipment", "Networking equipment"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Investor AB",
    "symbols_eur": ["IVSA.F"],
    "symbols_usd": ["IVSXF"],
    "tags": ["Financials", "Holding Companies"],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Krones AG",
    "symbols_eur": ["KRN.F"],
    "symbols_usd": ["KRNNF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "CBRE Group Inc.",
    "symbols_eur": ["RF6.F"],
    "symbols_usd": ["CBRE"],
    "tags": [
      "Real Estate",
      "Real Estate Services",
      "Financials",
      "Real Estate Operations"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "HELLA GmbH & Co. KGaA",
    "symbols_eur": ["HLE.F"],
    "symbols_usd": ["HLKHF"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Eli Lilly and Company",
    "symbols_eur": ["LLY.F"],
    "symbols_usd": ["LLY"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "SBA Communications Corporation",
    "symbols_eur": ["4SB.F"],
    "symbols_usd": ["SBAC"],
    "tags": [
      "Real Estate",
      "Financials",
      "Residential & Commercial RETIs",
      "Specialized REITs"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "CVS Health Corporation",
    "symbols_eur": ["CVS.F"],
    "symbols_usd": ["CVS"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Healthcare Facilities & Services"
    ],
    "indices": ["S&P 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "TUI AG",
    "symbols_eur": ["TUI1.F"],
    "symbols_usd": ["TUIFF"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["FTSE 100"],
    "country": "Germany"
  },
  {
    "name": "Aareal Bank AG",
    "symbols_eur": ["ARL.F"],
    "symbols_usd": ["AAALF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Steinhoff International Holdings N.V.",
    "symbols_eur": ["SNH.F"],
    "symbols_usd": ["STHHF"],
    "tags": [
      "Specialty Retailers",
      "Home Furnishings Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "South Africa"
  },
  {
    "name": "Valmet Oyj",
    "symbols_eur": ["2VO.F"],
    "symbols_usd": ["VOYJF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrial Machinery & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["OMX Helsinki 25"],
    "country": "Finland"
  },
  {
    "name": "Pfizer Inc.",
    "symbols_eur": ["PFE.F"],
    "symbols_usd": ["PFE"],
    "tags": [
      "Healthcare",
      "Pharmaceuticals & Medical Research",
      "Pharmaceuticals"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "Acciona SA",
    "symbols_eur": ["AJ3.F"],
    "symbols_usd": ["ACXIF"],
    "tags": [
      "Industrial & Commercial Services",
      "Construction & Engineering",
      "Industrials"
    ],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "CarMax Inc.",
    "symbols_eur": ["XA4.F"],
    "symbols_usd": ["KMX"],
    "tags": [
      "Specialty Retailers",
      "Consumer Cyclicals",
      "Retailers",
      "Auto Vehicles, Parts & Service Retailers"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ctrip.com International, Ltd.",
    "symbols_eur": ["CLV.F"],
    "symbols_usd": ["CTRP"],
    "tags": [
      "Leisure & Recreation",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100"],
    "country": "China"
  },
  {
    "name": "Regions Financial Corporation",
    "symbols_eur": ["RN7.F"],
    "symbols_usd": ["RF-PB"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Xilinx Inc.",
    "symbols_eur": ["XIX.F"],
    "symbols_usd": ["XLNX"],
    "tags": [
      "Semiconductors",
      "Technology Equipment",
      "Semiconductors & Semiconductor Equipment",
      "Technology"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "TELE COLUMBUS AG",
    "symbols_eur": ["TC1.F"],
    "symbols_usd": [],
    "tags": [
      "Telecommunications Services",
      "Integrated Telecommunications Services"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Nucor Corporation",
    "symbols_eur": ["NUO.F"],
    "symbols_usd": ["NUE"],
    "tags": [
      "Metals & Mining",
      "Mineral Resources",
      "Steel",
      "Basic Materials"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Safran SA",
    "symbols_eur": ["SEJ1.F"],
    "symbols_usd": ["SAFRF"],
    "tags": ["Industrials", "Aerospace & Defense", "Industrial Goods"],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Aumann AG",
    "symbols_eur": ["AAG.F"],
    "symbols_usd": ["AUUMF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Actividades de Construcci\u00f3n y Servicios SA",
    "symbols_eur": ["OCI1.F"],
    "symbols_usd": ["ACSAF"],
    "tags": ["Engineering & Construction", "Industrials"],
    "indices": ["IBEX 35"],
    "country": "Spain"
  },
  {
    "name": "The Coca-Cola Company",
    "symbols_eur": ["CCC3.F"],
    "symbols_usd": ["KO"],
    "tags": [
      "Beverages",
      "Non-Alcoholic Beverages",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["S&P 500", "DOW JONES", "S&P 100"],
    "country": "United States"
  },
  {
    "name": "BorgWarner Inc.",
    "symbols_eur": ["BGW.F"],
    "symbols_usd": ["BWA"],
    "tags": [
      "Auto, Truck & Motorcycle Parts",
      "Automobiles & Auto Parts",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Kansas City Southern",
    "symbols_eur": ["KCY.F"],
    "symbols_usd": ["KSU"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Ceconomy St.",
    "symbols_eur": ["CEC.F"],
    "symbols_usd": [],
    "tags": [
      "Specialty Retailers",
      "Computer & Electronics Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "CSX Corporation",
    "symbols_eur": ["CXR.F"],
    "symbols_usd": ["CSX"],
    "tags": [
      "Freight & Logistics Services",
      "Industrials",
      "Ground Freight & Logistics",
      "Transportation"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Securitas AB",
    "symbols_eur": ["S7MB.F"],
    "symbols_usd": ["SCTBF"],
    "tags": [
      "Industrial & Commercial Services",
      "Industrials",
      "Professional & Commercial Services",
      "Business Support Services"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Swedish Match AB",
    "symbols_eur": ["SWM.F"],
    "symbols_usd": ["SWMAF"],
    "tags": [
      "Food & Tobacco",
      "Tobacco",
      "Consumer Non-Cyclicals",
      "Food & Beverages"
    ],
    "indices": ["OMX Stockholm 30"],
    "country": "Sweden"
  },
  {
    "name": "Broadridge Financial Solutions Inc.",
    "symbols_eur": ["5B9.F"],
    "symbols_usd": ["BR"],
    "tags": [
      "Industrial & Commercial Services",
      "Professional Information Services",
      "Industrials",
      "Professional & Commercial Services"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Brown-Forman Corporation",
    "symbols_eur": ["BF5B.F"],
    "symbols_usd": ["BF-B"],
    "tags": [
      "Distillers & Wineries",
      "Beverages",
      "Food & Beverages",
      "Consumer Non-Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Uniper SE",
    "symbols_eur": ["UN01.F"],
    "symbols_usd": ["UNPRF"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Melrose Industries PLC",
    "symbols_eur": ["27MA.F"],
    "symbols_usd": ["MLSPF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Electrical Components & Equipment",
      "Industrials",
      "Industrial Goods"
    ],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  },
  {
    "name": "American Airlines Group Inc.",
    "symbols_eur": ["A1G.F"],
    "symbols_usd": ["AAL"],
    "tags": [
      "Airlines",
      "Industrials",
      "Passenger Transportation Services",
      "Transportation"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Cr\u00e9dit Agricole SA",
    "symbols_eur": ["XCA.F"],
    "symbols_usd": ["CRARF"],
    "tags": [
      "Banking Services",
      "Financials",
      "Banking & Investment Services",
      "Banks"
    ],
    "indices": ["CAC 40"],
    "country": "France"
  },
  {
    "name": "Amazon.com Inc.",
    "symbols_eur": ["AMZ.F"],
    "symbols_usd": ["AMZN"],
    "tags": [
      "Diversified Retail",
      "Department Stores",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 100", "S&P 500", "NASDAQ 100"],
    "country": "United States"
  },
  {
    "name": "KION GROUP AG",
    "symbols_eur": ["KGX.F"],
    "symbols_usd": ["KNNGF"],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Heavy Machinery & Vehicles",
      "Industrial Goods"
    ],
    "indices": ["MDAX"],
    "country": "Germany"
  },
  {
    "name": "Tractor Supply Company",
    "symbols_eur": ["TR4.F"],
    "symbols_usd": ["TSCO"],
    "tags": [
      "Specialty Retailers",
      "Other Specialty Retailers",
      "Retailers",
      "Consumer Cyclicals"
    ],
    "indices": ["NASDAQ 100", "S&P 500"],
    "country": "United States"
  },
  {
    "name": "Anthem Inc.",
    "symbols_eur": ["A58.F"],
    "symbols_usd": ["ANTM"],
    "tags": [
      "Healthcare",
      "Healthcare Providers & Services",
      "Healthcare Services",
      "Managed Health care"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "Sempra Energy",
    "symbols_eur": ["SE4.F"],
    "symbols_usd": ["SRE"],
    "tags": ["Multiline Utilities", "Utilities"],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "DMG Mori AG",
    "symbols_eur": ["GIL.F"],
    "symbols_usd": [],
    "tags": [
      "Machinery, Equipment & Components",
      "Industrials",
      "Industrial Goods",
      "Industrial Machinery & Equipment"
    ],
    "indices": ["SDAX"],
    "country": "Germany"
  },
  {
    "name": "Neste Oyj",
    "symbols_eur": ["NEF.F"],
    "symbols_usd": ["NTOIY"],
    "tags": [
      "Oil & Gas Refining and Marketing",
      "Fossil Fuels",
      "Oil & Gas",
      "Energy"
    ],
    "indices": ["OMX Helsinki 25", "OMX Helsinki 15"],
    "country": "Finland"
  },
  {
    "name": "Darden Restaurants Inc.",
    "symbols_eur": ["DDN.F"],
    "symbols_usd": ["DRI"],
    "tags": [
      "Restaurants & Bars",
      "Cyclical Consumer Services",
      "Hotels & Entertainment Services",
      "Consumer Cyclicals"
    ],
    "indices": ["S&P 500"],
    "country": "United States"
  },
  {
    "name": "STERIS PLC",
    "symbols_eur": ["2TG.F"],
    "symbols_usd": ["STE"],
    "tags": ["Electric Utilities", "Utilities", "Electric Utilities & IPPs"],
    "indices": ["FTSE 100"],
    "country": "United Kingdom"
  }
];
